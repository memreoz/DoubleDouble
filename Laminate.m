close all;clear all;clc
%% Composite material properties

mat.E1 = 79.5E9; % [Pa]
mat.E2 = 79.5E9;
mat.v12 = 0.0577;
mat.G12 = 3.3E9;
mat.v21 = (mat.E2/mat.E1)*mat.v12;

%intial angles
Phi = 0;
Psi = 90;
%increment
i = 10;
k = 1;


for a=0:10:90
    Phi = a
    % Laminate Geometrical Features
    theta = [Phi -Phi Psi -Psi];

    z0 = -2* 0.67e-3;
    z1 = -1* 0.67e-3;
    z2 =  0* 0.67e-3;
    z3 =  1* 0.67e-3;
    z4 =  2* 0.67e-3;
    z = [z0 z1 z2 z3 z4];

    %% Reduced Stiffness Matrices
    Q11 = mat.E1 / (1-mat.v12*mat.v21);
    Q12 = (mat.v12*mat.E2) / (1-(mat.v12*mat.v21));
    Q22 = mat.E2 / (1-mat.v12*mat.v21);
    Q66 = mat.G12;

    Qij1 = Qij(Q11, Q12, Q22, Q66, theta(1));
    Qij2 = Qij(Q11, Q12, Q22, Q66, theta(2));
    Qij3 = Qij(Q11, Q12, Q22, Q66, theta(3));
    Qij4 = Qij(Q11, Q12, Q22, Q66, theta(4));


    %% Stiffness matrix
    Stiff = Stiff(Qij1, Qij2, Qij3, Qij4, z);
    A11 = Stiff(1,1)
end
