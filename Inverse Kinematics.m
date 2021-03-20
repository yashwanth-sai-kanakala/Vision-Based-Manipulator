function q = ik (K)
% Anthropomorphic arm with 3 DOF
% It calculates the Inverse Kinematic of an Anthropomorphic arm with 3 DOF.
% 'q' is the solutions in radiant and K is the direct Kinematic matrix.
%           
               K = [ 1 0 0 95
                     0 1 0 215
                    0 0 1 1
                    0 0 0 1]
% where n, s, a are three vectors fo 3 el
a2=9;         % [m]
a3=8;         % [m]ements that represents the
% end-effector's orientation, and p is the desired end-effector position.

% Denavit-Hartenberg's Parameters
a1=0;           % [m]
alfa1=pi/2;     % [rad]
alfa2=0;        % [rad]
alfa3=0;        % [rad]

dk=K;          % Direct kinematics matrix

% Inverse Kinematic
pw_x=dk(1,4);   % Vector's components that representes the end-effector position
pw_y=dk(2,4);
pw_z=dk(3,4);

c3=(pw_x^2+pw_y^2+pw_z^2-a2^2-a3^2)/(2*a2*a3);  % cos(teta3)
s3=-sqrt(1-c3^2);        % sin(teta3)
teta3=atan2(s3,c3);

c2=(sqrt(pw_x^2+pw_y^2)*(a2+a3*c3)+pw_z*a3*s3)/(a2^2+a3^2+2*a2*a3*c3);      % cos(teta2)
s2=(pw_z*(a2+a3*c3)-sqrt(pw_x^2+pw_y^2)*a3*s3)/(a2^2+a3^2+2*a2*a3*c3);      % sin(teta2)
teta2=atan2((a2+a3*c3)*pw_z-a3*s3*sqrt(pw_x^2+pw_y^2),(a2+a3*c3)*sqrt(pw_x^2+pw_y^2)+a3*s3*pw_z);

teta1=atan2(pw_y,pw_x);

q=[teta1 teta2 teta3]';     % Solutions in radiant