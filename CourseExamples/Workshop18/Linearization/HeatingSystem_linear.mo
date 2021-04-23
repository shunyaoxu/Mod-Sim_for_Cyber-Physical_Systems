within CourseExamples.Workshop18.Linearization;
model HeatingSystem_linear
  extends HeatingSystem_interface(final Q0=0, final u0=0);
  import Modelica_LinearSystems2.StateSpace;
  parameter Real[:] y0=vector(DataFiles.readMATmatrix("MyData.mat", "y0")) annotation (Evaluate=false);
  parameter StateSpace ss=StateSpace.Import.fromFile("MyData.mat", "ABCD");
  parameter Integer ny=size(ss.C, 1);
  Modelica_LinearSystems2.Controller.StateSpace stateSpace(system=ss)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Sources.Constant const[ny](k=y0) annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2_1 annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Math.Add add2[ny] annotation (Placement(transformation(extent={{20,-6},{40,14}})));
  Modelica.Blocks.Routing.DeMultiplex2 deMultiplex2_1 annotation (Placement(transformation(extent={{60,-6},{80,14}})));
equation
  connect(add.y, multiplex2_1.u1[1]) annotation (Line(points={{-89,70},{-80,70},{-80,16},{-62,16}}, color={0,0,127}));
  connect(add1.y, multiplex2_1.u2[1]) annotation (Line(points={{-89,-70},{-80,-70},{-80,4},{-62,4}}, color={0,0,127}));
  connect(stateSpace.y, add2.u1) annotation (Line(points={{1,10},{18,10}}, color={0,0,127}));
  connect(multiplex2_1.y, stateSpace.u) annotation (Line(points={{-39,10},{-22,10}}, color={0,0,127}));
  connect(const.y, add2.u2) annotation (Line(points={{1,-30},{12,-30},{12,-2},{18,-2}}, color={0,0,127}));
  connect(add2.y, deMultiplex2_1.u) annotation (Line(points={{41,4},{58,4}}, color={0,0,127}));
  connect(deMultiplex2_1.y1[1], T_forward) annotation (Line(points={{81,10},{86,10},{86,60},{110,60}}, color={0,0,127}));
  connect(deMultiplex2_1.y2[1], T_return) annotation (Line(points={{81,-2},{86,-2},{86,-60},{110,-60}}, color={0,0,127}));
end HeatingSystem_linear;
