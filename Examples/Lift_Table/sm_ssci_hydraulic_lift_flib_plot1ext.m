% Code to plot simulation results from sm_ssci_hydraulic_lift_flib
% Copyright 2015-2023 The MathWorks, Inc.

% Reuse figure if it exists, else create new figure
try
    figure(h1_sm_ssci_hydraulic_lift_flib)
catch
    h1_sm_ssci_hydraulic_lift_flib=figure('Name', 'sm_ssci_hydraulic_lift_flib');
end

% Generate simulation results if they don't exist
if(~exist('simlog_sm_ssci_hydraulic_lift_flib','var'))
    sim('sm_ssci_hydraulic_lift_flib')
end

% Get simulation results
simlog_t = simlog_sm_ssci_hydraulic_lift_flib.Prismatic_Cylinder_Piston.Pz.p.series.time;
simlog_zCyl = simlog_sm_ssci_hydraulic_lift_flib.Prismatic_Cylinder_Piston.Pz.p.series.values('mm');
simlog_zVal = logsout_sm_ssci_hydraulic_lift_flib.get('xSpool');

% Plot results
simlog_handles(1) = subplot(2,1,1);
plot(simlog_t,simlog_zCyl,'LineWidth',1);
grid on
title('Cylinder Extension');
ylabel('Extension (mm)');
simlog_handles(2) = subplot(2,1,2);
plot(simlog_zVal.Values.Time,simlog_zVal.Values.Data,'LineWidth',1);
grid on
title('Valve Position');
ylabel('Position (mm)');
xlabel('Time (s)');

linkaxes(simlog_handles,'x');

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_zCyl simlog_zVal

