within CourseExamples.Experiments;
model ControlledMotor
  Components.Electrical.ElectricalMotor motor(J=1)
    annotation (Placement(transformation(extent={{12,0},{32,20}})));
  Modelica.Blocks.Sources.Constant const
    annotation (Placement(transformation(extent={{-38,12},{-18,32}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{64,-4},{84,16}})));
equation
  connect(const.y, motor.v1) annotation (Line(points={{-17,22},{2,22},{2,13.4},
          {13.2,13.4}}, color={0,0,127}));
  connect(motor.flange_b1, inertia.flange_a)
    annotation (Line(points={{31,6.6},{64,6}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ControlledMotor;
