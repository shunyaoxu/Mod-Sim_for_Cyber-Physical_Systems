within CourseExamples.Workshop11.Interfaces;
partial model Chassis
  parameter Modelica.Units.SI.Velocity v_start "Chassis initial speed.";
  Modelica.Mechanics.Rotational.Interfaces.Flange_a drivelineFlange
    annotation (Placement(transformation(extent={{-110,-12},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput speed annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Chassis;
