#
# @TEST-EXEC: bro -C -r $TRACES/web.trace ../../../scripts/
# @TEST-EXEC: cat *.log > out
# @TEST-EXEC: btest-diff out