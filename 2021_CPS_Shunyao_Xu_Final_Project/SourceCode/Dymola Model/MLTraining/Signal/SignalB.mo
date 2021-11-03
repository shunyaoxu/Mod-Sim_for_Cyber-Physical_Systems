within OpenCPS_D53B.MLTraining.Signal;
model SignalB
  extends Interfaces.Signal;
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=true)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod=0.01, sigma=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-6,56})));
  Modelica.Blocks.Sources.Ramp ramp(height=0.2, duration=15)
    annotation (Placement(transformation(extent={{-48,46},{-28,66}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=-0.2,
    duration=15,
    startTime=30)
    annotation (Placement(transformation(extent={{-80,46},{-60,66}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=5)
    annotation (Placement(transformation(extent={{20,24},{32,36}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=1,
    width=30,
    period=1,
    nperiod=1,
    startTime=70)
    annotation (Placement(transformation(extent={{-110,46},{-90,66}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-38,-46})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=oscillation_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-64})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=time)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={64,-64})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={40,-38})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=time)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-68})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold=oscillation_end)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-34})));
  Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-44,-4})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=oscillation_amplitude,
    f=15,
    phase=0,
    startTime=120)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,-70})));
  Modelica.Blocks.Math.Gain gain(k=5)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={4,-4})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,4})));
  parameter Real oscillation_amplitude=4 "Amplitude of Oscillation";
  parameter Real oscillation_start=120 "Oscillation Start Time";
  parameter Real oscillation_end=200 "Oscillation End Time";
equation
  connect(normalNoise.y,multiSum. u[1]) annotation (Line(points={{5,56},{12,56},{12,34},{20,34},{20,33.36}},
                                                                 color={0,0,
          127}));
  connect(ramp.y,multiSum. u[2]) annotation (Line(points={{-27,56},{-22,56},{-22,31.68},{20,31.68}},
                                         color={0,0,127}));
  connect(ramp1.y,multiSum. u[3]) annotation (Line(points={{-59,56},{-52,56},{-52,30},{20,30}},
                                    color={0,0,127}));
  connect(pulse.y,multiSum. u[4]) annotation (Line(points={{-89,56},{-84,56},{-84,28.32},{20,28.32}},
                                            color={0,0,127}));
  connect(greaterThreshold.y,switch1. u2) annotation (Line(points={{7,-64},{7,-46},{-26,-46}},
                               color={255,0,255}));
  connect(realExpression.y,greaterThreshold. u) annotation (Line(points={{53,-64},{30,-64}},
                                                   color={0,0,127}));
  connect(realExpression1.y,greaterThreshold1. u)
    annotation (Line(points={{-80,-57},{-80,-46}}, color={0,0,127}));
  connect(greaterThreshold1.y,switch2. u2) annotation (Line(points={{-80,-23},{-80,-4},{-56,-4}},
                                                     color={255,0,255}));
  connect(sine.y,switch1. u1) annotation (Line(points={{-14,-59},{-14,-54},{-26,-54}},
                                           color={0,0,127}));
  connect(const.y,switch1. u3) annotation (Line(points={{29,-38},{-26,-38}},
                            color={0,0,127}));
  connect(switch1.y,switch2. u3) annotation (Line(points={{-49,-46},{-62,-46},{-62,-12},{-56,-12}},
                                   color={0,0,127}));
  connect(switch2.y,gain. u) annotation (Line(points={{-33,-4},{-8,-4}},
                          color={0,0,127}));
  connect(gain.y,multiSum. u[5]) annotation (Line(points={{15,-4},{15,26.64},{20,26.64}},
                                   color={0,0,127}));
  connect(const1.y,switch2. u1)
    annotation (Line(points={{-89,4},{-56,4}},   color={0,0,127}));
  connect(multiSum.y, signal_out) annotation (Line(points={{33.02,30},{60,30},{60,0},{106,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-100},{100,100}})),
    Icon(coordinateSystem(extent={{-120,-100},{100,100}}), graphics={Bitmap(extent={{-116,-100},{100,100}}, fileName="modelica://OpenCPS_D53B/MLTraining/Signal/signalB.PNG")}),
    experiment(
      StopTime=300,
      Interval=0.01,
      __Dymola_Algorithm="Radau"));
end SignalB;
