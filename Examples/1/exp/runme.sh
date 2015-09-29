#!/bin/sh
nn = grep "Number_of_nodes" data | awk '{print $3}'

sed '1,/special/ !d' input | sed s/Number_of_nodes/"Number_of_nodes =$nn %"/ > demo
sed '/special]/,/chakoslowakia/ !d' input >>demo
