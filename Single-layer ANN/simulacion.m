%% Simulador
clc
clear
close all
load('Dataset')


F=dataset(:,1:6);
F1=dataset(:,7);

data=(-1)+((1-(-1)).*(F-min(F))./(max(F)-min(F))); 

IW=[2.23157695424241	-0.991566571847462	-0.912780086518255	-0.987911935749399	-0.0194837817272169	0.462672164013927;-0.395919905035981	0.161483069101776	-0.00493620901953337	0.00545776888277439	-0.207018973548744	-0.240719892077949;0.250332114471400	1.33495701275023	-1.09542479879375	1.66169095463630	0.426309778246124	0.796388031691293;2.68684466494082	2.11895672154930	-1.52412018302838	-1.53484455942512	-0.956396740835419	-0.687207554173258;0.779967824869700	-3.73244235006801	-1.03339115746511	-1.67688861796722	0.537452457840910	-0.321802894926445];

b1=[-1.63685050093807;-0.271123806336400;1.17908608250869;-0.518211132258614;3.35826028175642];

LW=[-1.22741762116956	-1.14122160436846	0.134876453950338	0.273117799338231	-0.118003015341884];

b2=[-1.25188493683575];


%% Simulación de datos
Simulated = [];
for p=1:length(data)
	in=data(p,:);
	a1=tansig((in*IW')+b1');
	a2=purelin(a1*LW'+b2);
	calc = a2;
	Simulated(p) = [calc];
end


OutputRed=(min(F1))+((max(F1)-min(F1)).*(Simulated-(-1))./(1-(-1)));


plot(F(:,1),F1,'b^')
hold on
plot(F(:,1),OutputRed,'k')
title('Energy consumption in Mexico from 1965 to 2021')
legend('Real data','Single-layer ANN','Location','northwest')
grid()
xlabel('Year')
ylabel('Exajoules[EJ]')