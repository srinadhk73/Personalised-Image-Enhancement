for i = 1:20
    i
    load(['Training_Sets_7_5/training_data_' num2str(i)])
    training_images = resizeGUI(training_images);
    save(['resized_Training_Sets_7_5/training_data_' num2str(i)],...
            'training_images')
end