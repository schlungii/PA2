## Project Overview
This repository contains all data files, Jupyter notebooks, and scripts used in the PA2 analysis workflow. It documents every step from raw data preprocessing to feature extraction, distance calculations, statistical evaluation, and automated execution of JATI jobs.
All components are organized to ensure that the results are fully transparent and reproducible.

## Repository Structure
```
.
├── Data.csv                             # Main dataset used for analysis
├── Best_Tree_RF_Distances.csv           # Computed Robinson–Foulds distances
│
├── Filtering_Raw_Data.ipynb             # Cleaning and preprocessing of raw data
├── Key_Measurement_Variables.ipynb      # Definition and extraction of key variables
├── Best_Tree_RF_Distances.ipynb         # RF distance computation and tree comparison
├── Evaluation_of_the_Results.ipynb      # Final evaluation and validation of findings
│
├── jati_pip_parameters_directory.submit # JATI job parameter configuration
├── submit_all.sh                        # Batch wrapper for submitting multiple JATI jobs
│
└── README.md                            # This documentation
```

## Description of Files
### Data Files
**Data.csv**
- Primary dataset used throughout preprocessing, feature engineering, and analysis.

**Best_Tree_RF_Distances.csv**
- Contains the computed Robinson–Foulds (RF) distances between phylogenetic trees, produced during tree comparison workflows.

### Jupyter Notebooks
**Filtering_Raw_Data.ipynb**
- Loading of the raw dataset
- Data cleaning and consistency checks
- Normalization and transformation steps
- Export of processed data for further use

**Key_Measurement_Variables.ipynb**
- Extraction and definition of essential measurement variables
- Feature engineering workflow
- Preparation of variables required for RF and statistical analyses

**Best_Tree_RF_Distances.ipynb**
- Computation of RF distances between candidate trees
- Comparison and selection of the best-fitting phylogenetic structures
- Output generation: *Best_Tree_RF_Distances.csv*

**Evaluation_of_the_Results.ipynb**
- Assessment of result quality
- Validation based on defined performance metrics
- Consolidation and discussion of conclusions

### Scripts
**submit_all.sh**
- A wrapper script that automatically submits JATI jobs for all sequence files (.fasta, .fas, .aln) found in a specified input directory.
Based on the script contents submit_all, it performs:
  - Directory scanning for sequence files
  - Automated sbatch submission for each sequence
  - Passing of parameters such as MODEL, GAPS, EPSILON, MAX_ITERS
  - Creation of log files for each job
  - Structured handling of output directories
This script enables reproducible and scalable batch execution.

**jati_pip_parameters_directory.submit**
- Configuration file containing the job parameters for JATI runs.
- It is used by submit_all.sh to dispatch jobs with consistent settings.

## Running the Notebooks
### Requirements
- Python 3.12.2
- Jupyter Notebook

### Python packages
- Bio (Biopython)
- datetime
- ete3
- glob
- io
- itertools
- matplotlib
- numpy
- os
- pandas
- re
- seaborn

## Author
- Elena Punginelli (pungiele)
- ADLS23
- PA2 - 2025
