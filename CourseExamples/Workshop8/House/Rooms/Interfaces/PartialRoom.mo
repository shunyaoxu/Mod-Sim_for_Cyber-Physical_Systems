within CourseExamples.Workshop8.House.Rooms.Interfaces;
partial model PartialRoom
  parameter Modelica.Units.SI.Volume V_room=4*3.7*5 "volume of room";
  parameter Modelica.Units.SI.ThermalConductance G_wall=375 "Thermal conductance in wall";
  parameter Modelica.Units.SI.HeatCapacity C_room=1410*V_room "heat capacity of room";
  parameter Modelica.Units.SI.ThermalConductance Gc_wall=176 "Convective thermal conductance wall/air";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a wallPort
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          lineThickness=1),
        Rectangle(
          extent={{-60,60},{-20,20}},
          lineColor={28,108,200},
          lineThickness=1),
        Rectangle(
          extent={{20,60},{60,20}},
          lineColor={28,108,200},
          lineThickness=1),
        Rectangle(
          extent={{20,-20},{60,-60}},
          lineColor={28,108,200},
          lineThickness=1),
        Rectangle(
          extent={{-60,-20},{-20,-80}},
          lineColor={28,108,200},
          lineThickness=1),
        Line(
          points={{-60,40},{-20,40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-40,60},{-40,20}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{20,40},{60,40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{40,60},{40,20}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{40,-20},{40,-60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{20,-40},{60,-40}},
          color={28,108,200},
          thickness=1),
        Ellipse(
          extent={{-32,-50},{-24,-58}},
          lineColor={28,108,200},
          lineThickness=1)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PartialRoom;
