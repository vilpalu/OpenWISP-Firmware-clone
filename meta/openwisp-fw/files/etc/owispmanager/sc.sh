#!/bin/sh
#
iw dev r12v25 station dump | grep Station | wc -l >>/tmp/edu2
iw dev r12v31 station dump | grep Station | wc -l >>/tmp/KTU2
iw dev r10v23 station dump | grep Station | wc -l >>/tmp/KTU5
iw dev r10v14 station dump | grep Station | wc -l >>/tmp/edu5
date>>/tmp/time
