import os
import subprocess

source_dir = 'input/tan-0/output/'
dest_dir = 'input/tan-0/output_asm_res/'
expected_dir = 'input/tan-0/expected/'
asm_emulator_loc = 'ASM_Emulator/ASMEmu.exe'

def ext_to_txt(filename):
    filename_no_ext, _ = os.path.splitext(filename)
    new_filename = filename_no_ext + '.txt'
    return new_filename

def error_file_line_mismatch(line_index):
    print("Line ", i, ": NOT IDENTICAL")


success_files = []
failed_files = []

for filename in os.listdir(source_dir):
    print("Reading: ", filename)
    if (filename.startswith('err')):
        failed_files.append("Failed, {} is an ERROR FILE so should not be present".format(filename))

    f = os.path.join(source_dir, filename)
    cur_dir = os.path.abspath(os.curdir)
    output_filename = ext_to_txt(filename)
    print("Output to: ", dest_dir + output_filename)
    output = open(os.path.join(cur_dir, dest_dir + output_filename), "w+")

    cmd = ['wine', asm_emulator_loc, f]
    res = subprocess.run(cmd, stdout=output)

    output.close()

print("\n")
print("Comparing outputs with expected outputs")
print("\n")

for expected_filename in os.listdir(expected_dir):
    expected_filepath = expected_dir + expected_filename
    output_filepath = dest_dir + expected_filename

    success = True

    try:
        f1 = open(expected_filepath, "r")
        f2 = open(output_filepath, "r")

        f1_data = f1.readlines()
        f2_data = f2.readlines()

        if len(f1_data) != len(f2_data):
            error_file_line_mismatch(0)
            print("Failed, two files have different number of lines")
            success = False
        else:
            i = 0
            for i in range(len(f1_data)):
                line1 = f1_data[i]
                line2 = f2_data[i]
                if line1 != line2:
                    error_file_line_mismatch(i)
                    # else print that line from both files
                    print("\tFile {}:".format(expected_filepath), line1, end='\n')
                    print("\tFile {}:".format(output_filepath), line2, end='\n')
                    success = False

    except Exception as e:
        error_file_line_mismatch(0)
        print("Failed, ", e)
        success = False

    if success:
        success_files.append("Success, {} IDENTICAL".format(expected_filename))
    else:
        failed_files.append("Failed, {} NOT IDENTICAL".format(expected_filepath))

    # closing files
    f1.close()
    f2.close()

print("\n")
for success_file in success_files:
    print(success_file)

print("\n")
for failed_file in failed_files:
    print(failed_file)

if len(failed_files) == 0:
    print("ALL TEST PASSED!")