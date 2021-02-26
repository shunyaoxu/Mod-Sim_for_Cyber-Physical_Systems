within CourseExamples.Components.Electrical;
model ElectricalMotor "Electric Motor Model for Workshop 2"
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited motor
    annotation (Placement(transformation(extent={{-34,-44},{-14,-24}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
    annotation (Placement(transformation(extent={{-32,12},{-12,32}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-70,-8},{-50,12}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J)
    annotation (Placement(transformation(extent={{44,-44},{64,-24}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=ratio)
    annotation (Placement(transformation(extent={{8,-44},{28,-24}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b1
                    "Flange of right shaft" annotation (Placement(
        transformation(extent={{80,-44},{100,-24}}), iconTransformation(extent=
            {{80,-44},{100,-24}})));
  Modelica.Blocks.Interfaces.RealInput v1
    "Voltage between pin p and n (= p.v - n.v) as input signal"
    annotation (Placement(transformation(extent={{-108,14},{-68,54}})));
  parameter Real ratio=2 "Transmission ratio (flange_a.phi/flange_b.phi)"
    annotation (Dialog(group="Mechanical Parameters"));
  parameter Modelica.Units.SI.Inertia J=1 "Moment of inertia"
    annotation (Dialog(group="Mechanical Parameters"));
equation
  connect(motor.pin_ap, signalVoltage.n) annotation (Line(points={{-18,-24},{-2,
          -24},{-2,22},{-12,22}}, color={0,0,255}));
  connect(motor.flange, idealGear.flange_a)
    annotation (Line(points={{-14,-34},{8,-34}}, color={0,0,0}));
  connect(idealGear.flange_b, inertia.flange_a)
    annotation (Line(points={{28,-34},{44,-34}}, color={0,0,0}));
  connect(ground.p, signalVoltage.p)
    annotation (Line(points={{-60,12},{-60,22},{-32,22}}, color={0,0,255}));
  connect(motor.pin_an, motor.pin_ep)
    annotation (Line(points={{-30,-24},{-34,-24},{-34,-28}}, color={0,0,255}));
  connect(motor.pin_en, signalVoltage.p) annotation (Line(points={{-34,-40},{
          -44,-40},{-44,22},{-32,22}}, color={0,0,255}));
  connect(inertia.flange_b, flange_b1)
    annotation (Line(points={{64,-34},{90,-34}}, color={0,0,0}));
  connect(signalVoltage.v, v1)
    annotation (Line(points={{-22,34},{-88,34}}, color={0,0,127}));
  connect(flange_b1, flange_b1)
    annotation (Line(points={{90,-34},{90,-34}}, color={0,0,0}));
  annotation (Icon(graphics,
                   coordinateSystem(preserveAspectRatio=false)), Diagram(graphics,
        coordinateSystem(preserveAspectRatio=false)));
end ElectricalMotor;
