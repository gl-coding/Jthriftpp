#!/bin/sh
export CLASS_PATH_JAVA=""


for i in /usr/local/lib/*.jar
do
        if [ "x${CLASS_PATH_JAVA}" == "x" ]
        then
                export CLASS_PATH_JAVA=$i
                continue
        fi
        export CLASS_PATH_JAVA=${CLASS_PATH_JAVA}:$i
#echo $i
done


echo "$CLASS_PATH_JAVA"
javac -classpath $CLASS_PATH_JAVA Client.java ./gen-java/*.java
