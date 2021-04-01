within CourseExamples.Workshop12.Configurations;
model SportsCar
  extends Templates.StandardCar(
    redeclare Subsystems.BasicEngine engine(max_torque=data.engine.max_torque),
    redeclare Subsystems.FixedTransmission transmission(ratio=data.transmission.ratio),
    redeclare Subsystems.RigidShaft shaft(J=data.driveline.J),
    redeclare Subsystems.IdealChassis chassis(
      v_start=25,
      J_wheel=data.chassis.J_wheel,
      R_wheel=data.chassis.R_wheel,
      m_chassis=data.chassis.m_chassis),
    redeclare Data.VehicleData.vehicle1 data(
      redeclare record Engine = Data.EngineData.engine2,
      redeclare record Transmission = Data.TransmissionData.transmission1,
      redeclare record Driveline = Data.DrivelineData.driveline1,
      redeclare record Chassis = Data.ChassisData.chassis1));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}})),
    Icon(coordinateSystem(extent={{-120,-120},{120,120}})),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end SportsCar;
