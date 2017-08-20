#!/bin/sh
cd /opt/cfx-server
[ -d cache ] || mkdir cache

/opt/cfx-server/FXServer $SERVER_ARGS $*
