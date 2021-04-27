within CourseExamples.Workshop8.House.Rooms;
model WalledRoom
  extends Interfaces.PartialRoom;
  parameter Modelica.Units.SI.HeatCapacity C_wall=1e5 "heat capacity in wall";
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airHeatCapacity(C=C_room) "Heat capacity in the room" annotation (Placement(transformation(extent={{64,20},{96,52}})));
  Components.Wall wall(G_wall=G_wall,Gc_wall=Gc_wall,C_wall=C_wall) annotation (Placement(transformation(extent={{-30,-32},{30,32}})));
equation
  connect(wallPort, wall.outside) annotation (Line(points={{-100,0},{-30,0}}, color={191,0,0}));
  connect(wall.inside, airHeatCapacity.port) annotation (Line(points={{30,0},{80,0},{80,20}}, color={191,0,0}));
end WalledRoom;
