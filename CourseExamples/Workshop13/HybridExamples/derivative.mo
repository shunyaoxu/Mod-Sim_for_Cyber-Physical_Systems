within CourseExamples.Workshop13.HybridExamples;
function derivative
  input Real x;
  output Real derx;

algorithm
  derx := if x > 0.5 then -1.0 else 1.0;

end derivative;
