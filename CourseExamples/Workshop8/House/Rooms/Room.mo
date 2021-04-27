within CourseExamples.Workshop8.House.Rooms;
model Room
  extends Interfaces.PartialRoom;
  Components.SimpleWall simpleWall(G_wall=G_wall, Gc_wall=Gc_wall)
    annotation (Placement(transformation(extent={{-46,-32},{18,32}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airHeatCapacity(C=C_room)
    annotation (Placement(transformation(extent={{64,20},{96,52}})));
equation
  connect(wallPort, simpleWall.outside) annotation (Line(points={{-100,0},{-46,0}}, color={191,0,0}));
  connect(simpleWall.inside, airHeatCapacity.port) annotation (Line(points={{18,0},{80,0},{80,20}}, color={191,0,0}));
end Room;
