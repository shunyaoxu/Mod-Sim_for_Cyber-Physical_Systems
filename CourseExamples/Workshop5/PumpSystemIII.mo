within CourseExamples.Workshop5;
model PumpSystemIII
  Components.Electrical.ElectricalMotor motor(
    ratio=3,
    J=10,
    inertia(w(start=40)))
    annotation (Placement(transformation(extent={{-12,68},{8,88}})));
  replaceable
  Modelica.Blocks.Sources.Constant
                               speed_sp(k=1) constrainedby Modelica.Blocks.Interfaces.SO
    annotation (Placement(transformation(extent={{-94,68},{-74,88}})));
  Modelica.Blocks.Continuous.LimPID PID(
    k=120,
    Ti=130,
    Td=20,
    yMax=500,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.NoInit)
    annotation (Placement(transformation(extent={{-54,68},{-34,88}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{68,68},{88,88}})));
  Modelica.Fluid.Sources.FixedBoundary boundary(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=100000,
    nPorts=1)
    annotation (Placement(transformation(extent={{-90,-60},{-70,-40}})));

  Modelica.Fluid.Sources.FixedBoundary boundary1(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=100000,
    nPorts=1) annotation (Placement(transformation(extent={{66,-60},{86,-40}})));

  Modelica.Fluid.Pipes.DynamicPipe pipe(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=10,
    diameter=0.05,
    height_ab=10,
    nNodes=1,
    modelStructure=Modelica.Fluid.Types.ModelStructure.av_b,
    use_HeatTransfer=true,
    redeclare model HeatTransfer =
        Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.ConstantFlowHeatTransfer (
         alpha0=2000))
    annotation (Placement(transformation(extent={{-32,-38},{-12,-18}})));

  Modelica.Fluid.Machines.Pump pump(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    redeclare function flowCharacteristic =
        Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow (
          V_flow_nominal={0,0.1}, head_nominal={10,0}),
    N_nominal=130)
    annotation (Placement(transformation(extent={{-58,-60},{-38,-40}})));

  Modelica.Fluid.Vessels.OpenTank tank(
    height=3,
    crossArea=5,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_portsData=true,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)},
    nPorts=2) annotation (Placement(transformation(extent={{-20,-4},{20,36}})));

  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal=5000,
    m_flow_nominal=5)
    annotation (Placement(transformation(extent={{24,-40},{44,-20}})));

  Modelica.Blocks.Sources.Step step(
    height=0.5,
    offset=0.001,
    startTime=20)
    annotation (Placement(transformation(extent={{56,12},{76,32}})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-86,8},{-66,28}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=tank.level)
    annotation (Placement(transformation(extent={{-80,38},{-60,58}})));
  Modelica.Blocks.Sources.Sine G(
    amplitude=1000,
    f=1/86400,
    phase=-1.5707963267949)
    annotation (Placement(transformation(extent={{-186,8},{-166,28}})));
  Modelica.Blocks.Sources.Sine theta(
    amplitude=60,
    f=1/86400,
    phase=1.5707963267949,
    offset=100)
    annotation (Placement(transformation(extent={{-186,-54},{-166,-34}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg
    annotation (Placement(transformation(extent={{-144,-54},{-124,-34}})));
  SolarCollector solarCollector(
    a0=0.75,
    a1=4.4,
    a2=0.004,
    b0=0.108,
    Theta0=1.4730578886832,
    A=500,
    Tamb=288.15)
    annotation (Placement(transformation(extent={{-110,-22},{-90,-2}})));
equation
  connect(speed_sp.y, PID.u_s)
    annotation (Line(points={{-73,78},{-56,78}}, color={0,0,127}));
  connect(PID.y, motor.v1) annotation (Line(points={{-33,78},{-16,78},{-16,81.4},
          {-10.8,81.4}}, color={0,0,127}));
  connect(motor.flange_b1, speedSensor.flange) annotation (Line(points={{7,74.6},
          {60,74.6},{60,78},{68,78}}, color={0,0,0}));
  connect(boundary.ports[1], pump.port_a)
    annotation (Line(points={{-70,-50},{-58,-50}}, color={0,127,255}));
  connect(pump.port_b, pipe.port_a) annotation (Line(points={{-38,-50},{-38,-28},
          {-32,-28}}, color={0,127,255}));
  connect(pipe.port_b, tank.ports[1])
    annotation (Line(points={{-12,-28},{-4,-28},{-4,-4}}, color={0,127,255}));
  connect(valveLinear.port_a, tank.ports[2])
    annotation (Line(points={{24,-30},{4,-30},{4,-4}}, color={0,127,255}));
  connect(valveLinear.port_b, boundary1.ports[1]) annotation (Line(points={{44,
          -30},{92,-30},{92,-50},{86,-50}}, color={0,127,255}));
  connect(pump.shaft, speedSensor.flange) annotation (Line(points={{-48,-40},{
          -48,46},{60,46},{60,78},{68,78}}, color={0,0,0}));
  connect(step.y, valveLinear.opening) annotation (Line(points={{77,22},{82,22},
          {82,-16},{34,-16},{34,-22}}, color={0,0,127}));
  connect(realExpression.y, PID.u_m)
    annotation (Line(points={{-59,48},{-44,48},{-44,66}}, color={0,0,127}));
  connect(theta.y,from_deg. u)
    annotation (Line(points={{-165,-44},{-146,-44}},
                                                   color={0,0,127}));
  connect(solarCollector.port_b, pipe.heatPorts[1]) annotation (Line(points={{
          -92,-12},{-56,-12},{-56,-23.6},{-21.9,-23.6}}, color={191,0,0}));
  connect(G.y, solarCollector.G) annotation (Line(points={{-165,18},{-120,18},{
          -120,-6.2},{-107.4,-6.2}}, color={0,0,127}));
  connect(from_deg.y, solarCollector.theta) annotation (Line(points={{-123,-44},
          {-120,-44},{-120,-17},{-107.4,-17}}, color={0,0,127}));
  annotation (Icon(graphics,
                   coordinateSystem(preserveAspectRatio=false)), Diagram(graphics,
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      __Dymola_NumberOfIntervals=86400,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end PumpSystemIII;
