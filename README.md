#Machine Learning-Based Movie Recommendation System Using MovieLens Data

## Overview

This project was developed as part of the **HarvardX Data Science Capstone** and focuses on building a **movie recommendation system** using the **MovieLens dataset**. The goal is to apply **machine learning** techniques to predict user ratings for movies based on their past ratings and to evaluate model performance using **Root Mean Square Error (RMSE)**.

The project is implemented in two programming environments:
- **Python** using Jupyter Notebooks, where multiple models are built and visualized.
- **R**, with R scripts and R Markdown to ensure reproducibility and detailed documentation.

Both implementations allow flexibility in solving the same problem with different tools, while producing comparable results.

## Project Structure

The repository is organized as follows:

```
├── Capstone.ipynb               # Python Jupyter Notebook implementation
├── MovieReviews.R               # R script for the recommendation system
├── MovieReviews.Rmd             # R Markdown report for the R implementation
├── MovieReviews.pdf             # PDF report generated from R Markdown
├── README.md                    # Project overview (this file)
├── links.csv                    # MovieLens links dataset
├── movies.csv                   # MovieLens movies dataset
├── ratings.csv                  # MovieLens ratings dataset
├── tags.csv                     # MovieLens tags dataset
```

## Datasets

The project uses a subset of the **MovieLens dataset**, which includes:

- `ratings.csv`: User ratings for various movies.
- `movies.csv`: Movie titles and genres.
- `tags.csv`: User-generated tags for movies.
- `links.csv`: Identifiers for external movie data sources (IMDB, TMDb).

## Requirements

### Python Environment

To run the Python implementation, the following libraries are required:

- `pandas`
- `numpy`
- `scikit-learn`
- `matplotlib`
- Jupyter Notebook

You can install the required packages using `pip`:

```bash
pip install pandas numpy scikit-learn matplotlib jupyter
```

### R Environment

For the R implementation, the following R packages are required:

- `tidyverse`
- `caret`

You can install them using:

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

2. Navigate to the project directory and open the notebook:
   ```bash
   cd movielens-project
   jupyter notebook Capstone.ipynb
   ```

3. Run the notebook cells to execute the code and observe the results.

### R

1. Open the **MovieReviews.Rmd** file in RStudio for a report format or **MovieReviews.R** for the script version.
2. Execute the script or knit the RMarkdown file to generate the output.

## Model Development

The project involves the following steps:
- Splitting the dataset into **training** (`edx`) and **validation** (`final_holdout_test`) sets.
- Building and evaluating multiple models to predict movie ratings.
- Visualizing results and comparing RMSE for each model.

### Models Implemented

In both Python and R, several models were implemented:

1. **Baseline Model**: Uses the average rating for all movies as the prediction.
   - Python RMSE: `0.9665`
   - R RMSE: `1.0425`

2. **Movie Effect Model**: Considers movie-specific biases by adjusting for individual movie effects.
   - Python RMSE: `0.9665`
   - R RMSE: `0.9617`

3. **Movie + User Effect Model**: Incorporates user-specific biases in addition to movie effects.
   - Python RMSE: `0.9071`
   - R RMSE: `0.8731`

4. **Regularized Movie + User Effect Model**: Applies regularization to prevent overfitting by adding a penalty term to both movie and user biases.
   - Python RMSE: `0.8742`
   - R RMSE: `0.8527`

5. **Hybrid Model**: Combines various models (movie effects, user effects, regularization) and leverages matrix factorization (SVD) and K-Nearest Neighbors (KNN).
   - Python Hybrid Model RMSE: `0.8655`

### Visualizations (Python)

Several visualizations were generated in the Jupyter Notebook to analyze and illustrate the data and model performance:

- **Distribution of Ratings**: Shows how ratings are distributed, highlighting peaks at whole numbers.
- **Top 10 Most Rated Movies**: Bar chart showing which movies received the most ratings.
- **Average Rating by Movie Year**: A scatter plot showing the average rating of movies based on their release year.
- **RMSE Comparison**: A bar plot comparing the RMSE of different models.

### Python Visualization Example:
```python
import matplotlib.pyplot as plt

# RMSE Comparison plot
rmse_values = [0.9665, 0.9071, 0.8742, 0.8655]
model_names = ['Baseline', 'Movie Effect', 'Movie + User Effect', 'Hybrid']

plt.bar(model_names, rmse_values, color='lightblue')
plt.title('RMSE Comparison of Different Models')
plt.ylabel('RMSE')
plt.show()
```

## Results Comparison

Both the Python and R implementations produced similar results across models, with the regularized Movie + User Effects Model performing the best in both environments:

| Model                        | Python RMSE  | R RMSE      |
|------------------------------|--------------|-------------|
| Baseline Model                | 0.9665       | 1.0425      |
| Movie Effect Model            | 0.9665       | 0.9617      |
| Movie + User Effect Model     | 0.9071       | 0.8731      |
| Regularized Movie + User Model| 0.8742       | **0.8527**  |
| Hybrid Model                  | **0.8655**   | N/A         |

### Conclusion

This project demonstrates the process of building a movie recommendation system using both Python and R. The best performance was achieved using a **Regularized Movie + User Effect Model** with an RMSE of `0.8527` in R. Future improvements could include advanced techniques like matrix factorization or neural networks to further optimize the system.
