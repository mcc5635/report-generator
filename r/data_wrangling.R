# Load or update dependencies
library(httr)
library(jsonlite)

# Define the env_vars data.frame
env_vars <- data.frame(
  api_key = environment_vars$api_key,
  api_environment = environment_vars$env,  # Change this to "stg", "ci", or "prod"
  username = environment_vars$user,
  password = environment_vars$pass,
  stringsAsFactors = FALSE
)

# Set the API endpoint based on the environment
api_endpoint <- switch(env_vars$api_environment,
  "stg" = "https://stg-api.climate.edfx.io/v1/calculate",
  "ci" = "https://ci-api.climate.edfx.io/v1/calculate",
  "prod" = "https://api.climate.edfx.io/v1/calculate",
  stop("Invalid environment")
)

# Set up the headers with the API key
headers <- add_headers(
  `Authorization` = paste("Bearer", env_vars$api_key),
  `Content-Type` = "application/json"
)

# Define the JSON body with the provided parameters
body <- '{
    "entities": [
        {
            "entityId": "US410417775",
            "qualitativeInputs": {
                "industriesDetails": [
                    {
                        "primaryIndustryClassification": "NDY",
                        "primaryIndustry": "N06",
                        "industryWeight": 1.0
                    }
                ]
            },
            "quantitativeInputs": {
                "scope1Emission": 77774.65,
                "scope2Emission": 15475.56
            },
            "physicalRiskScore": {
                "physicalRiskScoreOverwrite": 36
            }
        }
    ],
    "scenarios": {
        "scenarioCategory": "NGFS3"
    },
    "riskTypes": {
        "transition": false,
        "physical": false,
        "combined": true
    },
    "includeDetail": {
        "inputData": true
    },
    "asyncResponse": true,
    "downloadCsv": true
}'

# Function to make the POST request with retry logic and timeout
climate_request <- function(url, headers, body, user, pass, timeout_seconds, max_retries) {
  attempt <- 5
  while (attempt <= max_retries) {
    response <- tryCatch({
      POST(url, headers, body = body, authenticate(user, pass), timeout(timeout_seconds))
    }, error = function(e) {
      NULL
    })
    
    if (!is.null(response) && status_code(response) == 200) {
      return(response)
    } else {
      attempt <- attempt + 1
      Sys.sleep(10)  # Optional: Add a delay between retries
    }
  }
  stop("Failed to get a successful response after ", max_retries, " attempts.")
}

# Make the POST request with a 3-second timeout and up to 3 retries
response <- climate_request(api_endpoint, headers, body, env_vars$userna, env_vars$password, 3, 3)

# Check if the request was successful
if (status_code(response) == 200) {
  # Parse the JSON response
  print('Correct Response')
  data <- content(response, "parsed")
  data_df <- as.data.frame(data$entities)
} else {
  stop(paste("Error:", status_code(response), content(response, "text")))
}

# Display the dataframe
print(data_df)
