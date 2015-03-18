## DATA DICTIONARY - Cleaned Tidy HAR Dataset

This dataset is originated from the ["Human Activity Recognition Using Smartphones Dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). One can find that original dataset from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). We only extract the mean and standard deviation for each measurement from that original dataset, and then do some further processing to get a tidy dataset for later analysis.

There are altogether 17 features in the original dataset as the following:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The prefix "t" means a time domain signal and prefix "f" means a frequency domain signal. The suffix "-XYZ" denote 3-axial signals in the X, Y and Z directions so that one such feature consists of 3 measurements. For each measurement, we extract mean and standard deviation from the original dataset. There are 8 features with 3-axial signals and 9 derived from the raw signals, therefore altogether we got (8 * 3 + 9) * 2, i.e. 66, variables for these 17 features. Plus the 2 variables for activity and subject under experiments, we have 68 attributes in our cleaned dataset with 40 observations.

"Acc" in a variable name means acceleration signal captured by accelerometer. "Gyro" means angular velocity captured by gyroscope. "Jerk" means signals derived from the body linear acceleration and angular velocity. "Mag" means the magnitude which is calculated from these three-dimensional signals using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals to produce some frequency domain signals. We will take the same naming schema in our new dataset.

The accompanying script "run_analysis.R" is used to generate this dataset from the original dataset.

The variables of the dataset are listed sequentially as follows:

1. Activity

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

2. Subject

- Denoted by integer number from 1 to 30

3. tBodyAcc_mean_X_Average

4. tBodyAcc_mean_Y_Average

5. tBodyAcc_mean_Z_Average

6. tBodyAcc_std_X_Average

7. tBodyAcc_std_Y_Average

8. tBodyAcc_std_Z_Average

9. tGravityAcc_mean_X_Average

10. tGravityAcc_mean_Y_Average

11. tGravityAcc_mean_Z_Average

12. tGravityAcc_std_X_Average

13. tGravityAcc_std_Y_Average

14. tGravityAcc_std_Z_Average

15. BodyAccJerk_mean_X_Average

16. tBodyAccJerk_mean_Y_Average

17. tBodyAccJerk_mean_Z_Average

18. tBodyAccJerk_std_X_Average

19. tBodyAccJerk_std_Y_Average

20. tBodyAccJerk_std_Z_Average

21. tBodyGyro_mean_X_Average

22. tBodyGyro_mean_Y_Average

23. tBodyGyro_mean_Z_Average

24. tBodyGyro_std_X_Average

25. tBodyGyro_std_Y_Average

26. tBodyGyro_std_Z_Average

27. tBodyGyroJerk_mean_X_Average

28. tBodyGyroJerk_mean_Y_Average

29. tBodyGyroJerk_mean_Z_Average

30. tBodyGyroJerk_std_X_Average

31. tBodyGyroJerk_std_Y_Average

32. tBodyGyroJerk_std_Z_Average

33. tBodyAccMag_mean_Average

34. tBodyAccMag_std_Average

35. tGravityAccMag_mean_Average

36. tGravityAccMag_std_Average

37. tBodyAccJerkMag_mean_Average

38. tBodyAccJerkMag_std_Average

39. tBodyGyroMag_mean_Average

40. tBodyGyroMag_std_Average

41. tBodyGyroJerkMag_mean_Average

42. tBodyGyroJerkMag_std_Average

43. fBodyAcc_mean_X_Average

44. fBodyAcc_mean_Y_Average

45. fBodyAcc_mean_Z_Average

46. fBodyAcc_std_X_Average

47. fBodyAcc_std_Y_Average

48. fBodyAcc_std_Z_Average

49. fBodyAccJerk_mean_X_Average

50. fBodyAccJerk_mean_Y_Average

51. fBodyAccJerk_mean_Z_Average

52. fBodyAccJerk_std_X_Average

53. fBodyAccJerk_std_Y_Average

54. fBodyAccJerk_std_Z_Average

55. fBodyGyro_mean_X_Average

56. fBodyGyro_mean_Y_Average

57. fBodyGyro_mean_Z_Average

58. fBodyGyro_std_X_Average

59. fBodyGyro_std_Y_Average

60. fBodyGyro_std_Z_Average

61. fBodyAccMag_mean_Average

62. fBodyAccMag_std_Average

63. fBodyBodyAccJerkMag_mean_Average

64. fBodyBodyAccJerkMag_std_Average

65. fBodyBodyGyroMag_mean_Average

66. fBodyBodyGyroMag_std_Average

67. fBodyBodyGyroJerkMag_mean_Average

68. fBodyBodyGyroJerkMag_std_Average

