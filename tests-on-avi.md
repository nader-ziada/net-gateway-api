"basics": PASS
"basics/http2": SKIP - not supported by ako
"grpc": SKIP - not supported by ako
"grpc/split": SKIP - not supported by ako
"headers/pre-split": PASS - testing request
"headers/post-split": SKIP - not implemented by avi yet
"headers/probe": PASS - testing request
"hosts/multiple": SKIP - pending on headers fixes in avi
"dispatch/path": SKIP - pending on headers fixes in avi
"dispatch/percentage": SKIP - pending on headers fixes in avi
"dispatch/path_and_percentage": SKIP - pending on headers fixes in avi
"dispatch/rule": SKIP - pending on headers fixes in avi
"retry":
"timeout": PASS
"tls": SKIP
"update": SKIP
"visibility":
"visibility/split":
"visibility/path":
"ingressclass": PASS
"websocket": SKIP - ako doesn't support websocket
"websocket/split": SKIP - ako doesn't support websocket