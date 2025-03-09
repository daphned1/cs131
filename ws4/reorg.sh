#!/bin/bash

# Get the date
time=$(date "+%F-%T")

# Get the dataset
dataset="2019-01-h1.csv"

# Vendor IDs 
vendors=("1.0" "2.0" "4.0")

# Loop through the vendor
for vendor in "${vendors[@]}"; do
        # Create separate file for each ID
        output="${time}-${vendor}.csv"

        # Extract specific vendor ID and save to file 
        grep "^$vendor," "$dataset" > "$output"

        # Add file to .gitignore
        echo "$output" >> .gitignore

done

# Write word count to ws4
wc ${time}-*.csv > ws4.txt

# Write .gitignore content to ws4.txt
cat .gitignore >> ws4.txt
