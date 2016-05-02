agent=$1 #(cartpole)
method=$2 #(stc ghs alphabound)
alpha=$3 #(0.000001 0.00001 0.0001 0.001 0.01 0.1 1.0)

paramsFile=params/$agent/sarsa_${method}.json
outputFile=outputs/output_${agent}_${method}_${alpha}.txt

python -m pyrl/rlglue/run --load $paramsFile > $outputFile
sh calculate.sh $outputFile
