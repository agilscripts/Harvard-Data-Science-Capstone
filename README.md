# MovieLens Recommendation System Project

## Overview

This project is part of the HarvardX Data Science series, focused on building a movie recommendation system using the MovieLens dataset. The goal of the project is to predict user ratings for movies using machine learning models and to evaluate the performance of these predictions using Root Mean Square Error (RMSE).

The project includes two implementations: one in Python using Jupyter Notebooks, and the other in R. The R version will be added soon.

## Project Structure

The repository is organized as follows:

```
├── Movie Files/                # Contains the MovieLens dataset CSV files (ratings, movies, links, tags)
├── notebooks/                  # Jupyter notebooks for Python implementation
│   ├── movielens_project.ipynb # Python notebook with the movie recommendation system implementation
├── R/                          # Directory for R scripts (R implementation coming soon)
│   ├── movielens_project.R     # R script for recommendation system (to be added)
├── README.md                   # This file
```

## Datasets

The MovieLens dataset used in this project is a subset of a much larger dataset. It includes the following CSV files:

- `ratings.csv`: Contains user ratings for movies
- `movies.csv`: Contains movie titles and genres
- `tags.csv`: Contains user tags associated with movies
- `links.csv`: Contains identifiers that can be used to link to other sources of movie data

## Requirements

### Python Environment

To run the Python implementation, you will need the following libraries:

- pandas
- numpy
- scikit-learn
- Jupyter Notebook (for running the `.ipynb` file)

You can install the necessary packages using `pip`:

```bash
pip install pandas numpy scikit-learn jupyter
```

### R Environment

The R implementation uses the following libraries:

- `tidyverse`
- `caret`

You can install these packages in R using:

```r
install.packages("tidyverse")
install.packages("caret")
```

## Running the Project

### Python (Jupyter Notebook)

1. Download or clone the repository:
   ```bash
   git clone https://github.com/yourusername/movielens-project.git
   ```

2. Navigate to the `notebooks/` directory and open the Jupyter notebook:
   ```bash
   cd movielens-project/notebooks
   jupyter notebook movielens_project.ipynb
   ```

3. Run the cells in the notebook to see the code implementation and output.

### R

The R version of the project is under development and will be added to this repository soon.

## Model Development

The project involves splitting the dataset into training (`edx`) and validation (`final_holdout_test`) sets, training a machine learning algorithm to predict movie ratings, and calculating RMSE to evaluate the model.

The current implementation uses the average movie rating as a baseline model. More advanced machine learning models will be added in future updates.

## Project Goals

- Develop a movie recommendation system using the MovieLens dataset.
- Implement the project in both Python and R.
- Use RMSE to evaluate the performance of the recommendation system.
