within CourseExamples.Workshop12.Data.VehicleData;
record vehicle1 =
  Workshop12.Data.Records.VehicleData (
    redeclare replaceable record Engine = Workshop12.Data.EngineData.engine1,
    redeclare replaceable record Transmission = Workshop12.Data.TransmissionData.transmission1,
    redeclare replaceable record Driveline = Workshop12.Data.DrivelineData.driveline1,
    redeclare replaceable record Chassis = Workshop12.Data.ChassisData.chassis1)
  "simple car";
