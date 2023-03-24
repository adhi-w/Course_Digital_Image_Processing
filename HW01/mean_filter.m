function img = mean_filter(imgSource)   %Function for Mean Filter

% Kernel 3x3
w = (1/9)*[1, 1, 1
           1, 1, 1,
           1, 1, 1];

    [x,y] = size(imgSource);
    
    % Expand the source image for applying filter 3x3
    g = zeros (x+2, y+2);

    for i = 1:x         % rows
        for j = 1:y     % columns
            g(i+1, j+1) = imgSource(i,j); % Processing to expand image
        end 
    end
    
    % Applying kernel mask into source image
    for i = 1:x
        for j = 1:y            
            imgSource(i,j) = g(i,j)*w(1,1) + g(i+1,j)*w(2,1) + g(i+2,j)*w(3,1)...   
                             + g(i,j+1)*w(1,2) + g(i+1,j+1)*w(2,2) + g(i+2,j+1)*w(3,2)....
                             + g(i,j+2)*w(1,3) + g(i+1,j+2)*w(2,3) + g(i+2,j+2)*w(3,3);  
        end 
    end
% Convert into 8 bit
img = uint8(imgSource);

end
