#!/bin/bash
# ./gradCase2.sh stud.csv
# 주어진 파일의 학생 성적을 학점으로 분류함  

IFS=","  # 필드 separator를 , 로 지정 
n=0; a=0; b=0; c=0; d=0; sum=0   # 변수 값 초기화 
while read name score     # 각 줄에 두개 필드 (이름,점수) 를 읽음 
do
    n=`expr $n + 1`                  # 학생 수를 1 씩 증가 
    (( sum = sum + score ))          # 모든 학생의 점수를 정수로 합산 
    case $score in                   # 스트링으로 된 점수의 경우를 분류  
       9[0-9] )   a=`expr $a + 1`;;  # 90~99 인 경우 a 값 1 증가 
       8[0-9] )   b=`expr $b + 1`;;  # 80~89 인 경우 b 값 1 증가 
       7[0-9] )   c=`expr $c + 1`;;  # 70~79 인 경우 c 값 1 증가 
       6[0-9] )   d=`expr $d + 1`;;  # 60~69 인 경우 d 값 1 증가 
    esac
done < $1    # 데이터 파일 입력 
(( avrg = sum / n ))                 # 평균 값 계산 
echo "학생수: ${n}명, 평균점수: ${avrg}"
echo "A: ${a}명, B: ${b}명, C: ${c}명, D: ${d}명"
