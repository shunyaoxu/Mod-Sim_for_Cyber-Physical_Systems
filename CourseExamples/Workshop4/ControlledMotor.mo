within CourseExamples.Workshop4;
model ControlledMotor
  Components.Electrical.ElectricalMotor motor(ratio=2,
                                              J=1)
    annotation (Placement(transformation(extent={{-14,0},{6,20}})));
  replaceable
  Modelica.Blocks.Sources.Ramp speed_sp(
    height=-50,
    duration=10,
    offset=200,
    startTime=200) constrainedby Modelica.Blocks.Interfaces.SO
    annotation (Placement(transformation(extent={{-96,0},{-76,20}})));
  Modelica.Blocks.Continuous.LimPID PID(
    k=20,
    Ti=10,
    Td=0.01,
    yMax=300,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent={{-56,0},{-36,20}})));
  Modelica.Mechanics.Rotational.Sources.LinearSpeedDependentTorque load(
      tau_nominal=-10, w_nominal=200)
    annotation (Placement(transformation(extent={{26,0},{46,20}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{66,0},{86,20}})));
equation
  connect(speed_sp.y, PID.u_s)
    annotation (Line(points={{-75,10},{-58,10}}, color={0,0,127}));
  connect(PID.y, motor.v1) annotation (Line(points={{-35,10},{-18,10},{-18,13.4},
          {-12.8,13.4}}, color={0,0,127}));
  connect(motor.flange_b1, load.flange) annotation (Line(points={{5,6.6},{18,
          6.6},{18,-8},{46,-8},{46,10}}, color={0,0,0}));
  connect(load.flange, speedSensor.flange)
    annotation (Line(points={{46,10},{66,10}}, color={0,0,0}));
  connect(speedSensor.w, PID.u_m) annotation (Line(points={{87,10},{92,10},{92,
          -16},{-46,-16},{-46,-2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=300, __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end ControlledMotor;
