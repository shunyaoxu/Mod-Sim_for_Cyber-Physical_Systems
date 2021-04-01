within CourseExamples.Workshop12.VolumeModel.GeometryFunctions;
function rectangularPipe
  extends Interfaces.geometry;
  input Real d1=1;
  input Real d2=1;
  input Real L=1;
algorithm
  V := L*d1*d2;
end rectangularPipe;
