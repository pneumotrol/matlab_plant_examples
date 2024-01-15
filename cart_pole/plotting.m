function plotting()
    assignin("base","x0",[0;0;0;0]);
    assignin("base","mode","bottom");

    simIn = Simulink.SimulationInput("simulation");
    simOut = sim(simIn);

    % plotting
    figure("Name","pendulum"); hold on;
    p1=plot(simOut.logsout.getElement("x_simscape").Values,"LineWidth",1.5,"Color",[1.0,0.0,0.0]);
    p2=plot(simOut.logsout.getElement("x_ode").Values,"--","LineWidth",1.5,"Color",[0.0,0.0,1.0]);
    p3=plot(simOut.logsout.getElement("x_sysc").Values,":","LineWidth",1.5,"Color",[0.0,0.5,0.0]);

    ax = gca; ax.FontSize = 12;
    xlabel("time (s)");
    ylabel("state");
    legend([p1(1),p2(1),p3(1)],["simscape","ode","sysc"]);
end