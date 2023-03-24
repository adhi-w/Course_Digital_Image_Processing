clc
clear all
close all

% Open Image
imgSource = imread('Lena.bmp');
imgSource2 = imread('Lena_salt_0.5.bmp');
imgSource3 = imread('Lena_salt_4.bmp');
imgSource4 = imread('Lena_salt_4_Word.bmp');

% Show Image
figure,imshow(imgSource);   title('Original Lena');
figure,imshow(imgSource2);  title('Original Lena salt 0.5');
figure,imshow(imgSource3);  title('Original Lena salt 4');
figure,imshow(imgSource4);  title('Original Lena salt 4 Word');


% Implementing Filter
% Choose which Filter that would be used & uncomment it, otherwise just
% give commment

% imgFilter = mean_filter(imgSource);       % Mean Filter
% imgFilter2 = mean_filter(imgSource2);
% imgFilter3 = mean_filter(imgSource3);
% imgFilter4 = mean_filter(imgSource4);

% imgFilter = weighted_mean(imgSource);     % Weighted Mean
% imgFilter2 = weighted_mean(imgSource2);
% imgFilter3 = weighted_mean(imgSource3);
% imgFilter4 = weighted_mean(imgSource4);

imgFilter = median_filter(imgSource);       % Median Filter
imgFilter2 = median_filter(imgSource2);
imgFilter3 = median_filter(imgSource3);
imgFilter4 = median_filter(imgSource4);

%Show the Result of Filtering Image
figure,imshow(imgFilter);   title('Median Filtering Lena');   %Weighted
figure,imshow(imgFilter2);  title('Median Filtering Lena salt 0.5'); %Median
figure,imshow(imgFilter3);  title('Median Filtering Lena salt 4');
figure,imshow(imgFilter4);  title('Median Filtering Lena salt 4 Word');