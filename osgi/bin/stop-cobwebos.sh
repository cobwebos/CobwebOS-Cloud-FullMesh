#!/bin/sh
#
#    Licensed to the Apache Software Foundation (ASF) under one or more
#    contributor license agreements.  See the NOTICE file distributed with
#    this work for additional information regarding copyright ownership.
#    The ASF licenses this file to You under the Apache License, Version 2.0
#    (the "License"); you may not use this file except in compliance with
#    the License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

echo `date` " begin to stop cobwebos-devops ..." >> logs/logstop.log
while true
    do
    pid=`ps -ef |grep "cobwebos-devops.war" |grep -v grep | awk '{print $2}'`
	echo pid=${pid}
    if [ ${pid} ]; then
        echo `date` "cobwebos-devops pid=${pid} is running" >> logs/logstop.log
		kill -9 $pid >> logs/logstop.log
        break;
    else
	   PROCESS=`ps -ef |grep "cobwebos-devops.war" |grep -v grep | awk '{print $2}'`
	   echo PROCESS=${PROCESS}
        for i in $PROCESS
           do
               echo `date` "Kill the $1 process [ $i ]" >> logs/logstop.log
               kill -9 $i >> logs/logstop.log
           done      
      
		echo `date` " end to stoping cobwebos-devops ..." >> logs/logstop.log
        break
    fi
done
echo `date` " end to stop cobwebos-devops ..." >> logs/logstop.log
