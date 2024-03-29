# README and Replication Guidance

## Overview

## Data Availability and Provenance

### Statement of Availablity and Rights

- [ ] This paper does not involve analysis of external data (i.e., no
  data are used or the only data are generated by the authors via
  simulation in their code).

- [ ] I certify that the author(s) of the manuscript have legitimate
  access to and permission to use the data used in this manuscript.

- [ ] I certify that the author(s) of the manuscript have documented
  permission to redistribute/publish the data contained within this
  replication package. Appropriate permission are documented in the
  [LICENSE.txt](LICENSE.txt) file.

- [ ] All data **are** publicly available.

- [ ] Some data **cannot be made** publicly available.

- [ ] **No data can be made** publicly available.

### Data Sources

| ID  | Data.Source                         | Data.Files                                                                                               | Directory      | Provided | Citation              |
|-----|-------------------------------------|----------------------------------------------------------------------------------------------------------|----------------|----------|-----------------------|
| 1   | “Current Population Survey 2018”    | cepr_march_2018.dta                                                                                      | data/          | TRUE     | CEPR (2018)           |
| 2   | “Provincial Administration Reports” | coast_simplepoint2.csv; rivers_simplepoint2.csv; RAIL_dummies.dta; railways_Dissolve_Simplify_point2.csv | Data/maps/     | TRUE     | Administration (2017) |
| 3   | “2017 SAT scores”                   | Not available                                                                                            | data/to_clean/ | FALSE    | College Board (2020)  |

#### Details on Data Source 1

<!-- see data source examples: https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html ---->

## Files

### Dataset List

All dataset files can be found in `data` in the following subfolders:

- `data/raw/` contains raw datafiles and codebooks
- `data/interim/` is generated by the main script to store intermediate
  data outputs
- `data/analysis/` contains all data used in the main analysis

| Dataset.File                         | Codebook                    | Data.Source.ID                                                               | Notes        | Provided |
|--------------------------------------|-----------------------------|------------------------------------------------------------------------------|--------------|----------|
| `data/raw/lbd.dta`                   | `data/raw/lbd-codebook.pdf` | LBD                                                                          | Confidential | No       |
| `data/raw/terra.dta`                 | IPUMS Terra                 | As per terms of use                                                          | Yes          |          |
| `data/analysis/regression_input.dta` | All listed                  | Combines multiple data sources, serves as input for Table 2, 3 and Figure 5. | Yes          |          |

### Code/Program Details

All code can be found in the folder `code`

| Code.File                   | Notes                                |
|-----------------------------|--------------------------------------|
| `00_setup/main-setup.do`    |                                      |
| `00_setup/download-data.sh` | bash script for downloading datasets |
| `01_dataprep/main.do`       | main replication script              |

## Computational Requirements

<!---- see instructions: https://social-science-data-editors.github.io/template_README/template-README.html --->

### Software

R version 4.3.1 (2023-06-16) Platform: aarch64-apple-darwin20 (64-bit)
Running under: macOS Ventura 13.4.1

Matrix products: default BLAS:
/System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
LAPACK:
/Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/lib/libRlapack.dylib;
LAPACK version 3.11.0

locale: \[1\]
en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

time zone: Australia/Melbourne tzcode source: internal

attached base packages: \[1\] stats graphics grDevices utils datasets
methods base

loaded via a namespace (and not attached): \[1\] compiler_4.3.1
cli_3.6.1 jsonlite_1.8.7 rlang_1.1.1

### Controlled Randomness

Random seed is set at line \_\_\_ of program \_\_\_

### Memory and Runtime

## Replication Guidance

<!---- see instructions: https://social-science-data-editors.github.io/template_README/template-README.html --->

### Summary Instructions

- Edit `code/config.do` to adjust the default path
- Run `code/00_setup/main-setup.do` once on a new system to set up the
  working environment.
- Download the data files referenced above. Each should be stored in the
  prepared subdirectories of `data/`, in the format that you download
  them in. Do not unzip. Scripts are provided in each directory to
  download the public-use files. Confidential data files requested as
  part of your FSRDC project will appear in the `/data` folder. No
  further action is needed on the replicator’s part.
- Run `programs/01_main.do` to run all steps in sequence.

### Pipeline Details

- `code/00_setup/main-setup.do`: will create all output directories,
  install needed ado packages.
  - If wishing to update the ado packages used by this archive, change
    the parameter `update_ado` to `yes`. However, this is not needed to
    successfully reproduce the manuscript tables.
- `code/01_dataprep/`:
  - These programs were last run at various times in 2018.
  - Order does not matter, all programs can be run in parallel, if
    needed.
  - A `code/01_dataprep/main.do` will run them all in sequence, which
    should take about 2 hours.
- `code/02_analysis/main.do`.
  - If running programs individually, note that ORDER IS IMPORTANT.
  - The programs were last run top to bottom on July 4, 2019.
- `code/03_appendix/main-appendix.do`. The programs were last run top to
  bottom on July 4, 2019.

### Tables and Figures

The provided code reproduces:

- [ ] All numbers provided in text in the paper
- [ ] All tables and figures in the paper
- [ ] Selected tables and figures in the paper, as explained and
  justified below.

| Figure/Table \# | Program                   | Line Number | Output file              | Note                       |
|-----------------|---------------------------|-------------|--------------------------|----------------------------|
| Table 1         | 02_analysis/table1.do     |             | results/summarystats.csv |                            |
| Table 2         | 02_analysis/table2and3.do | 15          | table2.csv               |                            |
| Table 3         | 02_analysis/table2and3.do | 145         | table3.csv               |                            |
| Figure 1        | n.a. (no data)            |             |                          | Source: Herodus (2011)     |
| Figure 2        | 02_analysis/fig2.do       |             | figure2.png              |                            |
| Figure 3        | 02_analysis/fig3.do       |             | figure-robustness.png    | Requires confidential data |

- Figure 1: The figure can be reproduced using the data provided in the
  folder “2_data/data_map”, and ArcGIS Desktop (Version 10.7.1) by
  following these (manual) instructions:
  - Create a new map document in ArcGIS ArcMap, browse to the folder
    “2_data/data_map” in the “Catalog”, with files
    “provinceborders.shp”, “lakes.shp”, and “cities.shp”.
  - Drop the files listed above onto the new map, creating three
    separate layers. Order them with “lakes” in the top layer and
    “cities” in the bottom layer.
  - Right-click on the cities file, in properties choose the variable
    “health”… (more details)

## References

## Acknowledgements
