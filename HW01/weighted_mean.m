function img = weighted_mean(imgSource) %Function for Weighted Mean Filter

% Kernel 3x3 for Weigted Mean
w=(1/16)*[1 2 1
          2 4 2
          1 2 1];

    [x, y] = size(imgSource);
    [m, n] = size(w);

    % Convolution
    c = zeros( x+m-1, y+n-1 );
    
    for i = 1:m
        for j = 1:n
            r1 = i;
            r2 = r1 + x - 1;
            c1 = j;
            c2 = c1 + y - 1;
            c(r1:r2,c1:c2) = c(r1:r2,c1:c2) + w(i,j) * double(imgSource);
        end
    end
    
     % Extract region of size(a) from c
        r1 = floor(m/2) + 1;
        r2 = r1 + x - 1;
        c1 = floor(n/2) + 1;
        c2 = c1 + y - 1;
        c = c(r1:r2, c1:c2);
 % Convert into 8 bit       
img = uint8(c);    
end