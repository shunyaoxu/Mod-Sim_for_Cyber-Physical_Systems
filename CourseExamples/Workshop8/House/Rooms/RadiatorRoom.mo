within CourseExamples.Workshop8.House.Rooms;
model RadiatorRoom
  extends Interfaces.PartialRoom;
  parameter Modelica.Units.SI.HeatCapacity C_wall=1e5 "heat capacity in wall";
  parameter Modelica.Units.SI.Area A_window=2 "window area";
  parameter Modelica.Units.SI.ThermalConductance Gc_window=0.35
    "convection from window";
  parameter Modelica.Units.SI.Temperature T_ref = 293.15;
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airHeatCapacity(C=C_room) "Heat capacity in the room" annotation (Placement(transformation(extent={{-26,66},
            {6,98}})));
  Components.Wall wall(G_wall=G_wall,Gc_wall=Gc_wall,C_wall=C_wall) annotation (Placement(transformation(extent={{-68,44},{-36,
            76}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a winPort
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,20})));
  Modelica.Blocks.Interfaces.RealInput radiation
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-20})));
  Components.Window window(A_window=A_window, Gc_window=Gc_window)
    annotation (Placement(transformation(extent={{14,50},{34,70}})));
  Components.Radiator radiator(T_ref=T_ref)
                               annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Modelica.Media.Water.WaterIF97_ph)
                                               annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Modelica.Media.Water.WaterIF97_ph)
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
equation
  connect(wallPort, wall.outside) annotation (Line(points={{-100,0},{-84,0},{-84,60},{-68,60}},
                                                                              color={191,0,0}));
  connect(wall.inside, airHeatCapacity.port) annotation (Line(points={{-36,60},{-10,60},{-10,66}},
                                                                                              color={191,0,0}));
  connect(window.inside, airHeatCapacity.port) annotation (Line(points={{14,60},{-10,60},{-10,66}},
                                                                                                  color={191,0,0}));
  connect(winPort, window.outside) annotation (Line(points={{100,60},{76,60},{76,64},{34,64}},
                                                                                           color={191,0,0}));
  connect(theta, window.theta) annotation (Line(points={{120,20},{68,20},{68,58},{36,58}},   color={0,0,127}));
  connect(radiation, window.radiation) annotation (Line(points={{120,-20},{58,-20},{58,54},{36,54}}, color={0,0,127}));
  connect(radiator.heatPort, airHeatCapacity.port) annotation (Line(points={{-10,-10},{-10,66}}, color={191,0,0}));
  connect(radiator.inPort, port_a) annotation (Line(points={{-20,-20},{-40,-20},{-40,-60},{-100,-60}}, color={0,127,255}));
  connect(radiator.outPort, port_b)
    annotation (Line(points={{0,-20},{20,-20},{20,-60},{100,-60},{100,-60}}, color={0,127,255}));
end RadiatorRoom;
