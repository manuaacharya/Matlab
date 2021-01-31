clear all;
clc;
L = input('Enter the length of transmission line in km:');
R = input('Enter the resistance of transmission line:');
X = input('Enter the reactance of transmission line:');
Z1 = complex(R,X);
G = input('Enter the admittance of transmission line:');
Y1 = complex(0,G);
Z= L*Z1;
Y= L*Y1;
if L < 80;
    A = 1
    B = Z
    C = 0
    D = 1
else if L > 240
        Zc = sqrt(Z1/Y1);
        gamma = sqrt(Z1*Y1);
        A = cosh(gamma*L)
        B = Zc*sinh(gamma*L)
        C = (1/Zc)*sinh(gamma*L)
        D = A
     else
         model=input('Select model 1. For T-Model 2.For Pi-Model\n');
         if(model==1)
            A = 1+(Y*Z)/2
            B = Z*(1+(Y*Z)/4)
            C = Y
            D = A
         else
             A = 1+(Y*Z/2)
             B = Z
             C = Y*(1+(Y*Z/4))
             D = A
        end
    end
end


        