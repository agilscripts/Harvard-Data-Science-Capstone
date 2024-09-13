# Load necessary libraries
if(!require(tidyverse)) install.packages("tidyverse", repos = "http://cran.us.r-project.org")
if(!require(caret)) install.packages("caret", repos = "http://cran.us.r-project.org")

library(tidyverse)
library(caret)

# Load the data
ratings <- read.csv("ratings.csv")
movies <- read.csv("movies.csv")

# Merge the ratings and movies datasets on the movieId column
merged_data <- merge(ratings, movies, by = "movieId")

# Set seed for reproducibility
set.seed(1)

# Split the data into edx (90%) and final_holdout_test (10%)
test_index <- createDataPartition(merged_data$rating, p = 0.1, list = FALSE)
edx <- merged_data[-test_index, ]
final_holdout_test <- merged_data[test_index, ]

# Ensure final_holdout_test has only users and movies that are also in edx
final_holdout_test <- final_holdout_test %>%
  semi_join(edx, by = "movieId") %>%
  semi_join(edx, by = "userId")

# Baseline Model: Just the average rating
mu <- mean(edx$rating)

# RMSE calculation function
rmse <- function(true_ratings, predicted_ratings) {
  sqrt(mean((true_ratings - predicted_ratings)^2))
}

baseline_rmse <- rmse(final_holdout_test$rating, mu)
cat("Baseline RMSE:", baseline_rmse, "\n")

# Model 1: Movie Effect Model
movie_avgs <- edx %>%
  group_by(movieId) %>%
  summarize(b_i = mean(rating - mu))

predicted_ratings_movie <- final_holdout_test %>%
  left_join(movie_avgs, by='movieId') %>%
  mutate(pred = mu + b_i) %>%
  pull(pred)

movie_effect_rmse <- rmse(final_holdout_test$rating, predicted_ratings_movie)
cat("Movie Effect Model RMSE:", movie_effect_rmse, "\n")

# Model 2: Movie + User Effect Model
user_avgs <- edx %>%
  left_join(movie_avgs, by='movieId') %>%
  group_by(userId) %>%
  summarize(b_u = mean(rating - mu - b_i))

predicted_ratings_movie_user <- final_holdout_test %>%
  left_join(movie_avgs, by='movieId') %>%
  left_join(user_avgs, by='userId') %>%
  mutate(pred = mu + b_i + b_u) %>%
  pull(pred)

movie_user_effect_rmse <- rmse(final_holdout_test$rating, predicted_ratings_movie_user)
cat("Movie + User Effects Model RMSE:", movie_user_effect_rmse, "\n")

# Model 3: Regularized Movie + User Effect Model
lambdas <- seq(0, 10, 0.1)
best_lambda <- 0
best_rmse <- Inf

for (l in lambdas) {
  movie_reg_avgs <- edx %>%
    group_by(movieId) %>%
    summarize(b_i = sum(rating - mu) / (n() + l))
  
  user_reg_avgs <- edx %>%
    left_join(movie_reg_avgs, by='movieId') %>%
    group_by(userId) %>%
    summarize(b_u = sum(rating - b_i - mu) / (n() + l))
  
  predicted_ratings_reg <- final_holdout_test %>%
    left_join(movie_reg_avgs, by='movieId') %>%
    left_join(user_reg_avgs, by='userId') %>%
    mutate(pred = mu + b_i + b_u) %>%
    pull(pred)
  
  model_rmse <- rmse(final_holdout_test$rating, predicted_ratings_reg)
  
  if (model_rmse < best_rmse) {
    best_rmse <- model_rmse
    best_lambda <- l
  }
}

cat("Best Regularized RMSE:", best_rmse, "\n")
cat("Best lambda:", best_lambda, "\n")

# Final Regularized Model with the best lambda
movie_reg_avgs <- edx %>%
  group_by(movieId) %>%
  summarize(b_i = sum(rating - mu) / (n() + best_lambda))

user_reg_avgs <- edx %>%
  left_join(movie_reg_avgs, by='movieId') %>%
  group_by(userId) %>%
  summarize(b_u = sum(rating - b_i - mu) / (n() + best_lambda))

predicted_ratings_final <- final_holdout_test %>%
  left_join(movie_reg_avgs, by='movieId') %>%
  left_join(user_reg_avgs, by='userId') %>%
  mutate(pred = mu + b_i + b_u) %>%
  pull(pred)

final_rmse <- rmse(final_holdout_test$rating, predicted_ratings_final)
cat("Final Regularized Model RMSE:", final_rmse, "\n")

# Visualize RMSE comparison across models
rmse_results <- data.frame(
  Model = c("Baseline", "Movie Effect", "Movie + User Effect", "Regularized Movie + User"),
  RMSE = c(baseline_rmse, movie_effect_rmse, movie_user_effect_rmse, final_rmse)
)

# Plot RMSE comparison
ggplot(rmse_results, aes(x = Model, y = RMSE)) +
  geom_col(fill = "steelblue") +
  labs(title = "RMSE Comparison Across Models", y = "RMSE", x = "Model") +
  theme_minimal()

# Visualize Movie Bias
ggplot(movie_reg_avgs, aes(x = b_i)) +
  geom_histogram(fill = "blue", bins = 30) +
  labs(title = "Distribution of Movie Biases", x = "Movie Bias", y = "Count") +
  theme_minimal()

# Visualize User Bias
ggplot(user_reg_avgs, aes(x = b_u)) +
  geom_histogram(fill = "green", bins = 30) +
  labs(title = "Distribution of User Biases", x = "User Bias", y = "Count") +
  theme_minimal()

