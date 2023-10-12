#!/bin/ash

# export JAVA_HOME=/usr/local/jdk-17.0.8
workspace=/workspace

# if [[ ":$PATH:" != *":${JAVA_HOME}/bin:"* ]]; then
#	PATH=${JAVA_HOME}/bin:${PATH}
# fi

[ "${jarName}" = "" ] && jarName="jarName"

cd ${workspace}

v=$(for x in *.jar; do
	echo $x | grep "${jarName}" | sed -E 's/.*-([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*)\.jar$/\1/'
done | sort -V -r | head -1)

jarFile="${jarName}-${v}.jar"

if [ -f "$jarFile" ]; then
	echo "Jar File: $jarFile"

	java -jar -Dspring.profiles.active=prod $jarFile
else
	echo "Put your jar file in here ($workspace)"
fi
