within CourseExamples.Workshop5;
model SolarCollector
  Modelica.Blocks.Interfaces.RealInput G
    annotation (Placement(transformation(extent={{-94,38},{-54,78}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(extent={{-94,-70},{-54,-30}})));
  import siu = Modelica.Units.SI;
  parameter Real a0=0.75, a1=4.4, a2=0.004, b0=0.108;
  parameter siu.Angle Theta0=84.4 "Angle";
  parameter siu.Area A=500 "Area";
  parameter siu.Temperature Tamb=15 "Ambient Temperature";
  siu.HeatFlowRate Q_flow "Heat flow rate";
  Real n;
  Real F;
  siu.TemperatureDifference Delta_T "TemperatureDifference";

algorithm
  if theta<=Theta0 then
    F:=1 - b0*(1/cos(theta) - 1);
  else
    F:=0;
  end if;
equation
  Q_flow = port_b.Q_flow;
  Q_flow = -n * A * G;
  Delta_T = port_b.T - Tamb;
  n = F * (a0 - a1*Delta_T/max(G,0.0001) - a2*(Delta_T^2)/max(G,0.0001));
  annotation (Icon(graphics,
                   coordinateSystem(preserveAspectRatio=false)), Diagram(graphics,
        coordinateSystem(preserveAspectRatio=false)));
end SolarCollector;
