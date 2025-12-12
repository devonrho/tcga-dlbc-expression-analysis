# TCGA-DLBC Gene Expression Analysis

This project analyzes RNA-seq gene expression data from **Diffuse Large B-Cell Lymphoma (DLBC)** using data from **The Cancer Genome Atlas (TCGA)**. The goal is to explore structure in gene expression profiles and to demonstrate the full data science lifecycle, including data collection, preparation, exploratory analysis, and later predictive and inferential steps.

All analyses are fully reproducible using Docker and Jupyter Lab.

---

## Data Source

- Project: TCGA-DLBC  
- Data type: RNA-seq gene expression (STAR unstranded counts)  
- Source: NCI Genomic Data Commons (GDC)  

Raw data are not stored in this repository and are downloaded programmatically.

---

## Repository Structure

Dockerfile  
run.sh  
notebooks/  
  01_make_manifest_dlbc_counts.ipynb  
  02_build_dlbc_counts_matrix.ipynb  
  03_qc_and_normalization.ipynb  
  04_exploratory_analysis.ipynb  
data/ (generated locally; not tracked)  
.gitignore  
README.md  

---

## Notebook Overview

**01_make_manifest_dlbc_counts.ipynb**  
Queries the GDC API and creates a download manifest for TCGA-DLBC RNA-seq files.

**02_build_dlbc_counts_matrix.ipynb**  
Downloads STAR count files, extracts unstranded gene counts, removes non-gene rows, and constructs a genes × samples count matrix.

**03_qc_and_normalization.ipynb**  
Performs quality control, filters low-expression genes, normalizes counts to CPM, and applies a log₂(CPM + 1) transformation.

**04_exploratory_analysis.ipynb**  
Conducts exploratory analysis, including PCA, to assess structure in gene expression profiles.

---

## Reproducible Environment

This project uses Docker to ensure a consistent computational environment.

Build the image:
```bash
docker build -t tcga-dsci 

Run Jupyter Lab from the project root:

./run.sh

Jupyter Lab will be available at: http://127.0.0.1:8888

Notes on Reproducibility
	•	Raw TCGA data are downloaded dynamically and are not version-controlled
	•	All preprocessing and analysis steps are documented in notebooks
	•	The project can be reproduced by running the notebooks in order

Author
Devon Rhodes

