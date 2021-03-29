within CourseExamples.Workshop11.Subsystems;
model RigidShaft
  extends Interfaces.Shaft;
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  parameter Modelica.Units.SI.Inertia J=0.1 "Moment of inertia";
equation
  connect(flange_a, inertia.flange_a) annotation (Line(points={{-100,0},{-10,0}}, color={0,0,0}));
  connect(inertia.flange_b, flange_b) annotation (Line(points={{10,0},{100,0}}, color={0,0,0}));
  annotation (Icon(graphics={Bitmap(extent={{-46,-44},{58,50}}, fileName="C:/Users/xsy98/Desktop/3.PNG")}));
end RigidShaft;
