# Nanuri

### 개요
* 렌탈 서비스를 제공하는 가상의 사업체를 위한 웹사이트(소셜커머스)를 제작한다.  

### 제작과정
* 프로젝트명 : 나누리 (소셜커머스 렌탈 사이트)
* 수행기간 : 2018년 10월 05일 ~ 2018년 11월 05일
* 프로젝트 인원 : 5명  
* 나의 기여도   : 35%  
* 담당역활      : 렌탈게시판 , 데이터베이스 설계 , 디자인  


### 개발환경
* 언어  
    JAVA 8 { JSP , MVC2  }  
* 프레임워크  
    Spring { Mybatis , tiles }  
* DB  
   ORACLE 11g  

* HTML / CSS / JavaScript  
   JQuery / bootstrap  

### 데이터 베이스 설계 

![db](https://user-images.githubusercontent.com/24869943/47962601-8bb34a80-e062-11e8-80c1-51114b32150b.jpg)

 * 최대한 테이블의 중복을 없애며 각각 테이블마다의 고유 성격들만
컬럼을 만드는식으로 데이터베이스를 설계하였습니다.


### 프로젝트 소개
> main view

![main](https://user-images.githubusercontent.com/24869943/47962618-c2896080-e062-11e8-91aa-e57611704ee0.jpg)

## 구현기능소개

Ajax를 통한 검색 기능입니다.

![default](https://user-images.githubusercontent.com/24869943/47962647-1d22bc80-e063-11e8-8c0c-5509783b4f07.jpg)

검색바(input)에 
onkeyup 속성을 주어서 
검색어 를 입력할때마다
Ajax 로 데이터베이스에
데이터에 검색을 한 후
검색어와 맞는 데이터가 없다면
검색결과가 없다는 텍스트의 태그를 append 시켰고,
맞는 데이터가 있다면 리스트로
받아온 데이터들을 jQuery 안에서 each 문을 돌려
각각의 데이터들을 append 시키는 방식으로 구현했습니다. 


Ajax를 통한 스크롤 더보기 기능입니다.

![default](https://user-images.githubusercontent.com/24869943/47962649-1f851680-e063-11e8-90d5-16109b4d7f85.jpg)

상품 리스트페이지의 상품을
받아올때 index번호를 1 과 4로 정해놓습니다.  Mybatis 쿼리문을 통해 rownum 로 데이터들에게 순서를 준후 인덱스 번호를 이용해서 4개의데이터만 끊어서 가져옵니다.
더보기 버튼을 누르면 제이쿼리를 통해 index 번호를
다음 데이터의 번호로 변경해주며 데이터를 뿌려줄수있도록 구현했습니다


Ajax를 통한 옵션 검색기능 입니다.

![default](https://user-images.githubusercontent.com/24869943/47962650-214eda00-e063-11e8-9fce-4856e5108209.jpg)

select 박스들의 옵션마다의
값과 검색바(input) 값을
Ajax를 통해 데이터베이스와
비교를 한후 리스트에
append 시키는 식으로 구현하였습니다.
만약 검색바(input) 에 값이 없고
select 박스만 클릭을하였을경우
Mybatis 동적쿼리를 이용하여
검색바(input)의 값이 없을경우를
체크하여 select박스의 값들로만 정렬시키는 방식으로 구현했습니다.


