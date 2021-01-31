clc;
clear all;
n=50;
for i=1:2:50;
    n=n+1;
    fprintf("odd numbers=%.2f\n",i);
end
for i1=2:2:50;
    n=n+1;
    fprintf("Even numvers=%.2f\n",i1);
end
plot(i,i1)
