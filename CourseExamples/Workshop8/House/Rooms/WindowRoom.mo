within CourseExamples.Workshop8.House.Rooms;
model WindowRoom
  extends Interfaces.PartialRoom;
  parameter Modelica.Units.SI.HeatCapacity C_wall=1e5 "heat capacity in wall";
  parameter Modelica.Units.SI.Area A_window=2 "window area";
  parameter Modelica.Units.SI.ThermalConductance Gc_window=0.35
    "convection from window";
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airHeatCapacity(C=C_room) "Heat capacity in the room" annotation (Placement(transformation(extent={{-26,14},
            {6,46}})));
  Components.Wall wall(G_wall=G_wall,Gc_wall=Gc_wall,C_wall=C_wall) annotation (Placement(transformation(extent={{-68,-16},{-36,
            16}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a winPort
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-40})));
  Modelica.Blocks.Interfaces.RealInput radiation
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-80})));
  Components.Window window(A_window=A_window, Gc_window=Gc_window)
    annotation (Placement(transformation(extent={{14,-10},{34,10}})));
equation
  connect(wallPort, wall.outside) annotation (Line(points={{-100,0},{-68,0}}, color={191,0,0}));
  connect(wall.inside, airHeatCapacity.port) annotation (Line(points={{-36,0},{-10,0},{-10,14}},
                                                                                              color={191,0,0}));
  connect(window.inside, airHeatCapacity.port) annotation (Line(points={{14,0},{-10,0},{-10,14}}, color={191,0,0}));
  connect(winPort, window.outside) annotation (Line(points={{100,0},{76,0},{76,4},{34,4}}, color={191,0,0}));
  connect(theta, window.theta) annotation (Line(points={{120,-40},{68,-40},{68,-2},{36,-2}}, color={0,0,127}));
  connect(radiation, window.radiation) annotation (Line(points={{120,-80},{58,-80},{58,-6},{36,-6}}, color={0,0,127}));
end WindowRoom;
