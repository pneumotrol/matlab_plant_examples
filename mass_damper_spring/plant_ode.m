function dxdt = plant_ode(~,x,u,param)
    m = param.m;
    d = param.d;
    k = param.k;

    dxdt = [
        x(2);
        -(k/m)*x(1)-(d/m)*x(2)+(1/m)*u(1);
        ];
end