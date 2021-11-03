within OpenCPS_D53B.MLTraining.System;
model SMIB_normal_noise
  extends Interfaces.Power_System;
  OpenIPSL.Electrical.Buses.Bus GEN1(V_b=13.8) annotation (Placement(transformation(extent={{-78,38},{-54,62}})));
  OpenIPSL.Electrical.Buses.Bus BUS1(V_b=13.8) annotation (Placement(transformation(extent={{-42,38},{-18,62}})));
  OpenIPSL.Electrical.Buses.Bus GEN2(V_b=13.8) annotation (Placement(transformation(extent={{58,38},{82,62}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    V_b=13.8,
    Vn=13.8,
    x=0.15,
    r=0,
    Sn=10)   annotation (Placement(transformation(extent={{-58,40},{-38,60}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    G=0,
    B=0,
    R=0.001,
    X=0.2) annotation (Placement(transformation(extent={{10,64},{28,76}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    G=0,
    B=0,
    R=0.0003,
    X=0.06) annotation (Placement(transformation(extent={{-20,24},{-2,36}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=10, fn=50) annotation (Placement(transformation(extent={{36,-80},{90,-60}})));
public
  OpenIPSL.Electrical.Buses.Bus LOAD(V_b=13.8) annotation (Placement(transformation(extent={{-8,18},{16,42}})));
  OpenIPSL.Electrical.Branches.PwLine line_3(
    opening=1,
    G=0,
    B=0,
    X=0.07,
    R=0.00035) annotation (Placement(transformation(extent={{14,24},{32,36}})));
public
  OpenIPSL.Electrical.Buses.Bus BUS2(V_b=13.8) annotation (Placement(transformation(extent={{24,18},{48,42}})));
  OpenIPSL.Electrical.Branches.PwLine line_4(
    G=0,
    B=0,
    X=0.07,
    R=0.00035) annotation (Placement(transformation(extent={{40,24},{58,36}})));
  OpenIPSL.Electrical.Branches.PwLine line_5(
    G=0,
    B=0,
    R=0,
    X=0.00001) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=270,
        origin={11,14})));
public
  OpenIPSL.Electrical.Buses.Bus BUS3(V_b=13.8) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={12,-16})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS infiniteGen(
    V_b=13.8,
    M_b=1000,
    P_0=pf_results.machines.P3_1,
    Q_0=pf_results.machines.Q3_1,
    V_0=pf_results.voltages.V3,
    angle_0=pf_results.voltages.A3)
                     annotation (Placement(transformation(extent={{96,40},{76,60}})));
  PowerSystemDomain.Loads.VariableLoad
                     variableLoad(
    d_P=0,
    t1=0,
    d_t=0,
    P_0=pf_results.loads.PL23_1,
    Q_0=pf_results.loads.QL23_1,
    V_0=pf_results.voltages.V23,
    angle_0=pf_results.voltages.A23,
    V_b=13.8,
    characteristic=2) annotation (Placement(transformation(extent={{2,-48},{22,-30}})));
  PowerSystemDomain.Controls.SoftPMU.PMU
                       pMU(V_0=pf_results.voltages.V23, angle_0=pf_results.voltages.A23)
                           annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={12,-5})));
  PowerSystemDomain.Generation_Groups.SMIB.Generator_AVR_PSS_TurbGov
                                   generator_AVR_PSS_TurbGov(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-94,40},{-74,60}})));
  PowerSystemDomain.Networks.SMIB.Records.PF_075
                 pf_results annotation (Placement(transformation(extent={{-60,-58},{-40,-38}})));
equation
  connect(GEN1.p,transformer. p) annotation (Line(points={{-66,50},{-59,50}},
                                                                            color={0,0,255}));
  connect(transformer.n,BUS1. p) annotation (Line(points={{-37,50},{-30,50}},
                                                                           color={0,0,255}));
  connect(BUS1.p,line_1. p) annotation (Line(points={{-30,50},{-22,50},{-22,70},{10.9,70}}, color={0,0,255}));
  connect(line_1.n,GEN2. p) annotation (Line(points={{27.1,70},{64,70},{64,50},{70,50}},
                                                                                       color={0,0,255}));
  connect(line_2.p,line_1. p) annotation (Line(points={{-19.1,30},{-22,30},{-22,70},{10.9,70}},
                                                                                            color={0,0,255}));
  connect(LOAD.p,line_2. n) annotation (Line(points={{4,30},{-2.9,30}},    color={0,0,255}));
  connect(LOAD.p,line_3. p) annotation (Line(points={{4,30},{14.9,30}},             color={0,0,255}));
  connect(BUS2.p,line_3. n) annotation (Line(points={{36,30},{31.1,30}},   color={0,0,255}));
  connect(line_4.p,BUS2. p) annotation (Line(points={{40.9,30},{36,30}},               color={0,0,255}));
  connect(line_4.n,GEN2. p) annotation (Line(points={{57.1,30},{64,30},{64,50},{70,50}}, color={0,0,255}));
  connect(line_5.p,line_3. p) annotation (Line(points={{11,22.1},{11,30},{14.9,30}},    color={0,0,255}));
  connect(infiniteGen.p,GEN2. p) annotation (Line(points={{76,50},{70,50}},       color={0,0,255}));
  connect(variableLoad.p,BUS3. p) annotation (Line(points={{12,-30},{12,-16}}, color={0,0,255}));
  connect(pMU.n,BUS3. p) annotation (Line(points={{12,-9.9},{12,-16}},              color={0,0,255}));
  connect(pMU.p,line_5. n) annotation (Line(points={{12,-0.1},{12,5.9},{11,5.9}},                 color={0,0,255}));
  connect(generator_AVR_PSS_TurbGov.pwPin,GEN1. p)
    annotation (Line(points={{-73,50},{-66,50}},         color={0,0,255}));
  connect(signal_in, variableLoad.u)
    annotation (Line(points={{-106,0},{-20,0},{-20,-34},{-8,-34},{-8,-34.05},{3.9,-34.05}}, color={0,0,127}));
  annotation (Diagram(graphics={                                      Text(
          extent={{-84,90},{76,70}},
          lineColor={28,108,200},
          textString="Note: this model uses a full generator+controls, it simulates the ambient response of the system to a stochastically varying load.
")}), Icon(graphics={Text(
          extent={{-74,46},{84,-42}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="SMIB Normal")}));
end SMIB_normal_noise;
