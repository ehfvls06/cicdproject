#!/usr/bin/env bash
REPOSITORY=/home/ec2-user/cicdproject
cd $REPOSITORY

APP_NAME=cicdproject
# 빌드된 JAR 파일 찾기
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

# 기존 프로세스 종료
CURRENT_PID=$(pgrep -f "java -jar")

if [ -z "$CURRENT_PID" ]
then
  echo "> 종료할 프로세스가 없습니다."
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH 배포"
# 백그라운드에서 Java 실행
nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &
