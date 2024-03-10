#!/bin/bash

folder_path=$1

if [ -z "$folder_path" ]; then
    echo "Error: Please provide the folder path containing sender.txt and receiver.txt."
    exit 1
fi

sender_file="${folder_path}/sender.txt"
receiver_file="${folder_path}/receiver.txt"

if [ ! -f "$sender_file" ] || [ ! -f "$receiver_file" ]; then
    echo "Error: Files not found in the specified folder."
    exit 1
fi

sender_lines=$(cat "$sender_file")
receiver_lines=$(cat "$receiver_file")

sender_count=$(echo "$sender_lines" | wc -l)
receiver_count=$(echo "$receiver_lines" | wc -l)

if [ "$sender_count" -ne "$receiver_count" ]; then
    echo "Error: The number of lines in sender.txt and receiver.txt must be the same."
    exit 1
fi

differences=()
lines=()
while IFS= read -r sender_line && IFS= read -r receiver_line; do
    sent_timestamp=$(echo "$sender_line" | grep -oE '[0-9]+')
    received_timestamp=$(echo "$receiver_line" | grep -oE '[0-9]+')

    if [ -n "$sent_timestamp" ] && [ -n "$received_timestamp" ]; then
        difference=$((received_timestamp - sent_timestamp))
        differences+=("$difference")
        lines+=("$sender_line --- $receiver_line")
    fi
done < <(paste -d '\n' <(echo "$sender_lines") <(echo "$receiver_lines"))

if [ "${#differences[@]}" -eq 0 ]; then
    echo "Error: No valid timestamps found in the files."
    exit 1
fi

# Calculate average, median, and mode
average_difference=$(echo "${differences[@]}" | tr ' ' '\n' | awk '{sum += $1} END {print sum/NR}')
median_difference=$(echo "${differences[@]}" | tr ' ' '\n' | sort -n | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }')
mode_difference=$(echo "${differences[@]}" | tr ' ' '\n' | sort -n | uniq -c | sort -nr | awk '{print $2; exit}')

echo "Average Difference: $average_difference"
echo "Median Difference: $median_difference"
echo "Mode Difference: $mode_difference"

# Print lines with large differences
threshold=20  # Adjust the threshold as needed
echo "Lines with differences greater than $threshold:"
for ((i=0; i<${#differences[@]}; i++)); do
    if [ "${differences[$i]}" -gt "$threshold" ]; then
        echo "${lines[$i]} --- Difference: ${differences[$i]}"
    fi
done
