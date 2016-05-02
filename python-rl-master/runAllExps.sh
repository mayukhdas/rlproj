agents=(acrobot cartpole)
methods=(stc ghs alphabound)
alphas=(0.000001 0.00001 0.0001 0.001 0.01 0.1 1.0)
runs=10
episodes=50

for agent in "${agents[@]}"; do
	for method in "${methods[@]}"; do

		paramsFile=params/$agent/sarsa_${method}.json

		# Update number of runs
		old=$(grep -o "\"num_runs\":[ ]*[0-9.]\+" $paramsFile)
		new="\"num_runs\": $runs"
		sed -i "s/$old/$new/g" $paramsFile

		# Update number of episodes
		old=$(grep -o "\"num_episodes\":[ ]*[0-9.]\+" $paramsFile)
		new="\"num_episodes\": $episodes"
		sed -i "s/$old/$new/g" $paramsFile

		for alpha in "${alphas[@]}"; do

			# Update alpha
			old=$(grep -o "\"alpha\":[ ]*[0-9.]\+" $paramsFile)
			new="\"alpha\": $alpha"
			sed -i "s/$old/$new/g" $paramsFile

			sh runExp.sh $agent $method $alpha > outputs/final_${agent}_${method}_${alpha}.txt
		done
	done
done
