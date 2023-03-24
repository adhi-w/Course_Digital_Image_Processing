clc
clear all
close all

imgSource = imread('colorImg1.bmp');
figure,imshow(imgSource);   title('Original Image');

imgResult = RGB_HSI(imgSource); % Converting RGB to HSI
imgResult1 =HSI_RGB(imgResult); % Converting HSI to RGB

figure,imshow(imgResult);   title('HSI Image');
figure,imshow(imgResult1);   title('RGB Image');