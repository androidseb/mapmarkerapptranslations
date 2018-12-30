set -e
LANGUAGE_NAME=$1
LANGAGE_FILE_PREFIX=$2
LANGUAGE_FILE_PATH=./translations/$2_strings.md
TR_HUMAN_COUNT=$(cat $LANGUAGE_FILE_PATH|grep "translated (by human"|wc -l)
COMPLETION_PERCENTAGE=0
if [ $TR_HUMAN_COUNT -ne "0" ]; then
	TR_MACHINE_COUNT=$(cat $LANGUAGE_FILE_PATH|grep "translated (by machine"|wc -l)
	TR_TOTAL=$(expr $TR_HUMAN_COUNT + $TR_MACHINE_COUNT)
	COMPLETION_PERCENTAGE=$(expr $TR_HUMAN_COUNT \* 100 / $TR_TOTAL)
fi
echo "["$LANGUAGE_NAME" ("$COMPLETION_PERCENTAGE"% human-translated)]("$LANGUAGE_FILE_PATH")"
