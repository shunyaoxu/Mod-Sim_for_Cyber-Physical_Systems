within CourseExamples.Workshop8.House.Components;
model LayeredWall
  parameter Modelica.Units.SI.ThermalConductance G_wall1 "Thermal conductance of wall1";
  parameter Modelica.Units.SI.ThermalConductance G_wall2 "Thermal conductance of wall2";
  parameter Modelica.Units.SI.HeatCapacity C_wall "Heat Capacity";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor layer1(G=G_wall1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor layer2(G=G_wall2)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor wallHeatCapacity(C=C_wall)
    annotation (Placement(transformation(extent={{-16,0},{16,32}})));
equation
  connect(port_a, layer1.port_a) annotation (Line(points={{-100,0},{-60,0}}, color={191,0,0}));
  connect(layer1.port_b, wallHeatCapacity.port) annotation (Line(points={{-40,0},{0,0}}, color={191,0,0}));
  connect(wallHeatCapacity.port, layer2.port_a) annotation (Line(points={{0,0},{40,0}}, color={191,0,0}));
  connect(layer2.port_b,port_b)  annotation (Line(points={{60,0},{100,0}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          lineThickness=1),
        Rectangle(
          extent={{-80,80},{-40,-80}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,80},{80,-80}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-32,18},{34,-14}},
          textColor={28,108,200},
          textString="Wall")}),                                  Diagram(coordinateSystem(preserveAspectRatio=false)));
end LayeredWall;
