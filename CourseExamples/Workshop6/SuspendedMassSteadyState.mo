within CourseExamples.Workshop6;
model SuspendedMassSteadyState
  extends SuspendedMass(fixed(r={0,0,0}), mass(
      r_0(start={0,-0.392266,0}),
      v_0(start={0,0,0}),
      a_0(start={0,0,0})));
end SuspendedMassSteadyState;
