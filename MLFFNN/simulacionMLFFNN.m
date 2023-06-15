clc
clear
close all
load('red.mat') %file of structure MLFFNN
load('Dataset') %Data set

F=dataset(:,1:6);
F1=dataset(:,7);

xn = F;

y=net(xn');

figure(2)
plot(F(:,1),F1,'b^')
hold on
plot(F(:,1),y,'k')
title('Energy consumption in Mexico from 1965 to 2021')
legend('Real data','MLFFNN','Location','northwest')
grid()
xlabel('Year')
ylabel('Exajoules[EJ]')