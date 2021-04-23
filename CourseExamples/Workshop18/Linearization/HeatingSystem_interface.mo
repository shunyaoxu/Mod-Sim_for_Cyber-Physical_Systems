within CourseExamples.Workshop18.Linearization;
partial model HeatingSystem_interface
  parameter Real Q0=300;
  parameter Real u0=0.1;
  Modelica.Blocks.Interfaces.RealInput dQ_flow annotation (Placement(transformation(extent={{-230,56},{-190,96}})));
  Modelica.Blocks.Interfaces.RealInput du annotation (Placement(transformation(extent={{-230,-84},{-190,-44}})));
  Modelica.Blocks.Sources.Constant Q_Flow0(k=Q0)
                                           annotation (Placement(transformation(extent={{-170,36},{-150,56}})));
  Modelica.Blocks.Sources.Constant u_0(k=u0)
                                       annotation (Placement(transformation(extent={{-170,-104},{-150,-84}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,60},{-90,80}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{-110,-80},{-90,-60}})));
  Modelica.Blocks.Interfaces.RealOutput T_forward annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput T_return annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
equation
  connect(dQ_flow, add.u1) annotation (Line(points={{-210,76},{-112,76}}, color={0,0,127}));
  connect(Q_Flow0.y, add.u2) annotation (Line(points={{-149,46},{-130,46},{-130,64},{-112,64}}, color={0,0,127}));
  connect(du, add1.u1) annotation (Line(points={{-210,-64},{-112,-64}}, color={0,0,127}));
  connect(u_0.y, add1.u2) annotation (Line(points={{-149,-94},{-130,-94},{-130,-76},{-112,-76}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end HeatingSystem_interface;
