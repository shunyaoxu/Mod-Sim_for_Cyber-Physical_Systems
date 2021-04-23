within CourseExamples.Workshop18.Linearization;
function LinearizeHeatingSystem
  import Modelica_LinearSystems2.StateSpace;
  import Modelica_LinearSystems2.TransferFunction;
  input String pathToNonlinearPlantModel="CourseExamples.Workshop18.Linearization.HeatingSystem_nonlinear";
  input Modelica.Units.SI.Time tlin=500 "Linearization time";
algorithm
  // LINEARIZE plant model at t_lin
  ss:=Modelica_LinearSystems2.ModelAnalysis.Linearize(pathToNonlinearPlantModel,simulationSetup=Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(linearizeAtInitial=false, t_linearize=tlin));
  // PRINT linear system
  Modelica.Utilities.Streams.print(String(ss));
  // SAVE the data in a mat file
  DataFiles.writeMATmatrix(
    "MyData.mat",
    "ABCD",
    [ss.A, ss.B; ss.C, ss.D],
    append=false);
  nx := size(ss.A, 1);
  DataFiles.writeMATmatrix(
    "MyData.mat",
    "nx",
    [nx],
    append=true);

end LinearizeHeatingSystem;
