#!/usr/bin/env bash
REPOSITORY=/home/ec2-user/cicdproject
cd $REPOSITORY

# JAR 파일 이름 찾기 (빌드 결과물 이름에 맞춰 수정될 수 있음)
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

# 기존에 실행 중인 자바 프로세스 종료
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
# 백그라운드 실행
nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &