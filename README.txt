To run the training and testing part of the project, 
open TRAINING_AND_TESTING_GUI.m and follow the
instructions given in the comments. Make sure to run
each section in the MATLAB code individually.

The other code and files in the project folder 
correspond to the offline parts of the project.
Given below is the description of each folder/file -

1. Dataset/DatasetImages - contains the 500 images used
			   in the dataset
2. The other files in the folder "Dataset" were used to
scrap the image links and randomly select 500 images.

3. Distance_Metrics - folder containing functions used 
to calculate the 25 distance metrics

4. Sensor_placement_opt - folder containing the functions 
implementing the sensor placement optimization

5. image_distances.m, normalize_distances.m - code that finds the
25 distances for each pair of images in the dataset and then 
normalize the distances

6. bfgs_func.m, bfgs_run.m - code that finds the weights "alpha"
of the distance metric

7. top25_training.m - code to choose the top 25 training images using
the sensor placement optimization (we reduced the training set to 20 later)

8. process_image.m - code to apply S-curve and change the temperature and
tint

9. parameter_selection.m, parameter_distances.m - code to find the best
parameter combinations by applying the distance metric and sensor placement
optimization

THE OTHER CODE CONSISTS OF HELPER FUNCTIONS AND GUI CODE.
THE .MAT FILES ARE THE IMPORTANT VARIABLES STORED WHICH ARE REQUIRED
BY VARIOUS SCRIPTS

FOLDERS LIKE - Final_Test_Images, resized_Training_Sets_7_5, TestImages,
TestImagesGoogle, TestImagesGoogle, Training_Set_7_5, TrainingImages CONTAIN
IMAGES AND .MAT USED BY GUIs