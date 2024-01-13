function dxdt = plant_ode(~,x,u,param)
    m = param.m;
    d = param.d;

    dxdt = [
        x(2)
        -(d/m)*x(2)+(1/m)*u(1);
        ];
end