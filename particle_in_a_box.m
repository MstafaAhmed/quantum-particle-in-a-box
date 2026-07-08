%%
clear;
clc;
close all;
%%
% planck constant = 6.626e-34 ,  habr=h/(2*pi)
h = 6.626e-34;
hbar = h/(2*pi);  
% Electron mass in kg
m = 9.11e-31;
% electron charge
e = 1.6e-19;
% Box Lenght ( L=1nm )
L = 1e-9;
% space
x = linspace(0,L,100);

% number of states ( N=4 )
N = 4;
figure;
for n=1:N
    % Wave function
    psi = sqrt(2/L).*sin((n*pi*x)/L);
    
    % probability
    prob = psi.^2;
    
    % energy
    E = (pi^2 *hbar^2 *n^2)/(2*m*L^2);
    
    E_ev =E/e;
    %Wave function 
    subplot(N,2,2*n-1);
    plot(x*1e9,psi,'linewidth',2)
    grid on;
    xlabel('x (nm)');
    ylabel(['\psi_',num2str(n),'(x)']);
    title(['wavefunction n = ', num2str(n)])
    
    %probability
    subplot(N,2,2*n);
    plot(x*1e9,prob,'linewidth',2)
    grid on;
    xlabel('x (nm)');
    ylabel(['|\psi_',num2str(n),'(x)|^2']);
    title(['Probability density ,E = ', num2str(E_ev,'%.3f'),'ev'])
    
    
end