within CourseExamples.Workshop8.House.Experiments;
model WindowHouse
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outTemp
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Sources.Sine theta(
    amplitude=55.5,
    f=1/86400,
    phase=1.5707963267949,
    offset=97.5)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,-30})));
  Modelica.Blocks.Sources.Sine radiation(
    amplitude=500,
    f=1/86400,
    phase=-1.5707963267949)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,-70})));
  Modelica.Blocks.Sources.Constant const(k=273.15) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Rooms.WindowRoom house annotation (Placement(transformation(extent={{0,-10},{20,10}})));
equation
  connect(const.y, outTemp.T) annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
  connect(theta.y, house.theta) annotation (Line(points={{59,-30},{32,-30},{32,-4},{22,-4}}, color={0,0,127}));
  connect(radiation.y, house.radiation) annotation (Line(points={{59,-70},{26,-70},{26,-8},{22,-8}}, color={0,0,127}));
  connect(outTemp.port, house.winPort)
    annotation (Line(points={{-20,0},{-18,0},{-18,32},{34,32},{34,0},{20,0}}, color={191,0,0}));
  connect(outTemp.port, house.wallPort)
    annotation (Line(points={{-20,0},{-18,0},{-18,4},{-6,4},{-6,0},{0,0}}, color={191,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=172800, __Dymola_Algorithm="Dassl"));
end WindowHouse;
