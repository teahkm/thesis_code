% This script converts test images to grayscale and resizes to NxN

nu = 9;
N = 2^9; % 512 x 512
im = imread('..\data\originals\pig_color_rectangle.jpg'); % change filename

im_gray = rgb2gray(uint8(im)); % convert to gray scale
im_resized = imresize(im_gray, [N,N]); % resize to square

dest = '..\data\test_images'; % saves image to test_images folder
fname = fullfile(dest, sprintf('pig_gray%d.jpg', N)); % change filename

imwrite(im_resized, fname);
