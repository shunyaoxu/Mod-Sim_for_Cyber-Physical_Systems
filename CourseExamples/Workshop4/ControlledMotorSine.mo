within CourseExamples.Workshop4;
model ControlledMotorSine
  extends ControlledMotor(redeclare Modelica.Blocks.Sources.Sine speed_sp(
      amplitude=25,
      f=0.01,
      offset=175,
      startTime=0.0));
end ControlledMotorSine;
