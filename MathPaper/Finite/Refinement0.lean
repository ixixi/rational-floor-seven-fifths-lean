module

public import MathPaper.Finite.Refine0_15

@[expose] public section
namespace MathPaper.Finite
theorem refinement0_checked : data0.all (checkRefine data1 32) = true := data0_refined
end MathPaper.Finite
