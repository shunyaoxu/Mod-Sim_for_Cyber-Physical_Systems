within CourseExamples.Workshop8.House.Components;
model Pane
  Modelica.Blocks.Interfaces.RealInput G
    annotation (Placement(transformation(extent={{-94,38},{-54,78}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(extent={{-94,-70},{-54,-30}})));
  import siu = Modelica.Units.SI;
  parameter Real a0=0.75;
  parameter Real a1=4.4;
  parameter Real a2=0.004;
  parameter siu.Area A "Area of the collector";
  Real eff;
  Real F;
  Real G_aux "Variable used to avoid G0";

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
equation
  port_a.Q_flow = -port_b.Q_flow;
  port_b.Q_flow = -eff*A*G;
  G_aux = if abs(G) < Modelica.Constants.eps then Modelica.Constants.eps else G;
  eff = F * (a0 - a1*(port_b.T - port_a.T)/G_aux - a2*(port_b.T - port_a.T)^2/G_aux);
  F = if theta > 84.8 then 0.0 else 1-0.108*(1/cos(theta/360*2*Modelica.Constants.pi)-1);
  annotation (Icon(graphics,
                   coordinateSystem(preserveAspectRatio=false)), Diagram(graphics,
        coordinateSystem(preserveAspectRatio=false)));
end Pane;
