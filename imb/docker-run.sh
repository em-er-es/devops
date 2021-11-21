#!/bin/bash
BIN="${HOME}/.local/bin/imb"
[[ ! -x "$BIN" ]] && exit 2

OUTPUT="/tmp/output"
INPUT="/tmp/input"
INPUTS=("${INPUT}/"*)

ls "${INPUT}/"*
for INPUT in "${INPUTS[@]}"; do
	"$BIN" -i "$INPUT" -o "${OUTPUT}/${INPUT##*/}"
done
