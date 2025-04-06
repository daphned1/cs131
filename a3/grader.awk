# Function to calculate the average out of 3 classes
function avg(num) {
	return num/3
}

BEGIN { FS="," }

# Skip header
NR == 1 {
	next	
}

{
	students[$1] = $2
	total[$1] = $3 + $4 + $5

	# Initialize the lowest and highest scoring students	
	if (NR == 2) {
		max = total[$1]
		min = total[$1]
		highest = students[$1]
		lowest = students[$1]		
	}	
}

END {
	for (i in total) {
		avg_score[i] = avg(total[i])

		if (avg_score[i] >= 70){
			status[i] = "Pass"	
		}
		else {
			status[i] = "Fail"	
		}
		
		print "Student name: ", students[i]
		print "Total score: ", total[i]
		print "Average score: ", avg_score[i]
		print "Status (pass/fail): ", status[i]
		print " "
		
		# Find the student with the highest/lowest score
		if (total[i] > max) {
			max = total[i]
			highest = students[i]
		}

		if (total[i] < min) {
			min = total[i]
			lowest = students[i]
		}
	}

	print "Highest scoring student: ", highest
	print "Lowest scoring student: ", lowest
}
