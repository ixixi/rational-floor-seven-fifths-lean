module

public import MathPaper.Finite.Refine1_03

@[expose] public section
namespace MathPaper.Finite
theorem refinement1_checked : data1.all (checkRefine data2 128) = true := data1_refined
end MathPaper.Finite
