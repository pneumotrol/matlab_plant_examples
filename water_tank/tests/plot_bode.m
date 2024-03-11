function plot_bode()
    ze = 1;
    assignin("base","x0",[ze;0]);
    assignin("base","option",struct("ze",ze));

    % [A,B,C,D] = linmod("plant_simscape");
    param = plant_param();
    option = struct("ze",ze);
    sysc = plant_sysc(param,option);

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
