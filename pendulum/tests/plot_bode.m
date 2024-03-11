function plot_bode()
    q1e = pi;
    assignin("base","x0",[q1e;0]);
    assignin("base","option",struct("q1e",q1e));

    [A,B,C,D] = linmod("plant_simscape");
    param = plant_param();
    option = struct("q1e",q1e);
    sysc = plant_sysc(param,option);

    figure("Name","pendulum bode plot");
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
