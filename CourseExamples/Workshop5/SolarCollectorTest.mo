within CourseExamples.Workshop5;
model SolarCollectorTest
  SolarCollector solarCollector(
    a0=0.75,
    a1=4.4,
    a2=0.004,
    b0=0.108,
    Theta0=1.4730578886832,
    A=500,
    Tamb=288.15)
           annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Blocks.Sources.Sine G(
    amplitude=1000,
    f=1/86400,
    phase=-1.5707963267949)
    annotation (Placement(transformation(extent={{-88,28},{-68,48}})));
  Modelica.Blocks.Sources.Sine theta(
    amplitude=60,
    f=1/86400,
    phase=1.5707963267949,
    offset=100)
    annotation (Placement(transformation(extent={{-88,-34},{-68,-14}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg
    annotation (Placement(transformation(extent={{-46,-34},{-26,-14}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=
        288.15) annotation (Placement(transformation(extent={{32,-8},{52,12}})));
equation
  connect(G.y, solarCollector.G) annotation (Line(points={{-67,38},{-16,38},{
          -16,25.8},{-7.4,25.8}}, color={0,0,127}));
  connect(theta.y, from_deg.u)
    annotation (Line(points={{-67,-24},{-48,-24}}, color={0,0,127}));
  connect(from_deg.y, solarCollector.theta) annotation (Line(points={{-25,-24},
          {-16,-24},{-16,15},{-7.4,15}}, color={0,0,127}));
  connect(solarCollector.port_b, fixedTemperature.port)
    annotation (Line(points={{8,20},{58,20},{58,2},{52,2}}, color={191,0,0}));
  annotation (
    Icon(graphics,
         coordinateSystem(preserveAspectRatio=false)),
    Diagram(graphics,
            coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end SolarCollectorTest;
