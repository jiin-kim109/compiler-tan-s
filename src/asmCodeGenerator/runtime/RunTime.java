package asmCodeGenerator.runtime;
import static asmCodeGenerator.codeStorage.ASMCodeFragment.CodeType.*;
import static asmCodeGenerator.codeStorage.ASMOpcode.*;

import asmCodeGenerator.ASMCodeGenerator;
import asmCodeGenerator.codeStorage.ASMCodeFragment;
public class RunTime {
	public static final String EAT_LOCATION_ZERO      = "$eat-location-zero";		// helps us distinguish null pointers from real ones.
	public static final String INTEGER_PRINT_FORMAT   = "$print-format-integer";
	public static final String FLOATING_PRINT_FORMAT   = "$print-format-floating";
	public static final String BOOLEAN_PRINT_FORMAT   = "$print-format-boolean";
	public static final String CHARACTER_PRINT_FORMAT = "$print-format-character";
	public static final String STRING_PRINT_FORMAT = "$print-format-string";
	public static final String NEWLINE_PRINT_FORMAT   = "$print-format-newline";
	public static final String SPACE_PRINT_FORMAT     = "$print-format-space";
	public static final String HORIZONTAL_TAB_PRINT_FORMAT = "$print-format-tab";
	public static final String BOOLEAN_TRUE_STRING    = "$boolean-true-string";
	public static final String BOOLEAN_FALSE_STRING   = "$boolean-false-string";
	public static final String GLOBAL_MEMORY_BLOCK    = "$global-memory-block";
	public static final String FRAME_POINTER    = "$frame-pointer";
	public static final String USABLE_MEMORY_START    = "$usable-memory-start";
	public static final String MAIN_PROGRAM_LABEL     = "$$main";
	
	public static final String GENERAL_RUNTIME_ERROR = "$$general-runtime-error";
	public static final String INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$i-divide-by-zero";
	public static final String FLOATING_DIVIDE_BY_ZERO_RUNTIME_ERROR = "$$f-divide-by-zero";
	public static final String BAD_COMPARISON_OPERAND_RUNTIME_ERROR = "$$bad-comparison-operand";
	public static final String BAD_TYPECAST_OPERAND_RUNTIME_ERROR = "$$bad-typecast-operand";
	public static final String INDEX_OUT_OF_BOUND_ERROR = "$$index-out-of-bound";

	private ASMCodeFragment environmentASM() {
		ASMCodeFragment result = new ASMCodeFragment(GENERATES_VOID);
		result.append(framePointerASM());
		result.append(jumpToMain());
		result.append(stringsForPrintf());
		result.append(runtimeErrors());
		result.add(DLabel, USABLE_MEMORY_START);
		return result;
	}

	private ASMCodeFragment framePointerASM() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		frag.add(DLabel, FRAME_POINTER);
		frag.add(DataZ, 4);
		frag.add(PushD, FRAME_POINTER);
		frag.add(Memtop);
		frag.add(StoreI);
		return frag;
	}
	
	private ASMCodeFragment jumpToMain() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		frag.add(Jump, MAIN_PROGRAM_LABEL);
		return frag;
	}

	private ASMCodeFragment stringsForPrintf() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		frag.add(DLabel, EAT_LOCATION_ZERO);
		frag.add(DataZ, 8);
		frag.add(DLabel, INTEGER_PRINT_FORMAT);
		frag.add(DataS, "%d");
		frag.add(DLabel, FLOATING_PRINT_FORMAT);
		frag.add(DataS, "%f");
		frag.add(DLabel, BOOLEAN_PRINT_FORMAT);
		frag.add(DataS, "%s");
		frag.add(DLabel, CHARACTER_PRINT_FORMAT);
		frag.add(DataS, "%c");
		frag.add(DLabel, STRING_PRINT_FORMAT);
		frag.add(DataS, "%s");
		frag.add(DLabel, NEWLINE_PRINT_FORMAT);
		frag.add(DataS, "\n");
		frag.add(DLabel, SPACE_PRINT_FORMAT);
		frag.add(DataS, " ");
		frag.add(DLabel, HORIZONTAL_TAB_PRINT_FORMAT);
		frag.add(DataS, "\t");
		frag.add(DLabel, BOOLEAN_TRUE_STRING);
		frag.add(DataS, "true");
		frag.add(DLabel, BOOLEAN_FALSE_STRING);
		frag.add(DataS, "false");
		
		return frag;
	}
	
	
	private ASMCodeFragment runtimeErrors() {
		ASMCodeFragment frag = new ASMCodeFragment(GENERATES_VOID);
		
		generalRuntimeError(frag);
		integerDivideByZeroError(frag);
		floatingDivideByZeroError(frag);
		badOperandError(frag);
		badTypecastError(frag);
		indexOutOfBoundError(frag);
		
		return frag;
	}
	private ASMCodeFragment generalRuntimeError(ASMCodeFragment frag) {
		String generalErrorMessage = "$errors-general-message";

		frag.add(DLabel, generalErrorMessage);
		frag.add(DataS, "Runtime error: %s\n");
		
		frag.add(Label, GENERAL_RUNTIME_ERROR);
		frag.add(PushD, generalErrorMessage);
		frag.add(Printf);
		frag.add(Halt);
		return frag;
	}
	private void integerDivideByZeroError(ASMCodeFragment frag) {
		String intDivideByZeroMessage = "$errors-int-divide-by-zero";
		
		frag.add(DLabel, intDivideByZeroMessage);
		frag.add(DataS, "integer divide by zero");
		
		frag.add(Label, INTEGER_DIVIDE_BY_ZERO_RUNTIME_ERROR);
		frag.add(PushD, intDivideByZeroMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}

	private void floatingDivideByZeroError(ASMCodeFragment frag) {
		String floatDivideByZeroMessage = "$errors-float-divide-by-zero";

		frag.add(DLabel, floatDivideByZeroMessage);
		frag.add(DataS, "float divide by zero");

		frag.add(Label, FLOATING_DIVIDE_BY_ZERO_RUNTIME_ERROR);
		frag.add(PushD, floatDivideByZeroMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}

	private void badOperandError(ASMCodeFragment frag) {
		String badComparisonOperandMessage = "$errors-bad-comparison-operand";

		frag.add(DLabel, badComparisonOperandMessage);
		frag.add(DataS, "bad comparison operand");

		frag.add(Label, BAD_COMPARISON_OPERAND_RUNTIME_ERROR);
		frag.add(PushD, badComparisonOperandMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}

	private void badTypecastError(ASMCodeFragment frag) {
		String badTypecastOperandMessage = "$errors-bad-typecast-operand";

		frag.add(DLabel, badTypecastOperandMessage);
		frag.add(DataS, "bad comparison operand");

		frag.add(Label, BAD_TYPECAST_OPERAND_RUNTIME_ERROR);
		frag.add(PushD, badTypecastOperandMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}

	private void indexOutOfBoundError(ASMCodeFragment frag) {
		String indexOutOfBoundErrorMessage = "$errors-index-out-of-bound";

		frag.add(DLabel, indexOutOfBoundErrorMessage);
		frag.add(DataS, "index out of bound");

		frag.add(Label, INDEX_OUT_OF_BOUND_ERROR);
		frag.add(PushD, indexOutOfBoundErrorMessage);
		frag.add(Jump, GENERAL_RUNTIME_ERROR);
	}
	
	
	public static ASMCodeFragment getEnvironment() {
		RunTime rt = new RunTime();
		return rt.environmentASM();
	}
}
