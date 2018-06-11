#!/bin/bashr
# ./allWords.sh
# 현재 디렉토리에서 라인 수가 10 이하인 퍼일들의 단어 수를 합산함 

sum=0          # 누적 변수 초기화 
for f in *     # 현 디렉토리의 모든 파일을 하나씩 반복 처리 
do
   wc $f > tmp    # 각 파일마다 라인수, 단어수, 문자수, 파일명을 한 줄로 만들어 tmp 에 저장
   read lines words bytes < tmp     # tmp 파일의 한 줄을 읽어 앞의 세 단어를 각 변수에 할당 
   if [ $lines -lt 10 ]             # 그 중에서 라인 수가 10 이하인 것을 선택함 
   then
      sum=`expr $sum + $words`      # 선택된 파일의 단어 수를 누적하여 합산함 
   fi
done
rm tmp        # 임시 저장 파일 삭제 
echo $sum     # 누적된 결과 값 표준출력 

