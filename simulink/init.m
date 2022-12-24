% initialization file
tire_pres=3.516;
run ('velocity_file.m');
%run ('Range_file.m');
%run('mc_spd.m') %[rad/sec]
%run('mc_trq_motor.m') %[Nm]
t=[0:1:1174]';
V=[t, velocity];
regen_efficency=0;
epsilon=10^-6;
tend=t(end);
mass=870;
g=9.81;
Cd=0.207;
Af=1.34;
rou=1.2041;
efficency_transmission=0.98;
efficency_motor_pos = 0.89;
efficency_motor_neg=0.80;
efficency_batttery_pos =0.95;
efficency_batttery_neg=0.90;
efficency_FC= 0.53;
energy_density_H2=142000;
Vmax=80;
wheeel_radiaus=0.1778; %[meter]
Gear_ratio= 0.89; % 4th gear 1.26; % 3rd gear
final_drive= 4.125; %final drive gear ratio
capacity_batt=8; %KWh
FC_charge=2; %KW