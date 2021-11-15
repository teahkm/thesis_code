% This script produces plots of the different Hadamard orderings.

N = 32; % size
I = eye(N);

H_ord = sqrt(N)*fwht(I,N,'Hadamard');
H_seq = sqrt(N)*fwht(I,N,'sequency');
H_pal = sqrt(N)*fwht(I,N,'dyadic');

% Hadamard/ordinary ordering
h = figure;
imshow(H_ord, []);
saveas(h,'H_ord','epsc')

% Sequency ordering
h = figure;
imshow(H_seq, []);
saveas(h,'H_seq','epsc')

% Paley/dyadic ordering
h = figure;
imshow(H_pal, []);
saveas(h,'H_pal','epsc')