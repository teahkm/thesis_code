% This script performs recoveries of the images using uniform random
% subsampling and multilevel subsampling.
% Running the whole script takes a long time, as each recovery takes a few
% minutes. Blocks of the code can be run separately by highlighting and
% pressing F9.

% load images
im_pig = double(imread('..\data\test_images\pig_gray512.jpg'));
im_turtle = double(imread('..\data\test_images\turtle_gray512.jpg'));
im_kayak = double(imread('..\data\test_images\kayak_gray512.jpg'));
im_opera = double(imread('..\data\test_images\opera_gray512.jpg'));

N = size(im_kayak,1);
k = floor(N^2*0.20); % number of samples, percentage of total number
vm = 1; % vanishing moments: 1 is Haar, 4 is DB4

nbr_levels = 50;
radius = 2;
p_norm_exp = 0.5;
a = 2;
r0_exp=2;
r0=1;
p_norm = 2;
r_factor = 4;

% sampling patterns
[idx1, samp_str_id1] = cil_sph2_2level(N, k, p_norm, r_factor);
[idx2, samp_str_id2] = cil_sph2_gcircle(N, k, a, r0, nbr_levels);
[idx3, samp_str_id3] = cil_sp2_uniform(N, k);

% standard CS recoveries of pig and turtle, not used
im_rec_2level1 = cil_sample_walsh_wavelet(im_pig,0,idx1,'out_pig20level',vm);
im_rec_2level2 = cil_sample_walsh_wavelet(im_turtle,0,idx1,'out_turtle20level',vm);
im_rec_circle1 = cil_sample_walsh_wavelet(im_pig,0,idx2,'out_pig20circle',vm);
im_rec_circle2 = cil_sample_walsh_wavelet(im_turtle,0,idx2,'out_turtle20circle',vm);
im_rec_uniform1 = cil_sample_walsh_wavelet(im_pig,0,idx3,'out_pig20uniform',vm);
im_rec_uniform2 = cil_sample_walsh_wavelet(im_turtle,0,idx3,'out_turtle20uniform',vm);

% figure: uniform vs multilevel opera house                                          
im_rec_uniform = cil_sample_walsh_wavelet(im_opera,0,idx_u,'out_opera20uniform',vm);
im_rec_circle = cil_sample_walsh_wavelet(im_opera,0,idx2,'out_opera20circle',vm);

% figure: demonstrate recovery for wavelets+hadamard, kayak
im_rec_kayak = cil_sample_walsh_wavelet(im_kayak,0,idx2,'out_kayak20circle_haar',vm);

