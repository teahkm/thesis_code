% This script converts test images to grayscale and resizes to NxN

nu = 9;
N = 2^9;
im = imread('data\kayak_color_rectangle.jpg');
im_gray = rgb2gray(uint8(im));

im_resized = imresize(im_gray, [N,N]);

dest = 'C:\Users\Bruker\Documents\mastergreier\Master\data\test_images';
fname = fullfile(dest, sprintf('kayak_gray%d.jpg', N));

imwrite(im_resized, fname);
