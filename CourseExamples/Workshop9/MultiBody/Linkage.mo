within CourseExamples.Workshop9.MultiBody;
model Linkage
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a steerFrame
    annotation (Placement(transformation(extent={{-116,64},{-84,96}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a mountFrame
    annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b uprightFrame
    annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute upperInnerJoint(n(displayUnit="1")=
         {1,0,0})
    annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
  Modelica.Mechanics.MultiBody.Joints.Spherical upperOuterJoint
    annotation (Placement(transformation(extent={{6,30},{26,50}})));
  Modelica.Mechanics.MultiBody.Joints.Spherical lowerOuterJoint
    annotation (Placement(transformation(extent={{6,-50},{26,-30}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute lowerInnerJoint(n(displayUnit="1")=
         {1,0,0})
    annotation (Placement(transformation(extent={{-56,-50},{-36,-30}})));
  Modelica.Mechanics.MultiBody.Joints.SphericalSpherical steerLink(rodLength=
        Modelica.Math.Vectors.length(r_6 - r_5))
    annotation (Placement(transformation(extent={{-26,70},{-6,90}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation upperArm(r=r_2 - r_1)
    annotation (Placement(transformation(extent={{-24,30},{-4,50}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toUpperInnerJoint(r=r_1)
    annotation (Placement(transformation(extent={{-88,30},{-68,50}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation steerLevel(r=r_6 - r_4)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,40})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toLowerInnerJoint(r=r_3)
    annotation (Placement(transformation(extent={{-88,-50},{-68,-30}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation kingPin(r=r_2 - r_4)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,22})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation lowerArm(r=r_4 - r_3)
    annotation (Placement(transformation(extent={{-24,-50},{-4,-30}})));

parameter Modelica.Units.SI.Position[3] r_1={0,0,0.2} "Upper inner joint";
parameter Modelica.Units.SI.Position[3] r_2={0,0.4,0.2} "Upper outer joint";
parameter Modelica.Units.SI.Position[3] r_3={0,0,-0.1} "Lower inner joint";
parameter Modelica.Units.SI.Position[3] r_4={0,0.4,-0.1} "Lower outer joint";
parameter Modelica.Units.SI.Position[3] r_5={-0.1,0,0} "Steer inner joint";
parameter Modelica.Units.SI.Position[3] r_6={-0.1,0.4,0} "Steer outer joint";
parameter Modelica.Units.SI.Position[3] r_7={0,0.3,0.3} "Spring Upper joint";
parameter Modelica.Units.SI.Position[3] r_8={0,0.3,-0.1} "Spring Lower joint";
parameter Modelica.Units.SI.TranslationalSpringConstant c=20000 "Spring Constant";
parameter Modelica.Units.SI.TranslationalDampingConstant d=2000 "Damping Constant";
parameter Modelica.Units.SI.Length s=0.35 "Unstretched Spring Length";

  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toUpperSpring(r=r_7)
    annotation (Placement(transformation(extent={{-70,6},{-50,26}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toLowerSpring(r=r_8 - r_3)
    annotation (Placement(transformation(extent={{-22,-26},{-2,-6}})));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel(
    c=c,
    s_unstretched=s,
    d=d)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={16,0})));
equation
  connect(steerFrame, steerLink.frame_a) annotation (Line(
      points={{-100,80},{-26,80}},
      color={95,95,95},
      thickness=0.5));
  connect(steerLink.frame_b, steerLevel.frame_b) annotation (Line(
      points={{-6,80},{60,80},{60,50}},
      color={95,95,95},
      thickness=0.5));
  connect(steerLevel.frame_a, uprightFrame) annotation (Line(
      points={{60,30},{60,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(mountFrame, toUpperInnerJoint.frame_a) annotation (Line(
      points={{-100,0},{-100,40},{-88,40}},
      color={95,95,95},
      thickness=0.5));
  connect(toUpperInnerJoint.frame_b, upperInnerJoint.frame_a) annotation (Line(
      points={{-68,40},{-56,40}},
      color={95,95,95},
      thickness=0.5));
  connect(upperInnerJoint.frame_b, upperArm.frame_a) annotation (Line(
      points={{-36,40},{-24,40}},
      color={95,95,95},
      thickness=0.5));
  connect(upperArm.frame_b, upperOuterJoint.frame_a) annotation (Line(
      points={{-4,40},{6,40}},
      color={95,95,95},
      thickness=0.5));
  connect(upperOuterJoint.frame_b, kingPin.frame_b) annotation (Line(
      points={{26,40},{40,40},{40,32}},
      color={95,95,95},
      thickness=0.5));
  connect(kingPin.frame_a, uprightFrame) annotation (Line(
      points={{40,12},{40,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(mountFrame, toLowerInnerJoint.frame_a) annotation (Line(
      points={{-100,0},{-100,-40},{-88,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(toLowerInnerJoint.frame_b, lowerInnerJoint.frame_a) annotation (Line(
      points={{-68,-40},{-56,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(lowerInnerJoint.frame_b, lowerArm.frame_a) annotation (Line(
      points={{-36,-40},{-24,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(lowerArm.frame_b, lowerOuterJoint.frame_a) annotation (Line(
      points={{-4,-40},{6,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(lowerOuterJoint.frame_b, uprightFrame) annotation (Line(
      points={{26,-40},{40,-40},{40,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(toUpperSpring.frame_a, toUpperInnerJoint.frame_a) annotation (Line(
      points={{-70,16},{-100,16},{-100,40},{-88,40}},
      color={95,95,95},
      thickness=0.5));
  connect(toUpperSpring.frame_b, springDamperParallel.frame_a) annotation (Line(
      points={{-50,16},{16,16},{16,10}},
      color={95,95,95},
      thickness=0.5));
  connect(springDamperParallel.frame_b, toLowerSpring.frame_b) annotation (Line(
      points={{16,-10},{16,-16},{-2,-16}},
      color={95,95,95},
      thickness=0.5));
  connect(toLowerSpring.frame_a, lowerArm.frame_a) annotation (Line(
      points={{-22,-16},{-30,-16},{-30,-40},{-24,-40}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Linkage;
