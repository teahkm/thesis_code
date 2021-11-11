N = 32;
I = eye(N);

H_ord = sqrt(N)*fwht(I,N,'Hadamard');
H_seq = sqrt(N)*fwht(I,N,'sequency');
H_pal = sqrt(N)*fwht(I,N,'dyadic');

h = figure;
imshow(H_ord, []);
saveas(h,'H_ord','epsc')

h = figure;
imshow(H_seq, []);
saveas(h,'H_seq','epsc')

h = figure;
imshow(H_pal, []);
saveas(h,'H_pal','epsc')