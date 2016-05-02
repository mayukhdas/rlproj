file=$1
sum=0
cut -d' ' -f4 $file | 
	grep "[0-9.]\+" |
{
	while read -r line; do
		sum=$(echo "$sum + $line" | bc -l)
	done
	echo "Average reward: "$(echo "$sum/10" | bc -l)
}


#for i in {1..15}; do 
#	lineNo=$(((25*$i)-1))
#	totReward=0
#	grep "^${lineNo} " output_sarsa_stc.txt |
#	{
#		while read -r line; do 
#			reward=$(echo $line | cut -d' ' -f4)
#			totReward=$(echo "$totReward + $reward" | bc -l)
#		done
#		echo "$totReward/10" | bc -l
#	}
#done
