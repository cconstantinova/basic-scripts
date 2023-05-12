# Download the file
wget -O deniro_years.csv https://people.sc.fsu.edu/~jburkardt/data/csv/deniro.csv

# Show the year of "The Godfather" movie
grep -i "The Godfather" deniro_years.csv | awk -F, '{print $3}'

# Create a file with all movies sorted by score
# {echo "Year,Score,Title" && tail -n +2 deniro_years.csv | sort -t, -k2  -r -n }> movies_sorted_by_score.csv
{ echo "Year, Score, Title" && tail -n +2 deniro_years.csv | sort -t ',' -k 2 -rn; } > sorted_movies.csv

# Count all lines that contain "the" (case-insensitive)
# grep -i "the" deniro_years.csv | wc -l
echo $(grep -i "the" deniro_years.csv | wc -l)
# Replace "15 Minutes" with "Fifteen minutes" and save the result in 15.csv
sed 's/15 Minutes/Fifteen Minutes/g' deniro_years.csv > 15.csv

# Convert the data to JSON format (without headers) and save it in deniro.json
# awk -F, '{print "{\"Title\": \""$3"\", \"Score\": \""$2"\", \"Year\": \""$1"\"}"}' deniro_years.csv | tail -n +2 > deniro.json
tail -n +2 deniro_years.csv | jq -R 'split(",") | {film: .[2], year: .[0], score: .[1]}' | jq -s '.' > deniro.json