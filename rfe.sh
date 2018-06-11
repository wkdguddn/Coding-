#!/bin/bashr
# ./rfe.sh c d
# 디렉토리 내의 파일 중 첫 인수로 주어진 확장자의 파일을 두 번째 인수로 지정된
# 확장자로 파일 이름 변경, 예: a.c를 a.c로 변경 

# 입력 인수가 2 개인지를 점검하고 그렇지 않으면 에러 메시지 출력 후 종료
if [ $# -ne 2 ]
then 
  echo "Usage: $0 old_file_suffix new_file_suffix"
  exit 1
fi

for file in *.$1         # 첫 인수로 주어진 파일 확장자 파일들 각각에 대해서 
do
  # 확장자를 뺀 파일이름의 앞 부분만을 취한 후, 그 결과에 새로운 확장자를 접합시킴 
  mv $file `basename $file $1`$2 
done
