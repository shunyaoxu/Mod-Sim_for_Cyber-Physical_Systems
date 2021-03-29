within CourseExamples.Workshop10;
model FreeFalling
  inner Modelica.Mechanics.MultiBody.World world annotation (Placement(transformation(extent={{24,22},{44,42}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(
    r_0(fixed=true),
    v_0(fixed=true),
    angles_fixed=true,
    w_0_fixed=true,
    useQuaternions=false) annotation (Placement(transformation(extent={{42,54},{62,74}})));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=2, __Dymola_Algorithm="Dassl"));
end FreeFalling;
