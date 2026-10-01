#!/bin/sh
# Call a tool directly over Streamable HTTP (stateless).
curl -s https://hkracing.live/mcp \
  -H 'content-type: application/json' \
  -H 'accept: application/json, text/event-stream' \
  -H 'mcp-protocol-version: 2025-06-18' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"get_meeting","arguments":{"lang":"en"}}}'
