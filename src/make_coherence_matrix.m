% This script produces matrices with the absolute values of the entries in a 
% Hadamard wavelet matrix 
%
% wavelets: Haar, DB4
% Hadamard: dyadic ordering

dwtmode('per', 'nodisp');

nu = 8;
N = 2^nu;
n_max_value = -nu;
Haar_mat = zeros(N);
daub2_mat = zeros(N);
daub4_mat = zeros(N);
I = eye(N);

% Hadamard matrix
Had = sqrt(N)*fwht(I,N,'dyadic');

% wavedec to get S
x = ones([N,1]);
[~, S] = wavedec(x, wmaxlev(N, 'Haar'), 'Haar');
[~, S2] = wavedec(x, wmaxlev(N, 'db4'), 'db4');

% wavelet matrices
for i=1:N
    Haar_mat(:, i) = waverec(I(:,i), S, 'Haar');
    daub4_mat(:, i) = waverec(I(:,i), S2, 'db4');
end

% multiply Haar
A = Had*Haar_mat;
abs_vals = abs(A);
im = max(log2(abs_vals), n_max_value);
im = (im - n_max_value)/(-n_max_value);

% multiply daubechies
A2 = Had*daub4_mat;
abs_vals_db4 = abs(A2);
im2 = max(log2(abs_vals_db4), n_max_value);
im2 = (im2 - n_max_value)/(-n_max_value);

