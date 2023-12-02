function Stiff = Stiff(Qij1, Qij2, Qij3, Qij4, z)
    z0 = z(1);
    z1 = z(2);
    z2 = z(3);
    z3 = z(4);
    z4 = z(5);
    
    A = Qij1*(z1-z0) + Qij2*(z2-z1) + Qij3*(z3-z2) + Qij4*(z4-z3);
    B = (1/2)*((Qij1*(z1^2-z0^2) + Qij2*(z2^2-z1^2) + Qij3*(z3^2-z2^2) + Qij4*(z4^2-z3^2)));
    D = (1/3)*((Qij1*(z1^3-z0^3) + Qij2*(z2^3-z1^3) + Qij3*(z3^3-z2^3) + Qij4*(z4^3-z3^3)));

    Stiff = [A B;B D];
end