module

public import MathPaper.Finite.Initial08
public import MathPaper.Finite.Empty01

@[expose] public section
namespace MathPaper.Finite
theorem initial_checked : checkInitial data0 = true := initialPrefix68
theorem final_checked : checkEmpty data3 = true := data3_empty
end MathPaper.Finite
