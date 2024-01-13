function sysc = plant_sysc(param)
    m = param.m;
    d = param.d;
    k = param.k;

    A = [
        0, 1;
        -(k/m),-(d/m)
        ];

    B = [
        0;
        (1/m)];

    C = [
        1, 0;
        ];

    D = 0;

    sysc = ss(A,B,C,D);
end