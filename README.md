The frontend and backend of a compiler for Tan-S.  

The barebone of this code is provided by [Thomas Shermer](https://www.sfu.ca/computing/people/faculty/thomasshermer.html) which you can find in the [initial commit](https://github.com/jiin-kim109/compiler-tan-s/commit/a78a932237520da9f8f26f67c150837f8ee761ae)  

### Commands 

**Running regression testing**  
`
sudo perl input/regressionTests.pl -f input/tan-0  
`  
(this will output failure on all cases because the script is buggy)  
Compare ASM file outputs with ASM files in `input/tan-0/output_expected`, and ASMEmu results with the txt files in `input/tan-0/expected`.  

Run the python script to compile all ASM outputs at once  
`
sudo python3 input/ASM_runner.py
`

**Running a single ASM file with ASMEmu.exe on Ubuntu**  
`
wine ASM_Emulator/ASMEmu.exe [FILE_PATH]
`  

