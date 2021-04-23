within CourseExamples.Workshop15;
model AccelerationInput "Use of model accelerate"

  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Sources.Accelerate accelerate
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(L=1, m=1)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Interfaces.RealInput a_ref_input annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
equation
  connect(accelerate.flange, mass.flange_a) annotation (Line(
      points={{10,0},{30,0}},   color={0,127,0}));
  connect(a_ref_input, accelerate.a_ref) annotation (Line(points={{-100,0},{-12,0}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
Demonstrate usage of component
<a href=\"modelica://Modelica.Mechanics.Translational.Sources.Accelerate\">Sources.Accelerate</a>
by moving a mass with a predefined acceleration.
</p>
</html>"),
       experiment(StopTime=1.0, Interval=0.001));
end AccelerationInput;
