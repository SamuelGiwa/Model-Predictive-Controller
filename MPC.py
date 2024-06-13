import control as ctl
import matplotlib.pyplot as plt
import numpy as np

# Define the transfer function
num = [1]
den = [5, 1]
sys = ctl.TransferFunction(num, den)


N=5;    #N is the length of the model
P=5;    #P is the prediction horizon
M=3;    #M is the control horizon
r=1;
t_s = 1; #sampling time

num = 1;
den = [5, 1];


tr = ctl.TransferFunction(num,den);
sysd = ctl.c2d(tr, 1); 
td, rd = ctl.step_response(sysd);

rd = rd[1:N+1]

Sf = np.zeros((P,M))

for i in range(0,P):
    for j in range(0,M):
        if i-j < 0:
            break
        else:
            Sf[i][j] = rd[i-j]
