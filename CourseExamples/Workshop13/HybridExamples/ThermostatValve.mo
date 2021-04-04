within CourseExamples.Workshop13.HybridExamples;
model ThermostatValve
  extends Modelica.Fluid.Interfaces.PartialTwoPort;
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal=5000,
    m_flow_nominal=5) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  ThermostatLogicSign thermostatLogicSign(s_min=0.1) annotation (Placement(transformation(extent={{-14,50},{6,70}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1.0,
    T=1.0,
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{20,50},{40,70}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(
    k=1.0,
    T=1.0,
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{-50,50},{-30,70}})));
equation
  connect(port_a, temperature.port) annotation (Line(points={{-100,0},{-70,0},{-70,50}}, color={0,127,255}));
  connect(temperature.T, firstOrder1.u) annotation (Line(points={{-63,60},{-52,60}}, color={0,0,127}));
  connect(firstOrder1.y, thermostatLogicSign.u) annotation (Line(points={{-29,60},{-16,60}}, color={0,0,127}));
  connect(thermostatLogicSign.y, firstOrder.u) annotation (Line(points={{7,60},{18,60}}, color={0,0,127}));
  connect(firstOrder.y, valveLinear.opening) annotation (Line(points={{41,60},{50,60},{50,8}}, color={0,0,127}));
  connect(valveLinear.port_b, port_b) annotation (Line(points={{60,0},{100,0}}, color={0,127,255}));
  connect(valveLinear.port_a, temperature.port) annotation (Line(points={{40,0},{-70,0},{-70,50}}, color={0,127,255}));
end ThermostatValve;
