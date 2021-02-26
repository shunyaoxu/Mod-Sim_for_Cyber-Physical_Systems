within CourseExamples.Workshop7;
model SolarCollector "Solar collector with effiency and losses"

  Modelica.Blocks.Interfaces.RealInput G "Global radiation incident"
    annotation (Placement(transformation(extent={{-128,44},{-100,72}}),
        iconTransformation(extent={{-128,44},{-100,72}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b "Heat port"
    annotation (Placement(transformation(extent={{90,0},{110,20}}),
        iconTransformation(extent={{90,0},{110,20}})));
  Modelica.Blocks.Interfaces.RealInput theta "Angle of incidence"
    annotation (Placement(transformation(extent={{-128,-46},{-100,-18}}),
        iconTransformation(extent={{-128,-46},{-100,-18}})));
  import siu = Modelica.Units.SI;
  parameter Real a0=0.75 "Efficiency when operating at ambient temperature" annotation(Dialog(group="Efficiency"));
  parameter Real a1=4.4 "Linear loss factor" annotation(Dialog(group="Tmperature-dependent losses"));
  parameter Real a2=0.004 "Quadratic loss factor" annotation(Dialog(group="Tmperature-dependent losses"));
  constant siu.Angle Theta0=84.4;
  parameter siu.Area A=500 "Area of collector" annotation(Dialog(group="Geometry"));
  parameter siu.Temperature Tamb=15 "Ambient Temperature" annotation(Dialog(group="Efficiency"));
  siu.HeatFlowRate Q_flow "Heat flow rate";
  Real n "Collector efficiency";
  Real F "Angle of incidence factor";
  siu.TemperatureDifference Delta_T "TemperatureDifference";

algorithm
  if theta<=Theta0 then
    F:=1 - 0.108*(1/cos(theta) - 1);
  else
    F:=0;
  end if;
equation
  Q_flow = port_b.Q_flow "Heat flow Generation";
  Q_flow = -n * A * G;
  Delta_T = port_b.T - Tamb;
  n = F * (a0 - a1*Delta_T/max(G,0.0001) - a2*(Delta_T^2)/max(G,0.0001));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{40,80},{46,-80}},
          lineColor={28,108,200},
          fillColor={130,130,130},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{46,20},{68,0}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{68,28},{68,-10},{90,10},{86,14},{68,30},{68,28}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-68,-60},{42,-60},{44,-60}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{-68,-60},{-68,-52},{-66,-40},{-60,-30},{-52,-22}},
          color={28,108,200},
          smooth=Smooth.Bezier,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-54,-24},{38,-60}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Polygon(
          points={{-40,-24},{-44,-32},{26,-58},{28,-48},{-38,-20},{-40,-24}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{28,-40},{20,-62},{36,-58},{28,-40}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,-32},{-64,-38}}, color={0,0,0}),
        Polygon(
          points={{-36,22},{-40,14},{30,-12},{32,-2},{-34,26},{-36,22}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{32,6},{24,-16},{40,-12},{32,6}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-38,74},{-42,66},{28,40},{30,50},{-36,78},{-38,74}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{30,58},{22,36},{38,40},{30,58}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,58},{-4,58}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Line(
          points={{-44,74},{42,40}},
          color={0,0,0},
          smooth=Smooth.Bezier,
          arrow={Arrow.Filled,Arrow.Filled})}),                  Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Model of a solar collector which takes the angle of incidence  and the global radiation incident G as input.</p>
<p>The model outputs how much heat flows into the panel. Heat flow is determined by collector efficiency, collector area, and global radiation incidence.</p>
<p>Collector efficiency is determined by temperature difference between the average fluid temperature and ambient temperature, angle of incidence, and the solar radiation.</p>
<p><br><img src=\"modelica://CourseExamples/../../1.PNG\"/></p>
</html>"));
end SolarCollector;
