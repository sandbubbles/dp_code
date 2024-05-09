#!/bin/bash

# Directory where the script and m01-m05 folders are located
base_dir="."

# Loop through directories m01 to m05
for dir in "${base_dir}"/m{01..05}; do
    if [[ -d "$dir" ]]; then
        echo "Processing directory: $dir"
        # Check for sca.R and run it if it exists

            #running on modified R
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 R_SCALENE=mockout.txt ../../r/bin/R -f "${dir}/run.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Scal, JIT0: $elapsed_time seconds"


            #running on clean R
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 ../../r/bin/R  -f "${dir}/pro.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "Prof, JIT0: $elapsed_time seconds"

            #running on clean R
            start_time=$(date +%s.%N)
            R_ENABLE_JIT=0 ../../r/bin/R  -f "${dir}/sca.R"
            end_time=$(date +%s.%N)
            elapsed_time=$(echo "$end_time - $start_time" | bc)
            echo "non, JIT0:  $elapsed_time seconds"


    else
        echo "$dir does not exist"
    fi
done

echo "Script execution completed."
