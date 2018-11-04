# Nanuri

### 개요
* 렌탈 서비스를 제공하는 가상의 사업체를 위한 웹사이트(소셜커머스)를 제작  


### 제작과정
* 프로젝트명 : 나누리 (소셜커머스 렌탈 사이트)
* 수행기간 : 2018년 10월 05일 ~ 2018년 11월 05일
* 프로젝트 인원 : 5명  
* 나의 기여도   : 35%  
* 담당역활      : 렌탈게시판 , 데이터베이스 설계 , 디자인  


### 제작과정
* 사용자들이 상품들 좀더 편리하게 검색할수 있도록 개발


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
컬럼을 만드는식으로 데이터베이스를 설계
* 테이블마다의 기본키 설정
* inner join 을 활용한 테이블 참조이용


### 프로젝트 소개
> 담당 view

![view](https://user-images.githubusercontent.com/24869943/47962959-dbe0db80-e067-11e8-9bc4-a4b3b9e5d98f.png)


### 구현기능소개
 > Ajax를 통한 검색 기능입니다.

![default](https://user-images.githubusercontent.com/24869943/47962647-1d22bc80-e063-11e8-8c0c-5509783b4f07.jpg)


1. 검색바(input)에 onkeyup 속성을 주어서 검색어 를 입력할때마다 javascript 함수 실행
2. 실행된 함수 안에 Ajax 를 통한 데이터 통신
3. MVC2 구조(Controller - Service - dao)를 이용한 데이터 전달 
4. Mybatis 쿼리를 이용한 데이터 검색 후 값 리턴
5. ajax 통신이 success 일경우 display:none 처리 되있던 검색결과 박스 show 처리
6. 검색어와 맞는 데이터가 있다면 리스트로 리턴받은 값을 jQuery 안에서 each 문이용하여 li 태그안에 append
7. 검색어와 맞는 데이터가 없다면 검색결과가 없다는 텍스트의 태그를 append



> Ajax를 통한 스크롤 더보기 기능입니다.

![default](https://user-images.githubusercontent.com/24869943/47962649-1f851680-e063-11e8-90d5-16109b4d7f85.jpg)

상품 리스트페이지의 상품을
받아올때 index번호를 1 과 4로 정해놓습니다.  Mybatis 쿼리문을 통해 rownum 로 데이터들에게 순서를 준후 인덱스 번호를 이용해서 4개의데이터만 끊어서 가져옵니다.
더보기 버튼을 누르면 제이쿼리를 통해 index 번호를
다음 데이터의 번호로 변경해주며 데이터를 뿌려줄수있도록 구현했습니다


> Ajax를 통한 옵션 검색기능 입니다.

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


