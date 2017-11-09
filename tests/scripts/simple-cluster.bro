#
# @TEST-EXEC: btest-bg-run manager-1 BROPATH=$BROPATH:.. CLUSTER_NODE=manager-1 bro %INPUT
# @TEST-EXEC: sleep 2
# @TEST-EXEC: btest-bg-run worker-1 BROPATH=$BROPATH:.. CLUSTER_NODE=worker-1 bro --pseudo-realtime -C -r $TRACES/web.trace %INPUT
# @TEST-EXEC: btest-bg-wait -k 10
# @TEST-EXEC: cat manager-1/conn.log > output
# @TEST-EXEC: cat manager-1/reporter.log >> output
# @TEST-EXEC: btest-diff output

#@TEST-START-FILE cluster-layout.bro
redef Cluster::nodes = {
	["manager-1"] = [$node_type=Cluster::MANAGER, $ip=127.0.0.1, $p=37757/tcp, $workers=set("worker-1")],
	["worker-1"]  = [$node_type=Cluster::WORKER,  $ip=127.0.0.1, $p=37760/tcp, $manager="manager-1"],
};
#@TEST-END-FILE

@load base/frameworks/control
redef Log::default_rotation_interval=0sec;

@load ../../../scripts/

event remote_connection_closed(p: event_peer)
	{
	terminate();
	}
