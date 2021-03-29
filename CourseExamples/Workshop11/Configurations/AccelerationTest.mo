within CourseExamples.Workshop11.Configurations;
model AccelerationTest
  extends Templates.StandardCar(
    redeclare Subsystems.BasicEngine engine,
    redeclare Subsystems.FixedTransmission transmission,
    redeclare Subsystems.RigidShaft shaft,
    redeclare Subsystems.IdealChassis chassis(v_start=25));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-112,-8},{-92,12}})));
equation
  connect(const.y, engine.throttle) annotation (Line(points={{-91,2},{-78.6,2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}})),
    Icon(coordinateSystem(extent={{-120,-120},{120,120}})),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end AccelerationTest;
