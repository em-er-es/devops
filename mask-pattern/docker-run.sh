#!/bin/sh
SCRIPT="mask.py"
INPUT="input"
OUTPUTS="output"
MASK="input/mask.png"

for INPUT in "${INPUT}/"*; do
	if [[ "${INPUT##*/}" == "${MASK##*/}" ]]; then
		continue
	fi
	OUTPUT="${OUTPUTS}/${INPUT##*/}"
	python "${SCRIPT}" -i "${INPUT}" -m "${MASK}" -o "${OUTPUT}"
	python "${SCRIPT}" -i "${INPUT}" -m "${MASK}" -in 0 -so 2 -f 0 -o "${OUTPUT}.in0so2f0.${OUTPUT##*.}"
done
