within CourseExamples.Workshop11.Subsystems;
model IdealChassis
  extends Interfaces.Chassis;
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J_wheel)
    annotation (Placement(transformation(extent={{-70,-12},{-50,8}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel(radius=R_wheel)
    annotation (Placement(transformation(extent={{-30,-12},{-10,8}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=m_chassis, v(fixed=true, start=v_start))
    annotation (Placement(transformation(extent={{16,-12},{36,8}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{58,-12},{78,8}})));
  parameter Modelica.Units.SI.Inertia J_wheel=1 "Moment of inertia";
  parameter Modelica.Units.SI.Distance R_wheel=0.3 "Wheel radius";
  parameter Modelica.Units.SI.Mass m_chassis=1400 "Mass of the sliding mass";
equation
  connect(drivelineFlange, inertia.flange_a) annotation (Line(points={{-100,-1},{-100,-2},{-70,-2}}, color={0,0,0}));
  connect(inertia.flange_b, idealRollingWheel.flangeR) annotation (Line(points={{-50,-2},{-30,-2}}, color={0,0,0}));
  connect(idealRollingWheel.flangeT, mass.flange_a) annotation (Line(points={{-10,-2},{16,-2}}, color={0,127,0}));
  connect(mass.flange_b, speedSensor.flange) annotation (Line(points={{36,-2},{58,-2}}, color={0,127,0}));
  connect(speedSensor.v, speed) annotation (Line(points={{79,-2},{92,-2},{92,0},{106,0}}, color={0,0,127}));
  annotation (Icon(graphics={Bitmap(extent={{-50,-48},{56,50}}, fileName="C:/Users/xsy98/Desktop/4.PNG")}));
end IdealChassis;
