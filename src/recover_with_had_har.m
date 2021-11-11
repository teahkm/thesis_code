im_pig = double(imread('C:\Users\Bruker\Documents\mastergreier\Master\data\test_images\pig_gray512.jpg'));
im_turtle = double(imread('C:\Users\Bruker\Documents\mastergreier\Master\data\test_images\turtle_gray512.jpg'));

N = size(im_kayak,1);
k = floor(N^2*0.20); %number of samples
vm = 1;

nbr_levels = 50;
radius = 2;
p_norm_exp = 0.5;
a = 2;
r0_exp=2;
r0=1;
p_norm = 2;
r_factor = 4;

[idx1, samp_str_id1] = cil_sph2_exp(N, k, a, r0_exp, nbr_levels, radius, p_norm_exp);
[idx2, samp_str_id2] = cil_sph2_2level(N, k, p_norm, r_factor);
[idx3, samp_str_id3] = cil_sph2_gcircle(N, k, a, r0, nbr_levels);
[idx4, samp_str_id4] = cil_sp2_uniform(N, k);

im_rec_exp1 = cil_sample_walsh_wavelet(im_pig,0,idx1,'out_pig20exp',vm);
im_rec_exp2 = cil_sample_walsh_wavelet(im_turtle,0,idx1,'out_turtle20exp',vm);
im_rec_2level1 = cil_sample_walsh_wavelet(im_pig,0,idx2,'out_pig20level',vm);
im_rec_2level2 = cil_sample_walsh_wavelet(im_turtle,0,idx2,'out_turtle20level',vm);
im_rec_circle1 = cil_sample_walsh_wavelet(im_pig,0,idx3,'out_pig20circle_db4',vm);
im_rec_circle2 = cil_sample_walsh_wavelet(im_turtle,0,idx3,'out_turtle20circle_db4',vm);
im_rec_uniform1 = cil_sample_walsh_wavelet(im_pig,0,idx4,'out_pig20uniform',vm);
im_rec_uniform2 = cil_sample_walsh_wavelet(im_turtle,0,idx4,'out_turtle20uniform',vm);

p_norm_square = inf;
radius_square = 1;
[idx_square, samp_str_idsquare] = cil_sph2_exp(N, k, a, r0, nbr_levels, radius_square, p_norm_square);
im_rec_square1 =cil_sample_walsh_wavelet(im_pig,0,idx_square,'out_pig20square',vm);
im_rec_square2 = cil_sample_walsh_wavelet(im_,0,idx_square,'out_turtle20square',vm);

imwrite(im2uint8(im_rec), sprintf('%s.%s', filename, ...
                                               cil_dflt.image_format));

im_opera = double(imread('C:\Users\Bruker\Documents\mastergreier\Master\data\test_images\opera_gray512.jpg'));
[idx_u, samp_str_id_u] = cil_sp2_uniform(N, k);
im_rec_uniform = cil_sample_walsh_wavelet(im_opera,0,idx_u,'out_opera20uniform',vm);
im_rec_circle = cil_sample_walsh_wavelet(im_opera,0,idx3,'out_opera20circle',vm);

im_kayak = double(imread('C:\Users\Bruker\Documents\mastergreier\Master\data\test_images\kayak_gray512.jpg'));
im_rec_kayak = cil_sample_walsh_wavelet(im_kayak,0,idx3,'out_kayak20circle_haar',vm);

