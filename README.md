
# Basic Template for PDF Report Generator Microservice

This repository provides a basic template for generating PDF reports using R Markdown and other necessary tools. Below is a walkthrough of the directory structure and the purpose of each file and directory.

## Directory Structure

```
report-generator/
│
├── renv/
│   ├── .gitignore
│   ├── activate.R
│   ├── settings.dcf
│   └── settings.json
│
├── r/
│   └── data_wrangling.R
│
├── climate-reports/
│   └── june-report.Rmd
|
├── styling/
│   ├── .gitignore
│   ├── custom.scss
│   ├── macros.js
│   ├── slides.Rmd
│   ├── style-based-bootstrap-more.Rmd
│   └── style-based-bootstrap.Rmd
|
├── assets/
│   ├── cover.png
│   ├── emission_types.png
│   └── risk-types.png
│
├── .DS_Store
├── .Rprofile
├── .gitignore
├── LICENSE
├── Makefile
├── renv.lock
└── report-generator.Rproj
```

## Usage

### Setting Up the Environment

1. **Clone the repository**:
   ```sh
   git clone <repository-url>
   cd report-generator
   ```

2. **Initialize `renv`**:
   Make sure you have `renv` installed. If not, install it first:
   ```R
   install.packages("renv")
   ```
   Then initialize `renv`:
   ```R
   renv::init()
   ```

3. **Restore the environment**:
   ```R
   renv::restore()
   ```

### Building the Project

- To generate the PDF report, use the `Makefile`:
  ```sh
  make
  ```

- To clean up generated files:
  ```sh
  make clean
  ```

### Customizing the Slides

- Modify the `styling/slides.Rmd` file to customize the report slides.
- Use `styling/custom.scss` for custom styling.

### Contributions

Contributions are welcome! Please fork this repository and submit a pull request.

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
