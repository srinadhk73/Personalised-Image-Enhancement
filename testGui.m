params = repmat([1;2;3;4;5;6;7;8;9],1,5);
paramsFinal = {};
for i = 1:9
    testParamsFinal{i} = params(i,:);
end

testParamsFinal



%%

im1 = imread('Image_sets/bowser.png');
im2 = imread('Image_sets/luigi.png');
im3 = imread('Image_sets/mario.png');
im4 = imread('Image_sets/peach.png');
im5 = imread('Image_sets/toad.png');
im6 = imread('Image_sets/wario.png');
im7 = imread('Image_sets/yoshi.png');

testSet1 = {im1, im1, im1, im1, im1, im1, im1, im1, im1};
testSet2 = {im2, im2, im2, im2, im2, im2, im2, im2, im2};
testSet3 = {im3, im3, im3, im3, im3, im3, im3, im3, im3};
testSet4 = {im4, im4, im4, im4, im4, im4, im4, im4, im4};
testSet5 = {im5, im5, im5, im5, im5, im5, im5, im5, im5};
testSet6 = {im6, im6, im6, im6, im6, im6, im6, im6, im6};
testSet7 = {im7, im7, im7, im7, im7, im7, im7, im7, im7};
testSet8 = {im1, im1, im1, im1, im1, im1, im1, im1, im1};
testSet9 = {im2, im2, im2, im2, im2, im2, im2, im2, im2};
testSet10 = {im3, im3, im3, im3, im3, im3, im3, im3, im3};
testSet11 = {im4, im4, im4, im4, im4, im4, im4, im4, im4};
testSet12 = {im5, im5, im5, im5, im5, im5, im5, im5, im5};
testSet13 = {im6, im6, im6, im6, im6, im6, im6, im6, im6};
testSet14 = {im7, im7, im7, im7, im7, im7, im7, im7, im7};
testSet15 = {im1, im1, im1, im1, im1, im1, im1, im1, im1};
testSet16 = {im2, im2, im2, im2, im2, im2, im2, im2, im2};
testSet17 = {im3, im3, im3, im3, im3, im3, im3, im3, im3};
testSet18 = {im4, im4, im4, im4, im4, im4, im4, im4, im4};
testSet19 = {im5, im5, im5, im5, im5, im5, im5, im5, im5};
testSet20 = {im6, im6, im6, im6, im6, im6, im6, im6, im6};
testSet21 = {im7, im7, im7, im7, im7, im7, im7, im7, im7};
testSet22 = {im1, im1, im1, im1, im1, im1, im1, im1, im1};
testSet23 = {im2, im2, im2, im2, im2, im2, im2, im2, im2};
testSet24 = {im3, im3, im3, im3, im3, im3, im3, im3, im3};
testSet25 = {im4, im4, im4, im4, im4, im4, im4, im4, im4};
testSets = {testSet1, testSet2, testSet3,testSet4,testSet5,testSet6 ...
            testSet7, testSet8, testSet9, testSet10, testSet11, testSet12...
            testSet13, testSet14, testSet15, testSet16, testSet17, testSet18...
            testSet19, testSet20, testSet21, testSet22, testSet23, testSet24...
            testSet25};
for k = 1:25
    testSet.images = testSets{k};
    testSet.p = testParamsFinal;
    save(['testSet_' int2str(k)], 'testSet')
end




