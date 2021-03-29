within CourseExamples.Workshop10;
model Pipe2
  parameter Modelica.Units.SI.Density rho=1e3 "Density of fluid";
  parameter Real xi=1 "Pipe pressure drop coefficient";
  parameter Modelica.Units.SI.Area A=1 "Area of the Pipe";

  Modelica.Units.SI.MassFlowRate m_dot "Mass flow tank A to tank B";
  Modelica.Units.SI.Pressure p_a(start=2e5) "Pressure at pipe end a";
  Modelica.Units.SI.Pressure p_b(start=3e5) "Pressure at pipe end b";
equation
  der(p_a) = 0;
  der(p_b) = -5e4 "Pressure is dropping at the outlet";
  m_dot = sign(p_b-p_a)*noEvent(sqrt(2*rho*abs(p_b-p_a)/xi)*A) "ratio of flow and pressure diff";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=5,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Pipe2;
