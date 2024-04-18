

export MLFLOW_TRACKING_URI="localhost:30552"

[[ -z "$1" ]] && { echo "Error: mode not found (usage: run.sh [init/attach])"; exit 1; }

if [$1 == "init"]:
	...
elif []:
	...
else:
	echo "Error: undefined mode $1"



