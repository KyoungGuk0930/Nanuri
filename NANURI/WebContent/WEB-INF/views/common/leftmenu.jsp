<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
<!--
.leftmenubox{    left: -1000px;display: block !important;}
.leftmenubtn {
    position: fixed;
    width: 50px;
    height: 50px;
    top: 30%;
    cursor: pointer;
    z-index: 999;
    border: none;
    background-color: #542f82;
    padding-top: 2px;
    padding-right: 1px;
    border-radius: 8px;
}
.menu_x {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 5px;
    font-size: 26px;
    box-sizing: border-box;
    cursor: pointer;
    right: 0;
    position: absolute;
    margin-top: 2px;
        border: none;
}
.left_login{ display: table;    width: 100%;    padding: 30px;}
.left_login li{ float:left; width: 50%}
.left_login li a {font-size: 14px;    margin-left: 5px;}
.loginid{width: 100% !important;
    font-size: 15px;

}
.loginid span{}
.leftmenubox{height: 430px;}    
-->
</style>

<div class="leftmenubtn">
   <div class="barBox">
     <i class="fas fa-bars" style="font-size: 38px; color: #fff"></i>
  </div>
</div>

<div class="leftmenubox">

   <div class="left_top">
   
   <div class="menu_x" style="font-size: 13px">
      <i class="fas fa-times" style="font-size: 16px; color: #fff"></i>
   </div>
      <div class="left_logo">
      <a class="logo"></a>
      </div>
      
      <div class="left_login">
         

            <c:choose>
               <c:when test="${login.auth eq 0}">
                  <li class="loginid"><span style="color:#542f82">${login.name }</span> 님 환영합니다. <a href="logout.do"><i class="fas fa-sign-out-alt mr-5"></i></a></li>
<!--                   <li style="    width: 100%;"><a href="logout.do"><i class="fas fa-sign-out-alt mr-5"></i>로그아웃</a></li>
 -->               </c:when>
               <c:when test="${login.auth eq 2}">
                  <li class="my"><a href="admin.do"><i class="fas fa-hammer mr-5"></i>관리자</a></li>
                  <li><a href="logout.do"><i class="fas fa-sign-out-alt mr-5"></i>로그아웃</a></li>
               </c:when>
               <c:otherwise>
                  <li><a href="login.do"><i class="fas fa-sign-in-alt mr-5"></i>로그인</a></li>
                  <li><a href="regi.do"><i class="fas fa-user-plus mr-5"></i>회원가입</a></li>
               </c:otherwise>
            </c:choose>


      </div>
      
      <div style="margin: 0 auto; width: 80%; border-bottom: 1px solid #ddd"></div>
      
      <div class="left_content">
        <ul>
      <c:choose>
               <c:when test="${login.auth eq 0}">
                  <li>
               <a href="mypage.do">
               <i class="fas fa-user"></i>
               <span>마이쇼핑</span>
               </a>
            </li>
            <li>
                <a href="basketList.do">
               <i class="fas fa-shopping-cart"></i>
               <span>장바구니</span>
               </a>
            </li>
            <li>
               <a href="reviewlist.do">
               <i class="fas fa-file"></i>
               <span>리뷰</span>
               </a>
            </li>
            <li>
               <a href="qnalist.do">
               <i class="fas fa-quran"></i>
               <span>Q&A</span>
               </a>
            </li>
               </c:when>
               <c:when test="${login.auth eq 2}">
              
            <li>
               <a href="reviewlist.do">
               <i class="fas fa-file"></i>
               <span>리뷰</span>
               </a>
            </li>
            <li>
               <a href="qnalist.do">
               <i class="fas fa-quran"></i>
               <span>Q&A</span>
               </a>
            </li>
               </c:when>
               <c:otherwise>
            <li>
               <a href="mypage.do">
               <i class="fas fa-user"></i>
               <span>마이쇼핑</span>
               </a>
            </li>
            <li>
                <a href="basketList.do">
               <i class="fas fa-shopping-cart"></i>
               <span>장바구니</span>
               </a>
            </li>
            <li>
               <a href="reviewlist.do">
               <i class="fas fa-file"></i>
               <span>리뷰</span>
               </a>
            </li>
            <li>
               <a href="qnalist.do">
               <i class="fas fa-quran"></i>
               <span>Q&A</span>
               </a>
            </li>
               </c:otherwise>
            </c:choose>
       
            
         </ul>
         
      </div>
      
   </div>
   
   <div class="left_middle">
   </div>
   <!-- <div style="margin-top: 10px; margin-left: 15px;">
   <h3>Nanuri</h3>
   </div>
   <div class="menu_x" style="font-size: 13px">
      
   </div>
   <ul style="display: table;">
         <li>
            <a href="mypage.do">
            <i class=""></i>
            <p>마이페이지</p>
            </a>            
         </li>
         <li>
            <a href="basketList.do">
            <i class=""></i>
            <p>장바구니</p>
            </a>
            
         </li>
         <li>
            <a href="rentalList.do">
            <i class=""></i>
            <p>렌털서비스</p>
            </a>
         </li>
         <li>
            <a href="qnalist.do">
            <i class=""></i>
            <p>Q&A</p>
            </a>
         </li>
      </ul>
    -->


</div>

<script type="text/javascript">

   $(".leftmenubtn").click(function(){
      $(this).fadeOut();
      $(".leftmenubox").animate({left: "0"});
   });
   
   $(".menu_x").click(function(){
      $(".leftmenubox").animate({left: "-1000px"});
      $(".leftmenubtn").fadeIn();
   });

</script>