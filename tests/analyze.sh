#!/bin/bash

file_path=$1

if [ -z "$file_path" ]; then
    echo "Error: Please provide the file path."
    exit 1
fi

if [ ! -f "$file_path" ]; then
    echo "Error: File not found."
    exit 1
fi

numbers=()
while IFS=':' read -r _ number; do
    number=$(echo "$number" | tr -d '[:space:]')  # Remove leading/trailing spaces
    if [[ "$number" =~ ^[0-9]+$ ]]; then
        numbers+=("$number")
    fi
done < "$file_path"

if [ ${#numbers[@]} -eq 0 ]; then
    echo "No valid numbers found in the file."
    exit 1
fi

# Calculate average
sum=0
for num in "${numbers[@]}"; do
    (( sum += num ))
done
average=$(( sum / ${#numbers[@]} ))

# Calculate mode
mode=$(printf "%s\n" "${numbers[@]}" | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')

# Calculate median
sorted_numbers=($(printf "%s\n" "${numbers[@]}" | sort -n))
if (( ${#sorted_numbers[@]} % 2 == 0 )); then
    median=$(( (sorted_numbers[${#sorted_numbers[@]} / 2 - 1] + sorted_numbers[${#sorted_numbers[@]} / 2]) / 2 ))
else
    median=${sorted_numbers[${#sorted_numbers[@]} / 2]}
fi

# Count total number of lines
total_lines=$(wc -l < "$file_path")

# Count values above 20
count_above_20=$(grep -oE '[0-9]+' "$file_path" | awk '$1 > 20' | wc -l)

# Print results
echo "Total number of lines: $total_lines"
echo "Average: $average"
echo "Mode: $mode"
echo "Median: $median"
echo "Number of values above 20: $count_above_20"
