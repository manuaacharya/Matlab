clc;
clear all;
or_im=imread("opimage.jpg");
imshow(or_im)
op_1=im2bw(or_im);
imshow(op_1)
g_1=hist(op_1);

