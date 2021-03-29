within CourseExamples.Workshop11.Subsystems;
model FixedTransmission
  extends Interfaces.Transmission;
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=ratio)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  parameter Real ratio=1.0 "Transmission ratio (flange_a.phi/flange_b.phi)";
equation
  connect(engineFlange, idealGear.flange_a) annotation (Line(points={{-100,0},{-10,0}}, color={0,0,0}));
  connect(idealGear.flange_b, drivelineFlange) annotation (Line(points={{10,0},{100,0}}, color={0,0,0}));
  annotation (Icon(graphics={Bitmap(extent={{-52,-48},{54,44}}, fileName="C:/Users/xsy98/Desktop/2.PNG")}));
end FixedTransmission;
