function [ Ft Facc Froul Fprof Faero ] = ForceTrac( time, velocity )
% Calcule les forces necessaires au déplacement d'un vehicule
% time est en sec
% velocity est en m/s

datavehicule;

% le vecteur time et velocity ont la même taille et doivent avoir au
% minimum 2 colonnes
[l c]=size(time);
if l>c              % inversion des lignes et des colonnes 
   time=time';
   velocity=velocity'
end
[l c]=size(time);

acceleration(1)=0; % donne la même taille au vecteur
for i=1:(c-1)
    acceleration(i+1)= (velocity(i+1)-velocity(i))/(time(i+1)-time(i));
end

% Equations mecanique
  delta=1.04+0.0025*gr^2;
Facc=delta.*M.*acceleration; % .* multiplication terme à terme
Froul=(M.*g.*Cr).*ones(1,c);
Fprof=M.*g.*sin(atan(p)).*ones(1,c);
  Sf=1.6+0.00056*(M-765);
Faero=0.5*ro*Cx*Sf.*velocity.^2;

Ft=Facc+Froul+Fprof+Faero;

% % test
% % 50km/h = 50*1000/3600m/s
% [ Ft Facc Froul Fprof Faero ] = ForceTrac( [0, 10], [50*1000/3600, 50*1000/3600] )
% [ Ft Facc Froul Fprof Faero ] = ForceTrac( [0, 10], [0*1000/3600, 100*1000/3600] )
% [ Ft Facc Froul Fprof Faero ] = ForceTrac( cycle.Time, cycle.Speed.*1000/3600 )

end

