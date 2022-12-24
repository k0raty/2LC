%Post_calculation _file
figure(2);
plot(time,acceleration);
xlabel ('time (sec)');
ylabel ('acceleration (m/s^2)');
title('Acceleration');
figure(3)
plot(time, power/1000)
xlabel('time [sec]')
ylabel('power [kw]')
title('Power')
figure(4)
plot(time, energy/1000/3600)
xlabel('time [sec]')
ylabel('energy [kwh]')
title('Energy')
figure(5)
plot(time, H2_consuption/1000)
xlabel('time [sec]')
ylabel('Hydrogen [kg]')
title('Hydrogen Consuption')
figure(6)
plot(time,motor_current)
xlabel('time [sec]')
ylabel('current [amps]')
title('Motor Current')
plot(time,Battery_current)
xlabel('time [sec]')
ylabel('current [amps]')
title('Battery Current')
figure(8)
plot(time,Voltage)
xlabel('time [sec]')
ylabel('Voltage [volt]')
title('Battery Voltage')
figure(9)
plot(time/60,SOC*100)
xlabel('time [min]')
ylabel('persentage of charge [%]')
title('State of Charge')
figure(10)
plot(Range, SOC*100)
xlabel('range [miles]')
ylabel('state of charge [%]')
title('Range as Fnc of SOC')
figure(11)
plot(time/60, Motor_speed_RPM)
xlabel('Time [min]')
ylabel('Motor speed [rpm]')
title('Motor Speed')
figure(12);
plot(time, Actual_vehicle_velocity);
hold on
plot(time, velocity);
xlabel('time');
ylabel('velocity [m/s]');
title('velocity');
legend('Actual vehicle speed', 'drive cycle')
hold off
figure(13);
plot(time, actual_motor_trque, 'g');
hold on
plot(time,Trq_req_motor, 'r --');
hold off
xlabel('Time [sec]');
ylabel('Torque [Nm]');
title('Requested vs Actual Torque');
legend('Actual Motor Torque','Requested Motor Torque')