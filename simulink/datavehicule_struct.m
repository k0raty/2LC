% Data véhicule

% M:    Masse (kg)	 
% gr:   Coefficient du réducteur (/)	 
% g:    La gravité (m/s²)	 
% Cr:   Coefficient au roulement	 
% p:    La pente
% Cx:   Coefficient de pénétration dans l’air (/)	 
% ro:   Masse volumique (kg/m3)	 
% r:    Rayon d’une roue (m)
elems = Simulink.BusElement.empty(8,0);
elems(1) = Simulink.BusElement;
elems(2) = Simulink.BusElement;
elems(3) = Simulink.BusElement;
elems(4) = Simulink.BusElement;
elems(5) = Simulink.BusElement;
elems(6) = Simulink.BusElement;
elems(7) = Simulink.BusElement;
elems(8) = Simulink.BusElement;

elems(1).Name = 'M';
elems(2).Name = 'gr';
elems(3).Name = 'g';
elems(4).Name = 'Cr';
elems(5).Name = 'p';
elems(6).Name = 'Cx';
elems(7).Name = 'ro';
elems(8).Name = 'r';

Datavehicule = Simulink.Bus;
Datavehicule.Elements = elems;

%{
elems(1).M=1400;
elems(1).gr= 17/64;
elems(1).g=9.81;
elems(1).Cr=0.013;
elems(1).p=0;
elems(1).Cx=0.25;
elems(1).ro=1.23;
elems(1).r=0.29;
%}
 
