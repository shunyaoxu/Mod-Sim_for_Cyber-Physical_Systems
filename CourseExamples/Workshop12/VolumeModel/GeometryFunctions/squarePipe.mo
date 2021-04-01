within CourseExamples.Workshop12.VolumeModel.GeometryFunctions;
function squarePipe
  extends Interfaces.geometry;
  input Real d=1;
  input Real L=1;
algorithm
  V := L*d*d;
end squarePipe;
