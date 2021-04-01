within CourseExamples.Workshop12.Subsystems;
model BasicEngine
  extends Interfaces.Engine;
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Math.Gain gain(k=max_torque) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (Placement(transformation(extent={{42,-10},{62,10}})));

  parameter Real max_torque=300 "Gain value multiplied with input signal";
equation
  connect(throttle, limiter.u) annotation (Line(points={{-106,0},{-62,0}}, color={0,0,127}));
  connect(limiter.y, gain.u) annotation (Line(points={{-39,0},{-10,0}}, color={0,0,127}));
  connect(gain.y, torque.tau) annotation (Line(points={{13,0},{40,0}}, color={0,0,127}));
  connect(torque.flange, transmissionFlange) annotation (Line(points={{62,0},{100,0}}, color={0,0,0}));
  annotation (Icon(graphics={Bitmap(extent={{-58,-42},{62,50}}, fileName="C:/Users/xsy98/Desktop/1.PNG")}));
end BasicEngine;
