#!/bun/bash
# ./eucOrUtf.sh
# 현재 디텍토리에 있는 파일을 utf8 형태의 파일인 경우는 utf 디렉토리로, 
# 그렇지 않은 파일은 euc 디렉토리로 복사함. 

for file in *     # 디렉토리 내의 각 파일에 대해서  다음을 실행 
do
    # 파일이 utf 인지를 체크
    # 결과는 $? 로서 확인하며, 표준출력 내용은 사용하지 않으므로 삭제   
    isutf8 $file > /dev/null
    # 파일이 utf이고 또한 일반파일 (즉, 디렉토리가 아님) 인 경우 
    if [ $? == 0 ]  && [ -f $file ]  
    then
        cp $file utf/
    # 파일이 utf가 아니고 또한 일반파일인 경우  
    elif [ $? == 1 ] && [ -f $file ]   
    then
	cp $file euc/
    fi
done
