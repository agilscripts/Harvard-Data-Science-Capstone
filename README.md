# MovieLens Recommendation System Project

## Overview

This project was created as part of the **HarvardX Data Science Capstone**. The goal of the capstone is to build a **movie recommendation system** using the **MovieLens dataset**. The project aims to predict user ratings for movies and evaluate the model’s performance using **Root Mean Square Error (RMSE)**, which is a standard evaluation metric for recommendation systems.

The project is implemented in two environments:
- **Python** using Jupyter Notebooks.
- **R**, with the code written in both R scripts and R Markdown for documentation and reproducibility.

Both implementations were created to demonstrate the ability to use multiple programming tools to tackle the same problem.

## Project Structure

The repository is organized as follows:

```
├── Capstone.ipynb               # Python Jupyter Notebook with the movie recommendation system implementation
├── MovieReviews.R               # R script for recommendation system
├── MovieReviews.Rmd             # R Markdown report for the R implementation
├── MovieReviews.pdf             # Knitted PDF report of the R implementation
├── README.md                    # This file
├── links.csv                    # MovieLens links dataset
├── movies.csv                   # MovieLens movies dataset
├── ratings.csv                  # MovieLens ratings dataset
├── tags.csv                     # MovieLens tags dataset
```

## Datasets

The **MovieLens dataset** used in this project is a well-known dataset for movie recommendation systems. The subset used in this project includes:

- `ratings.csv`: User ratings for movies
- `movies.csv`: Movie titles and genres
- `tags.csv`: User-generated tags associated with movies
- `links.csv`: Identifiers for linking to external movie data sources (IMDB, TMDb)

## Requirements

### Python Environment

To run the Python implementation, you will need the following libraries:

- `pandas`
- `numpy`
- `scikit-learn`
- Jupyter Notebook

You can install the necessary packages using `pip`:

```bash
pip install pandas numpy scikit-learn jupyter
```

### R Environment

To run the R implementation, the following R packages are required:

- `tidyverse`
- `caret`

You can install these packages in R using:

```r
install.packages("tidyverse")
install.packages("caret")
```

## Running the Project

### Python (Jupyter Notebook)

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/movielens-project.git
   ```

2. Navigate to the project directory and open the Jupyter notebook:
   ```bash
   cd movielens-project
   jupyter notebook Capstone.ipynb
   ```

3. Run the cells in the notebook to execute the code and view the results.

### R

1. Open **MovieReviews.Rmd** in RStudio for a report version, or **MovieReviews.R** for the script version.
2. Run the script or knit the `.Rmd` file to view the output.

## Model Development

The project involves:
- Splitting the dataset into **training** (`edx`) and **validation** (`final_holdout_test`) sets.
- Training a baseline model to predict movie ratings.
- Using **RMSE** to evaluate model performance.

### Baseline Model:
- The current implementation uses the **average movie rating** as a baseline model.
- The baseline model produced an **RMSE of 0.9617**, indicating how closely the model's predictions align with actual user ratings.
