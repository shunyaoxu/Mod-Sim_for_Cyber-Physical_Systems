within CourseExamples.Workshop18.Linearization;
function LinearizeHeatingSystem2
  import Modelica_LinearSystems2.StateSpace;
  import Modelica_LinearSystems2.TransferFunction;
  input String pathToNonlinearPlantModel= "CourseExamples.Workshop18.Linearization.HeatingSystem_nonlinear";
  input Modelica.Units.SI.Time tlin=500 "Linearization time";
  input String pathToNonlinearExperiment=
      "CourseExamples.Workshop18.Linearization.Experiment_nonlinear";
  input String pathToLinearExperiment=
      "CourseExamples.Workshop18.Linearization.Experiment_linear";
  input Modelica.Units.SI.Time tsim=1e4 "Simulation time";
algorithm
  // LINEARIZE plant model at t_lin
  ss := Modelica_LinearSystems2.ModelAnalysis.Linearize(
    pathToNonlinearPlantModel, simulationSetup=
    Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
    linearizeAtInitial=false, t_linearize=tlin));
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
  Modelica.Utilities.Streams.print("Simulating nonlinear model");
  simulateModel(
    pathToNonlinearExperiment,
    stopTime=tsim,
    numberOfIntervals=1000,
    resultFile="res_nl");
  ny := size(ss.C, 1);
  y0 := DymolaCommands.Trajectories.readTrajectory(
    "res_nl.mat",
    {"plant." + ss.yNames[i] for i in 1:ny},
    DymolaCommands.Trajectories.readTrajectorySize("res_nl.mat"));
  DataFiles.writeMATmatrix(
    "MyData.mat",
    "y0",
    [y0[:, 50]],
    append=true);
  Modelica.Utilities.Streams.print("Simulating linear model");
  simulateModel(
    pathToLinearExperiment,
    stopTime=tsim,
    resultFile="res_lin");
end LinearizeHeatingSystem2;
