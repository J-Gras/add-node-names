# Add-Node-Names

This package adds the `_node_name` field to Bro logs to indicate which node generated
a log entry. By default the field is only added to the `conn.log`. For further
configuration, the following options are available:

Option                       | Default Value   | Description
-----------------------------|-----------------|-------------------------------------------
`enable_all_logs: bool`      | `F`             | Enables node names for all active streams
`exclude_logs: set[Log::ID]` | `{ }`           | Streams **not** to add node names for
`include_logs: set[Log::ID]` | `{ Conn::LOG }` | Streams to add node names for

If Bro is not executed in cluster mode, the field is not added.

**Note:** The script has been tested with Bro version 2.5.2.
