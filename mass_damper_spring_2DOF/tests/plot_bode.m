function plot_bode()
    assignin("base","x0",[0;0;0;0]);

    [A,B,C,D] = linmod("plant_simscape");
    param = plant_param();
    sysc = plant_sysc(param);

    figure("Name","mass_damper_spring_2DOF bode plot");
    opts = bodeoptions;
    opts.Title.String = "";
    opts.XLabel.String = "frequency";
    opts.XLabel.FontSize = 12;
    opts.YLabel.String = ["magnitude","phase"];
    opts.YLabel.FontSize = 12;
    opts.TickLabel.FontSize = 12;
    opts.InputLabels.Color = [1,1,1];
    opts.OutputLabels.Color = [1,1,1];

    bode(ss(A,B,C,D),"-r",ss(sysc.A,sysc.B,sysc.C,sysc.D),":g",opts);
end
