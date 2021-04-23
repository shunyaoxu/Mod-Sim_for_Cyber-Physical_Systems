within CourseExamples.Workshop18.Linearization;
model HeatingSystem_nonlinear
extends HeatingSystem;
extends HeatingSystem_interface;
equation
  connect(add.y, burner.Q_flow) annotation (Line(points={{-89,70},{0,70},{0,40},{16,40}}, color={0,0,127}));
  connect(add1.y, valve.opening)
    annotation (Line(points={{-89,-70},{-80,-70},{-80,-90},{66,-90},{66,-52},{50,-52},{50,-62}}, color={0,0,127}));
  connect(sensor_T_forward.T, T_forward) annotation (Line(points={{67,40},{88,40},{88,60},{110,60}}, color={0,0,127}));
  connect(sensor_T_return.T, T_return)
    annotation (Line(points={{-37,-50},{-48,-50},{-48,0},{50,0},{50,-40},{94,-40},{94,-60},{110,-60}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatingSystem_nonlinear;
