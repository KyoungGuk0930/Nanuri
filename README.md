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
* **언어**
    JAVA 8 { JSP , MVC2  }  
* **프레임워크**  
    Spring { Mybatis , tiles }  
* **DB**  
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
 > 타일즈를 이용하여 모든 뷰의 공통된 헤더영역에서 보일수있는 영역입니다.   
 > 상품을 검색하면 상품이 등록되어있는지의 여부를 검색결과 박스로 보여질수 있도록 구현했습니다.

![default](https://user-images.githubusercontent.com/24869943/47962647-1d22bc80-e063-11e8-8c0c-5509783b4f07.jpg)


1. 검색바(input)에 onkeyup 속성을 주어서 검색어 를 입력할때마다 javascript 함수 실행
2. 실행된 함수 안에 Ajax 를 통한 데이터 통신
3. MVC2 구조(Controller - Service - dao)를 이용한 데이터 전달 
4. Mybatis 쿼리를 이용한 데이터 검색 후 값 리턴
5. ajax 통신이 success 일경우 display:none 처리 되있던 검색결과 박스 show 처리
6. 검색어와 맞는 데이터가 있다면 리스트로 리턴받은 값을 jQuery 안에서 each 문이용하여 li 태그안에 append
7. 검색어와 맞는 데이터가 없다면 검색결과가 없다는 텍스트의 태그를 append

*
   

> Ajax를 통한 스크롤 더보기 기능입니다.
> 상품리스트 뷰입니다.   
> 상품리스트뷰의 페이징처리를 스크롤형식의 더보기 버튼으로 구현했습니다.

![default](https://user-images.githubusercontent.com/24869943/47962649-1f851680-e063-11e8-90d5-16109b4d7f85.jpg)

1. 받아올 데이터 갯수를 초기 인덱스 넘버로 지정 (1, 4) (4개의 데이터만 갖고오기위함)
2. 상품리스트 데이터를 받아올때 sql 안에 rownum 을 이용해서 데이터마다의 순서를 지정
3. 상품리스트 데이터를 sql 문에서 정해놓은 인덱스를 조건으로 이용해 4개의 데이터만 받아옴
4. jquery 를 이용하여 더보기 버튼 클릭시 인덱스 번호를 유동적으로 바뀔수 있도록 변수를 바꿔줌
5. 전체 데이터를 받아올수 있는 함수를 만들어 전체데이터의 숫자와 데이터의 노드 갯수를 비교하여 같을시 더보기 버튼을 hide 시킴



> Ajax를 통한 옵션 검색기능 입니다.
> 상품리스트 뷰입니다.   
> 상품검색시 select 박스로 여러옵션을 상품제목과 함께 검색할수 있도록 구현했습니다.

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


