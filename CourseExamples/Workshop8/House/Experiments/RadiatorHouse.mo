within CourseExamples.Workshop8.House.Experiments;
model RadiatorHouse
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
        origin={78,10})));
  Modelica.Blocks.Sources.Sine radiation(
    amplitude=500,
    f=1/86400,
    phase=-1.5707963267949)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={80,-22})));
  Modelica.Blocks.Sources.Constant const(k=273.15) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Rooms.RadiatorRoom house annotation (Placement(transformation(extent={{0,-18},{36,18}})));
  Modelica.Fluid.Sources.FixedBoundary source(
    redeclare package Medium = Modelica.Media.Water.WaterIF97_ph,
    p=250000,
    T=343.15,
    nPorts=1) annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Fluid.Sources.FixedBoundary sink(
    redeclare package Medium = Modelica.Media.Water.WaterIF97_ph,
    p=100000,
    T=303.15,
    nPorts=1) annotation (Placement(transformation(extent={{92,-70},{72,-50}})));
equation
  connect(const.y, outTemp.T) annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
  connect(outTemp.port, house.wallPort) annotation (Line(points={{-20,0},{0,0}}, color={191,0,0}));
  connect(house.winPort, house.wallPort)
    annotation (Line(points={{36,10.8},{54,10.8},{54,40},{-10,40},{-10,0},{0,0}}, color={191,0,0}));
  connect(theta.y, house.theta) annotation (Line(points={{67,10},{54,10},{54,3.6},{39.6,3.6}}, color={0,0,127}));
  connect(radiation.y, house.radiation)
    annotation (Line(points={{69,-22},{64,-22},{64,-20},{56,-20},{56,-3.6},{39.6,-3.6}}, color={0,0,127}));
  connect(source.ports[1], house.port_a)
    annotation (Line(points={{-60,-60},{-8,-60},{-8,-10.8},{0,-10.8}}, color={0,127,255}));
  connect(sink.ports[1], house.port_b)
    annotation (Line(points={{72,-60},{56,-60},{56,-58},{46,-58},{46,-10.8},{36,-10.8}}, color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=172800, __Dymola_Algorithm="Dassl"));
end RadiatorHouse;
