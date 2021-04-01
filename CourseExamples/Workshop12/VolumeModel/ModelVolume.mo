within CourseExamples.Workshop12.VolumeModel;
model ModelVolume
  Real x;
  replaceable function V_cal = VolumeModel.GeometryFunctions.squarePipe
    constrainedby VolumeModel.Interfaces.geometry annotation (choicesAllMatching);
protected
  parameter Modelica.Units.SI.Volume V = V_cal();
equation
  der(x) = V;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ModelVolume;
