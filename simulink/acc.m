% Déterminer l'acceleration
% fait par moi
% le 6 mars 2011

for i=1:(1175-1)
    acceleration(i)= (10/36)*(cycle.Speed(i+1)-cycle.Speed(i))/(cycle.Time(i+1)-cycle.Time(i));
    acceleration(end+1)=0;
    acceleration = acceleration.'; %transpose
    end

