#! /bin/bash

SCRIPT=`realpath $0`
DIR=`dirname $SCRIPT`
D=$DIR/..

MODEL=$D/models/ssdlite_mobilenet_v2/ssdlite_mobilenet_v2.xml

echo -e "Model $MODEL"

if [[ ! -f  $MODEL ]]; then 
    echo -e "Model $MODEL not found"
    exit 1
fi

P=$D/inference_engine/samples/python/attic/detect.py

for file in "$D/images"/car-ped-bike-01.jpg; do
  echo "$file"
  python3 $P \
    --model $MODEL \
    --device CPU \
    --input $file
done



