within CourseExamples.Workshop8.House.Components;
model Radiator
  parameter Modelica.Units.SI.Temperature T_ref "Reference temperature";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Fluid.Pipes.DynamicPipe radiator(
    redeclare package Medium = Modelica.Media.Water.WaterIF97_ph,
    length=10,
    diameter=0.01,
    nNodes=1,
    modelStructure=Modelica.Fluid.Types.ModelStructure.av_b,
    use_HeatTransfer=true,
    redeclare model HeatTransfer = Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium = Modelica.Media.Water.WaterIF97_ph,
    dp_nominal=130000,
    m_flow_nominal=0.01)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a inPort(redeclare package Medium = Modelica.Media.Water.WaterIF97_ph)
                                               annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b outPort(redeclare package Medium = Modelica.Media.Water.WaterIF97_ph)
                                                annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  inner Modelica.Fluid.System system annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Continuous.LimPID PI(
    k=0.005,
    Ti=10,
    yMax=1,
    yMin=0.01)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,34})));
  Modelica.Blocks.Sources.Constant const(k=T_ref)
                                         annotation (Placement(transformation(extent={{-86,50},{-66,70}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor T_sensor
    annotation (Placement(transformation(extent={{-10,24},{-30,44}})));
equation
  connect(inPort, valveLinear.port_a) annotation (Line(points={{-100,0},{-60,0}}, color={0,127,255}));
  connect(valveLinear.port_b, radiator.port_a) annotation (Line(points={{-40,0},{-10,0},{-10,0}}, color={0,127,255}));
  connect(radiator.port_b, outPort) annotation (Line(points={{10,0},{100,0},{100,0}}, color={0,127,255}));
  connect(radiator.heatPorts[1], heatPort) annotation (Line(points={{0.1,4.4},{0.1,84},{0,84},{0,100}}, color={127,0,0}));
  connect(const.y, PI.u_s) annotation (Line(points={{-65,60},{-50,60},{-50,46}}, color={0,0,127}));
  connect(PI.y, valveLinear.opening) annotation (Line(points={{-50,23},{-50,8}}, color={0,0,127}));
  connect(PI.u_m, T_sensor.T) annotation (Line(points={{-38,34},{-31,34}}, color={0,0,127}));
  connect(T_sensor.port, heatPort) annotation (Line(points={{-10,34},{0.1,34},{0.1,84},{0,84},{0,100}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,80},{78,-80}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.None),
        Line(
          points={{-60,80},{-60,-80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-40,80},{-40,-80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-20,80},{-20,-80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{0,80},{0,-80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{20,80},{20,-80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{40,80},{40,-80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{60,80},{60,-80}},
          color={28,108,200},
          thickness=1)}),                                        Diagram(coordinateSystem(preserveAspectRatio=false)));
end Radiator;
