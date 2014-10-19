X_test <- read.table("data/test/X_test.txt", comment.char="")
X_train <- read.table("data/train/X_train.txt", comment.char="")
y_test <- read.table("data/test/y_test.txt")
y_train <- read.table("data/train/y_train.txt")
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

sub_train <- scan("data/train/subject_train.txt")
sub_test <- scan("data/test/subject_test.txt")
subject <- c(sub_train, sub_test)
col_names <- scan("data/features.txt", what="character", sep="\n", strip.white=TRUE)
df <- data.frame(X)
colnames(df) <- col_names

cols_with_mean_or_std <- sapply(col_names, function(x) grepl("-mean\\()", x, ignore.case = TRUE) > 0 | grepl("-std\\()", x, ignore.case = TRUE))

new_df <- df[,cols_with_mean_or_std]
new_df$subject <- subject

new_df$activity <- factor(y$V1)
new_df$activity <- revalue(new_df$activity, c("2" = "WALKING_UPSTAIRS", "1" = "WALKING", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING"))

df_tidy <- aggregate(new_df[,1:(length(new_df)-2)],
                     list(Subject = new_df$subject,
                          Activity = new_df$activity),
                     mean)
