within CourseExamples.Components.Mechanical;
model MyRevolute
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(
    useAxisFlange=true,
    n=n,
    phi(fixed=true),
    w(fixed=true))
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d=d)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(
        transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(
        transformation(rotation=0, extent={{90,-70},{110,-50}})));
  parameter Modelica.Units.SI.RotationalDampingConstant d=0.1
    "Damping constant" annotation (Dialog(group="Mechanical"));
  parameter Modelica.Mechanics.MultiBody.Types.Axis n={0,0,1}
    "Axis of rotation resolved in frame_a (= same as in frame_b)"
    annotation (Dialog(group="Mechanical"));
equation
  connect(damper.flange_b,revolute1. axis) annotation (Line(points={{-40,40},{-40,20},{-50,20},{-50,10}}));
  connect(revolute1.support,damper. flange_a) annotation (Line(points={{-56,10},{-56,20},{-60,20},{-60,40}}));
  connect(frame_a, revolute1.frame_a) annotation (Line(points={{-100,-60},{-80,
          -60},{-80,0},{-60,0}}, color={95,95,95}));
  connect(frame_b, revolute1.frame_b) annotation (Line(points={{100,-60},{30,
          -60},{30,0},{-40,0}}, color={95,95,95}));
end MyRevolute;
