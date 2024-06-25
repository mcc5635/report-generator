
# Basic Template for PDF Report Generator Microservice

This repository provides a basic template for generating PDF reports using R Markdown and other necessary tools. Below is a walkthrough of the directory structure and the purpose of each file and directory.

## Directory Structure

```
meetup-2021-rmd-business-report/
│
├── renv/
│   ├── .gitignore
│   ├── activate.R
│   ├── settings.dcf
│   └── settings.json
│
├── slides/
│   ├── .gitignore
│   ├── Change-style-in-word.png
│   ├── custom.scss
│   ├── macros.js
│   ├── rmarkdown_wizards.png
│   ├── slides.Rmd
│   └── style-based-bootstrap.png
│
├── .DS_Store
├── .Rprofile
├── .gitignore
├── LICENSE
├── Makefile
├── README.md
├── carbon-markets.jpg
├── cover.png
├── culmen_depth.png
├── lter_penguins.png
├── penguins-report.Rmd
├── renv.lock
├── report-generator.Rproj
├── styling-bootstrap.Rmd
└── styling-bootstrap-more.Rmd
```

## File and Directory Details

### renv/
- **.gitignore**: Specifies intentionally untracked files to ignore.
- **activate.R**: Used to activate the `renv` environment.
- **settings.dcf**: Configuration settings for `renv`.
- **settings.json**: Additional settings for `renv`.

### slides/
- **.gitignore**: Specifies files to ignore in this directory.
- **Change-style-in-word.png**: Image file used in presentations.
- **custom.scss**: Custom stylesheets for the slides.
- **macros.js**: JavaScript macros for enhancing slides.
- **rmarkdown_wizards.png**: Image file used in presentations.
- **slides.Rmd**: R Markdown file for generating slides.
- **style-based-bootstrap.png**: Image file for styling examples.

### Root Directory Files
- **.DS_Store**: Stores custom attributes of the folder.
- **.Rprofile**: R configuration profile.
- **.gitignore**: Specifies intentionally untracked files to ignore.
- **LICENSE**: The license for the repository.
- **Makefile**: Contains rules for building the project.
- **README.md**: This file, providing an overview of the repository.
- **carbon-markets.jpg**: Image file used in the report.
- **cover.png**: Cover image for the report.
- **culmen_depth.png**: Image file used in the report.
- **lter_penguins.png**: Image file used in the report.
- **penguins-report.Rmd**: Main R Markdown file for generating the PDF report.
- **renv.lock**: Lock file for `renv` to ensure reproducible environments.
- **report-generator.Rproj**: RStudio project file.
- **styling-bootstrap.Rmd**: R Markdown file with styling examples.
- **styling-bootstrap-more.Rmd**: Additional R Markdown file with more styling examples.

## Usage

### Setting Up the Environment

1. **Clone the repository**:
   ```sh
   git clone <repository-url>
   cd meetup-2021-rmd-business-report
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

- Modify the `slides/slides.Rmd` file to customize the presentation slides.
- Use `slides/custom.scss` for custom styling.

### Contributions

Contributions are welcome! Please fork this repository and submit a pull request.

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
