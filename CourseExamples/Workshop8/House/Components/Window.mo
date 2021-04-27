within CourseExamples.Workshop8.House.Components;
model Window
  parameter Modelica.Units.SI.Area A_window "Window area";
  parameter Modelica.Units.SI.ThermalConductance Gc_window "Convective thermal conductance in the window";
  Modelica.Thermal.HeatTransfer.Components.Convection winConv annotation (Placement(transformation(extent={{40,30},{20,50}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside
    annotation (Placement(transformation(extent={{90,30},{110,50}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b inside
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-20})));
  Modelica.Blocks.Interfaces.RealInput radiation
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60})));
  Modelica.Blocks.Sources.RealExpression con(y=Gc_window) annotation (Placement(transformation(extent={{-6,62},{14,82}})));
  Pane pane(
    a0=0.722,
    a1=0,
    a2=0,
    A=A_window) annotation (Placement(transformation(extent={{40,-40},{20,-20}})));
equation
  connect(con.y, winConv.Gc) annotation (Line(points={{15,72},{30,72},{30,50}}, color={0,0,127}));
  connect(winConv.solid, outside) annotation (Line(points={{40,40},{100,40}}, color={191,0,0}));
  connect(winConv.fluid, inside) annotation (Line(points={{20,40},{0,40},{0,0},{-100,0}}, color={191,0,0}));
  connect(pane.port_b, inside) annotation (Line(points={{22,-30},{0,-30},{0,0},{-100,0}}, color={191,0,0}));
  connect(pane.port_a, outside) annotation (Line(points={{36.8,-30},{52,-30},{52,40},{100,40}}, color={191,0,0}));
  connect(theta, pane.theta) annotation (Line(points={{120,-20},{82,-20},{82,-35},{37.4,-35}}, color={0,0,127}));
  connect(radiation, pane.G) annotation (Line(points={{120,-60},{70,-60},{70,-24.2},{37.4,-24.2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.None),
        Rectangle(
          extent={{-60,60},{60,-60}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.None),
        Text(
          extent={{-36,20},{40,-18}},
          textColor={28,108,200},
          textString="Window")}),                                Diagram(coordinateSystem(preserveAspectRatio=false)));
end Window;
