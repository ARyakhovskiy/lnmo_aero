function M = Mach(v,T) %расчет числа Маха при cкорости v и температуре T

R = 8.31; %Газовая постоянная
molar_mass = 29e-03; %Молярная масса воздуха [kg/mol]
gamma = 1.4; %Показатель адиабаты воздуха

a = (gamma*R*T/molar_mass).^0.5; %Скорость звука [m/s]
M = v./a;