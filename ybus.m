clc;
clear;
image=imread("Ybus_I.jpg");
imshow(image)
linedata = [1 2 0.2j 0.03i;
            1 4 0.25j 0.025i;
            2 3 0.4j 0.02i;
            2 4 0.5j 0.015i;
            3 4 0.2j 0.01i];
Sh=[4 0.02j];
fb=linedata(:,1); %From bus
tb=linedata(:,2); %To bus
z=linedata(:,3); %Series line impedance
Bc=linedata(:,4); %Half line charging admittance
nbus=max(max(fb),max(tb));
nbr=length(z);
y=ones(nbr,1)./z; %branch admittance
Ybus=zeros(nbus,nbus); % initialize Ybus to zero
% formation of the off diagonal elements
for k=1:nbr;
Ybus(fb(k),tb(k))=Ybus(fb(k),tb(k))-y(k);
Ybus(tb(k),fb(k))=Ybus(fb(k),tb(k));
end
% formation of the diagonal elements
for n=1:nbus
for k=1:nbr
if fb(k)==n
Ybus(n,n) = Ybus(n,n)+y(k) + Bc(k);
elseif tb(k)==n
Ybus(n,n) = Ybus(n,n)+y(k) + Bc(k);
end
end
end
%Addition of shunt admittance data
[r,c]=size(Sh);
for x=1:r
for y=1:nbr
p=fb(y); q=tb(y);
if Sh(x,1)==p
Ybus(p,p)=Ybus(p,p)+Sh(x,2);
elseif Sh(x,1)==q
Ybus(q,q)=Ybus(q,q)+Sh(x,2);
end
end
end
Ybus