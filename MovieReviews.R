# Load necessary libraries
library(tidyverse)
library(caret)
# Load the data
ratings <- read.csv("ratings.csv")
movies <- read.csv("movies.csv")

# Merge the ratings and movies datasets on the movieId column
merged_data <- merge(ratings, movies, by = "movieId")

# Check the structure and first few rows of the merged dataset
str(merged_data)
head(merged_data)

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

# Calculate the average rating for each movie
movie_avg_rating <- edx %>% group_by(movieId) %>% summarise(avg_rating = mean(rating))

# Merge the average ratings into the final_holdout_test set
final_holdout_test <- final_holdout_test %>%
  left_join(movie_avg_rating, by = "movieId")

# Load the caret library if not already loaded
library(caret)

# Calculate RMSE between actual ratings and predicted average ratings
rmse <- RMSE(final_holdout_test$avg_rating, final_holdout_test$rating)
print(paste("Baseline RMSE:", rmse))

