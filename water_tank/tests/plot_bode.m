function plot_bode()
    param = plant_param();
    option = struct("ze",1);
    sysc = plant_sysc(param,option);

    assignin("base","x0",sysc.xe);
    assignin("base","option",option);
    % [A,B,C,D] = linmod("plant_simscape");

    figure("Name","water_tank bode plot");
    opts = bodeoptions;
    opts.Title.String = "";
    opts.XLabel.String = "frequency";
    opts.XLabel.FontSize = 12;
    opts.YLabel.String = ["magnitude","phase"];
    opts.YLabel.FontSize = 12;
    opts.TickLabel.FontSize = 12;
    opts.InputLabels.Color = [1,1,1];
    opts.OutputLabels.Color = [1,1,1];

    % bode(ss(A,B,C,D),"-r",ss(sysc.A,sysc.B,sysc.C,sysc.D),":g",opts);
    bode(ss(sysc.A,sysc.B,sysc.C,sysc.D),":g",opts);
end
