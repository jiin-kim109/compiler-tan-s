### Commands

**Running regression testing**  
`
perl input/regressionTests.pl -f input/tan-0  
`  
(this will output failure on all cases because the script is buggy)  
Compare ASM file outputs with ASM files in `input/tan-0/output_expected`, and ASMEmu results with the txt files in `input/tan-0/expected`.  

Run the python script to compile all ASM outputs at once  
`
python3 input/ASM_runner.py
`

**Running a single ASM file with ASMEmu.exe on Ubuntu**  
`
wine ASM_Emulator/ASMEmu.exe [FILE_PATH]
`  

