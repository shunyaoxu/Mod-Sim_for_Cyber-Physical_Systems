within CourseExamples.Workshop8.House.Components;
model SimpleWall
  parameter Modelica.Units.SI.ThermalConductance G_wall "Thermal conductance in wall";
  parameter Modelica.Units.SI.ThermalConductance Gc_wall "Convective thermal conductance wall/air";

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b inside
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor wall(G=G_wall)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection wallsAirConv
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=Gc_wall)
                                                        annotation (Placement(transformation(extent={{20,14},{40,34}})));
equation
  connect(realExpression.y, wallsAirConv.Gc) annotation (Line(points={{41,24},{50,24},{50,10}}, color={0,0,127}));
  connect(outside, wall.port_a) annotation (Line(points={{-100,0},{-60,0}}, color={191,0,0}));
  connect(wall.port_b, wallsAirConv.solid) annotation (Line(points={{-40,0},{40,0}}, color={191,0,0}));
  connect(wallsAirConv.fluid, inside) annotation (Line(points={{60,0},{100,0}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-60,60},{60,-60}},
          lineColor={28,108,200},
          lineThickness=1),
        Polygon(
          points={{-60,60},{-40,80},{80,80},{60,60},{-60,60}},
          lineColor={28,108,200},
          lineThickness=1),
        Polygon(
          points={{80,80},{80,-40},{60,-60},{60,60},{80,80}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-36,28},{46,-24}},
          textColor={28,108,200},
          textString="simpleWall")}),                            Diagram(coordinateSystem(preserveAspectRatio=false)));
end SimpleWall;
