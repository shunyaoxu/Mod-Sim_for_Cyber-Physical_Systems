within CourseExamples.Workshop6;
model MassInPointGravityField
  extends MassInGravityField(mass(r_0(start={0,1,0}, fixed=true), v_0(start={1,
            0,0}, fixed=true)), world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity,
        mu=1));
end MassInPointGravityField;
