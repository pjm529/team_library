<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관/열람실2</title>
<link rel="stylesheet" href="/resources/css/mylib/sub1/readingRoom.css">
</head>
<body>
    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>공지사항</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="#">공지사항</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        
        
       <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <jsp:include page="../lnb.jsp"></jsp:include>

                <!-- 본문 -->
                
                <div class="content" style="border: 1px solid brown;">
                    <div class="doc">
                        <div class="wrapper-bbs1" style="border: 1px solid black;">
                            <button>제1열람실</button>
                            <button onclick="location.href='/readingRoom2Rental'" >제2열람실</button>
                        </div>
                        <table border="1">
                        	<tr>
                        		<td>열람실</td>
                        		<td>좌석번호</td>
                        	</tr>
                        	
                        	<!-- 좌석 예약된 경우(0) -->
                        <c:forEach var="readingRoomlist" items="${readingRoomlist}">
                        	<c:if test ="${readingRoomlist.seat_status == '0'}">
                        		<c:set var="status" value="occupied"/>
                        		<c:set var="user_id" value="${readingRoomlist.user_id}"/>
               				</c:if>
               				
               				 <!-- 좌석 비었을 경우(1) -->
               				<c:if test ="${readingRoomlist.seat_status == '1'}">
                        		<c:set var="status" value="vacant"/>
                        		<c:set var="user_id" value="user123"/>
               				</c:if>
               				
               				<c:if test ="${readingRoomlist.user_id == 'user123'}">
               				<c:set var="user_id" value="user123"/>
               				<a href="/mylib/bookingSeat?seat_no=${readingRoomlist.seat_no}&user_id=user123" class="${status}" id="${readingRoomlist.seat_no}">좌석${readingRoomlist.seat_no}</a>
               				</c:if> 
               				
               				
               			<c:if test ="${readingRoomlist.user_id != 'user123'}">
                        		<a href="/mylib/bookingSeat?seat_no=${readingRoomlist.seat_no}&user_id=user123" class="${status}" id="${readingRoomlist.seat_no}">좌석${readingRoomlist.seat_no}${readingRoomlist.user_id}</a>	
               				</c:if> 

                        	
                        </c:forEach>
	                        <tr>
	                        	<td>제2열람실</td>
	                        	<td>test</td>
	                        </tr>
                        	
 						</table>
                     

                    </div>

                </div>

            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
               				

                     
<script>

$(function () {
   
   
   $(".booking_btn").on("click", function(e){
      e.preventDefault();
      
      var seat_no = $(".input_selected_seat_no").val();
                                    
      if(confirm("제1열람실 "+seat_no+"번 좌석을 예약하시겠습니까?")){
         alert("예약완료");
         
         location.href = "/mylib/bookingSeat?seat_no="+seat_no;
      }                           
   })
   
   
});
        
   

</script>

</body>
</html>