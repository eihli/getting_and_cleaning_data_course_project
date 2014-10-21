library(plyr)
X_test <- read.table("data/test/X_test.txt", comment.char="")
X_train <- read.table("data/train/X_train.txt", comment.char="")
y_test <- read.table("data/test/y_test.txt")
y_train <- read.table("data/train/y_train.txt")
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)



# Get column names and create a dataframe with only the columns with -mean() or -std() in them.
col_names <- scan("data/features.txt", what="character", sep="\n", strip.white=TRUE)
df <- data.frame(X)
colnames(df) <- col_names
cols_with_mean_or_std <- sapply(col_names, function(x) grepl("-mean\\()", x, ignore.case = TRUE) > 0 | grepl("-std\\()", x, ignore.case = TRUE))
df <- df[,cols_with_mean_or_std]

# Add subject to the dataframe.
sub_train <- scan("data/train/subject_train.txt")
sub_test <- scan("data/test/subject_test.txt")
subject <- c(sub_train, sub_test)
df$subject <- subject

# Rename columns to be descriptive.
col_names <- colnames(df)
col_names <- gsub(" f", "frequency", col_names)
col_names <- gsub(" t", "time", col_names)
col_names <- gsub("-", "", col_names)
col_names <- gsub("Acc", "acceleration", col_names)
col_names <- gsub("Mag", "magnitude", col_names)
col_names <- gsub("\\(\\)", "", col_names)
col_names <- gsub("^[0-9]+", "", col_names)
col_names <- tolower(col_names)

df$activity <- factor(y$V1)
df$activity <- revalue(df$activity, c("2" = "WALKING_UPSTAIRS", "1" = "WALKING", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING"))



df_tidy <- aggregate(df[,1:(length(df)-2)],
                     list(Subject = df$subject,
                          Activity = df$activity),
                     mean)
