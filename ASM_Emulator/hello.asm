PushI	13						// [] -> [13]
PushI	12						// [13] -> [13 12]
Multiply						// [13 12] -> [156]
PushD	integer-format-string	// [156] -> [156 fmtStr]
PushI	13						//
PushD	integer-format-string
Printf							// [156 fmtStr] -> []
Printf
PushD   test
LoadI
PushD   integer-format-string
Printf
PushD	newline-string			// [] -> [nlStr]
Printf							// [nlStr] -> []
Halt
DLabel test
DataI   9
DataI   11
DLabel integer-format-string
DataC	37						// %
DataC	100						// d
DataC	0						// <null>
DLabel newline-string
DataC	10						// \n
DataC	0						// <null>
