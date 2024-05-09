#!/bin/bash

# Directory where the script and m01-m05 folders are located
base_dir="."

# Output file to store the timing results
output_file="${base_dir}/timing_results.txt"

# Clear the output file to start fresh
> "$output_file"

# Loop through directories m01 to m05
for dir in "${base_dir}"/m{01..05}; do
    if [[ -d "$dir" ]]; then
            echo "Processing directory: $dir" >> "$output_file"
            #running on clean R
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 ../../r/bin/R  -f "${dir}/pro.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Prof, JIT0: $elapsed_time seconds" >> "$output_file"


    else
        echo "$dir does not exist" >> "$output_file"
    fi
done


 #running on modified R
 echo "Processing directory: m01" >> "$output_file"
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 R_SCALENE=mockoutm01.txt ../../r/bin/R -f "m01/run.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Scal, JIT0: $elapsed_time seconds" >> "$output_file"
 #running on modified R
 echo "Processing directory: m02" >> "$output_file"
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 R_SCALENE=mockoutm02.txt ../../r/bin/R -f "m02/run.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Scal, JIT0: $elapsed_time seconds" >> "$output_file"
 #running on modified R
 echo "Processing directory: m03" >> "$output_file"
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 R_SCALENE=mockoutm03.txt ../../r/bin/R -f "m03/run.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Scal, JIT0: $elapsed_time seconds" >> "$output_file"
 #running on modified R
 echo "Processing directory: m04" >> "$output_file"
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 R_SCALENE=mockoutm04.txt ../../r/bin/R -f "m04/run.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Scal, JIT0: $elapsed_time seconds" >> "$output_file"
 #running on modified R
 echo "Processing directory: m05" >> "$output_file"
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 R_SCALENE=mockoutm05.txt ../../r/bin/R -f "m05/run.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Scal, JIT0: $elapsed_time seconds" >> "$output_file"


echo "Script execution completed."
