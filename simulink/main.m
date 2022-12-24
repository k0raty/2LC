run('init.m');
%% FC system model
clear all;
clc;
close all;
gravity=9.81;
mass=870;
time=[0:1:1174]';
run ('velocity_file.m');
t1=[0; time(1:end-1)];
% calculates change in time
dt=time-t1;
%calculates the change in velocity
v1=[0;velocity(1:end-1)];
dv=velocity-v1;
acceleration=[dv./dt];
acceleration(1)=0;
weight=mass*9.81;
tire_pressure=3.516;
%Calculate the coefficent of rolling resistance
crr=0.005+(1/tire_pressure)*(0.01+0.0095*((velocity./100).^2));
%calculate rolling resistance force
Fr=crr*(mass*9.81);
%calculate the wind resistance force (fw=1/2(Cd Av^2))
Cd=0.207;
Af=1.34;
rou=1.2041;
Fw=0.5*(Cd*Af*rou*(velocity.^2));
%calculate the tractive frce
Ft= (mass.*acceleration)+Fw+Fr;
%calculate the power after the transmission which equals the power at the
%wheels
power=Ft.*velocity;
%calculate the power before the transmission
efficency_transmission = 0.98;
Power_transmission = power./efficency_transmission;
%calculates the power before the motor
efficency_motor = 0.89;
power_motor=Power_transmission./efficency_motor;
%calculates power before the battery pack
efficency_batttery = .95;
power_battery=power_motor./efficency_batttery;
%calculate the power before the Fuel Cell
efficency_FC= 0.53;
power_FC=power_battery./efficency_FC;
%calculating energy by integrating the power before the fuel cell, integrat
%in a loop to get the enrgy at each time step
energy=zeros(size(time));
for t2=2:time(end)
energy(t2)=energy(t2-1)+trapz(time(t2-1:t2),power_FC(t2-1:t2));
end
%calculate the hydrogen consumption in grams, knowing that that the energy density of
%hydrogen is 142MJ/kg which is equal to 142,000J/g
H2_consuption = energy./142000;
figure(1)
plot(time,acceleration)
xlabel('Time [sec]')
ylabel('Acceleration [m/s^2]')
title('Acceleration')
figure(2)
plot(time,velocity)
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
title('Velocity')
figure(3)
plot(time, power/1000)
xlabel('Time [sec]')
ylabel('Power [kw]')
title('Power')
figure(4)
plot(time, energy/1000/3600)
xlabel('Time [sec]')
ylabel('Energy [kwh]')
title('Energy')
figure(5)
plot(time, H2_consuption/1000)
xlabel('Time [sec]')
ylabel('Hydrogen [kg]')
title('Hydrogen Consuption')