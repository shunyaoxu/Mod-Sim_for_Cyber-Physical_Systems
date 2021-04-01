within CourseExamples.Workshop12.VolumeModel;
model VolumeTest
  ModelVolume modelVolume(redeclare function V_cal = GeometryFunctions.squarePipe (d=2.5, L=3))
    annotation (Placement(transformation(extent={{-44,0},{-24,20}})));
  ModelVolume modelVolume1(redeclare function V_cal = GeometryFunctions.rectangularPipe (
        d1=1.5,
        d2=1,
        L=2)) annotation (Placement(transformation(extent={{-44,-34},{-24,-14}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end VolumeTest;
