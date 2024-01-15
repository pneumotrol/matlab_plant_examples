function sysc = plant_sysc(param,mode)
    g = param.g;
    m = param.m;
    l = param.l;

    switch mode
        case {"bottom"}
            % equilibrium point
            sysc.xe = [0;0];

            % coefficients of state eqiation
            sysc.A = [
                0, 1;
                (g/l),0;
                ];

            sysc.B = [
                0;
                (1/(m*l^2))];

            sysc.C = eye(2);

            sysc.D = zeros(2,1);
        case {"top"}
            % equilibrium point
            sysc.xe = [pi;0];

            % coefficients of state eqiation
            sysc.A = [
                0, 1;
                -(g/l),0;
                ];

            sysc.B = [
                0;
                (1/(m*l^2))];

            sysc.C = eye(2);

            sysc.D = zeros(2,1);
    end
end