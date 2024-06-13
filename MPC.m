clear;
clc;

N=5;    %N is the length of the model
P=5;   %P is the prediction horizon
M=3;    %M is the control horizon
r=1;

num = 1;
den = [5 1];

ts = 1; %Samplitng time


tr = tf(num,den);
sysd = c2d(tr, ts); 
s = step(sysd);
S=s(2:P+1);
%K = inv(Sf'*Sf)*Sf;
E = 1-s;
Sf = zeros(P,M);
Spast= zeros(P,N-2);

% for i = 0: P-1
%     Sf(P-i-2,(1:M-i)) = S(M-i:-1:1)
% end

for i = 1:P
    for j = 1:M
        if i-j+1 == 0
            break
        else
            Sf(i, j) = S(i-j+1);
        end
    end
end
