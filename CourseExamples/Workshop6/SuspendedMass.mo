within CourseExamples.Workshop6;
model SuspendedMass
  extends MassInGravityField(mass(r_CM={Modelica.Constants.eps,Modelica.Constants.eps,
          Modelica.Constants.eps}));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r={Modelica.Constants.eps,
        Modelica.Constants.eps,Modelica.Constants.eps}) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-22,86})));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel(
    c=25,
    d=1,
    s_small=Modelica.Constants.eps) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-22,52})));
equation
  connect(fixed.frame_b, springDamperParallel.frame_a) annotation (Line(
      points={{-22,76},{-22,62}},
      color={95,95,95},
      thickness=0.5));
  connect(springDamperParallel.frame_b, mass.frame_a) annotation (Line(
      points={{-22,42},{-22,28},{2,28}},
      color={95,95,95},
      thickness=0.5));
end SuspendedMass;
