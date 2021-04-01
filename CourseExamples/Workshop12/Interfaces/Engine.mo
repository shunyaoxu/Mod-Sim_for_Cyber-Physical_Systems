within CourseExamples.Workshop12.Interfaces;
partial model Engine
  Modelica.Blocks.Interfaces.RealInput throttle annotation (Placement(transformation(extent={{-126,-20},{-86,20}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a transmissionFlange
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Engine;
