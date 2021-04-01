within CourseExamples.Workshop12.Data.Records;
record VehicleData "empty complete vehicle data record"
  extends Modelica.Icons.Record;

  /* Data for Engine, Class and instance */
  replaceable record Engine =
      Workshop12.Data.Records.EngineData constrainedby Workshop12.Data.Records.EngineData
      annotation (choicesAllMatching);
  Engine engine;

  /* Data for Transmission, Class and instance */
  replaceable record Transmission =
      Workshop12.Data.Records.TransmissionData constrainedby Workshop12.Data.Records.TransmissionData
      annotation (choicesAllMatching);
  Transmission transmission;

  /* Data for Driveline, Class and instance */
  replaceable record Driveline =
      Workshop12.Data.Records.DrivelineData constrainedby Workshop12.Data.Records.DrivelineData
      annotation (choicesAllMatching);
  Driveline driveline;

  /* Data for Chassis, Class and instance */
  replaceable record Chassis =
      Workshop12.Data.Records.ChassisData constrainedby Workshop12.Data.Records.ChassisData
      annotation (choicesAllMatching);
  Chassis chassis;

end VehicleData;
