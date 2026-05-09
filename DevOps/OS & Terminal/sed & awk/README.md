# Advanced Text Processing (sed & awk)

## Description
`sed` (Stream Editor) and `awk` (A programming language for pattern scanning and processing) are the two most powerful text-processing tools in the Linux terminal.

## sed (Search and Replace)
`sed` is primarily used for finding and replacing text in files or streams.
```bash
# Replace 'old' with 'new' in a file
sed -i 's/old/new/g' file.txt

# Delete lines containing 'pattern'
sed -i '/pattern/d' file.txt

# Print only specific lines (e.g., 5 to 10)
sed -n '5,10p' file.txt
```

## awk (Data Extraction)
`awk` is designed for processing column-based data.
```bash
# Print the 1st and 3rd columns of a file
awk '{print $1, $3}' file.txt

# Print lines where the 2nd column is greater than 100
awk '$2 > 100' file.txt

# Sum the values in the 1st column
awk '{sum += $1} END {print sum}' file.txt

# Use a custom delimiter (e.g., comma for CSV)
awk -F',' '{print $2}' data.csv
```

## When to use what?
- Use **sed** when you need to quickly edit text or replace strings.
- Use **awk** when you need to parse structured data (logs, tables, CSVs) and perform logic or calculations.
