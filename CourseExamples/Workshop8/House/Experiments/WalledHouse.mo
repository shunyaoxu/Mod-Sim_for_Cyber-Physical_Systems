within CourseExamples.Workshop8.House.Experiments;
model WalledHouse
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outTemp
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Sine sineTemp(
    amplitude=5,
    f=1/86400,
    phase=-1.5707963267949,
    offset=273.15) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Rooms.WalledRoom house(G_wall=1000) annotation (Placement(transformation(extent={{32,-18},{68,18}})));
equation
  connect(sineTemp.y, outTemp.T) annotation (Line(points={{-59,0},{-22,0}}, color={0,0,127}));
  connect(outTemp.port, house.wallPort) annotation (Line(points={{0,0},{32,0},{32,0}}, color={191,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end WalledHouse;
