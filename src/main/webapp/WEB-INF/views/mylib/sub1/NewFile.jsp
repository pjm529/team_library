<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 나의 도서관 > 열람실</title>
   <link rel="stylesheet" href="/resources/css/sb_page.css">
   <link rel="stylesheet" href="/resources/css/readingRoom.css">

</head>
<body>
    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>좌석예약/조회</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">나의 도서관</a>
                        </li>
                        <li>
                            <a href="#">좌석예약/조회</a>
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
                <div class="content">
                    <div class="doc" style="border: 1px solid brown;">

                        <div class="room-list">
                            <div class="list-btn">
                                <button class="active">제 1열람실</button>
                                <button>제 2열람실</button>
                                <button>노트북실</button>
                                <button>세미나실</button>
                            </div>
                        </div>


                        <div class="seat-chart">
                            <div class="seat-wrapper">
                                <div class="line1">
                                    <div class="seat-list">
                                    <c:forEach var="seatsList" items="${seatsList}">
                                       
                                       <!-- 좌석이 예약된 상태면 status는 occupied -->
                                       <c:if test="${seatsList.seat_status == '0'}">
                                          <c:set var="status" value="occupied"/>
                                          <c:set var="user_id" value="${seatsList.user_id}"/>
                                       </c:if>
                                       
                                       <!-- 좌석이 빈 상태면 status는 vacant -->
                                       <c:if test="${seatsList.seat_status == '1'}">
                                          <c:set var="status" value="vacant"/>
                                          <c:set var="user_id" value="khi29"/>
                                       </c:if>
                                       
                                       <!-- 예약된 좌석의 user_id가 sessionId와 일치하면 class를 mine으로 설정 -->
                                       <c:if test="${seatsList.user_id == 'khi29'}">
                                          <button class="mine" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                       </c:if>
                                       
                                       <!-- 예약된 좌석의 user_id가 sessionId와 일치하지 않을 경우 -->
                                       <c:if test="${seatsList.user_id != 'khi29'}">
                                          <button class="${status}" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                       </c:if>
                                    
                                       <%-- <form action="#" method="post" class="moveForm">
                                 <input type="hidden" name="seat_no" value="${seatsList.seat_no}">
                                 <input type="hidden" name="user_id" value="khi29">
                              </form>
                                         --%>
                                    </c:forEach>
                                    </div>
                                    

                                </div>
                            </div>
                        </div>




                        <!-- 열람실 테이블 -->
                        <div class="wrapper-table">
                            <!-- 예약 x 테이블 -->
                            <c:if test="${mySeatInfo == null}">
                            <input type="hidden" name="user_id" value="khi29">
                            <input type="hidden" name="seat_no" value="seat_no" class="input_selected_seat_no">
                            
                            <!-- <form action="/mylib/bookingSeat" method="post" class="bookingForm">
                     <input type="text" name="user_id" value="khi29">
                     <input type="text" name="seat_no" value="seat_no" class="input_selected_seat_no"> -->
                                                        
                            <table class="seat-info">
                                <tbody>
                                    <tr>
                                        <th>열람실</th>
                                        <td>제 1열람실</td>
                                        <th class="left">좌석 번호</th>
                                        <td class="selected_seat_no"></td>
                                    </tr>
                                </tbody>

                            </table>

                            <button class="reserve_btn booking_btn">예약하기</button>
                            </form>
                            </c:if>


                            <!-- 예약 o 테이블 -->
                            <c:if test="${mySeatInfo != null}">
                            
                            <fmt:formatDate var="reg_time" value="${mySeatInfo.reg_time}" pattern="HH:mm:ss"/>
                            <fmt:formatDate var="return_time" value="${mySeatInfo.return_time}" pattern="HH:mm:ss"/>
                            
                            <fmt:parseNumber var="diff_hour" value="${mySeatInfo.diff_time/(1000*60*60)}" integerOnly="true"/>
                     <fmt:parseNumber var="diff_min" value="${mySeatInfo.diff_time/(1000*60) - diff_hour*60}" integerOnly="true"/>
                     <fmt:parseNumber var="diff_sec" value="${mySeatInfo.diff_time/1000 - diff_hour*60*60 - diff_min*60}" integerOnly="true"/>
                  
                     <c:if test="${diff_min < 10}">
                     <c:set var="diff_min" value="0${diff_min}"></c:set>
                     </c:if>
                     
                     <c:if test="${diff_sec < 10}">
                        <c:set var="diff_sec" value="0${diff_sec}"></c:set>
                     </c:if>
                     
                     <c:set var="diff_time" value="${diff_hour}:${diff_min}:${diff_sec}"></c:set>
                  
                            <table class="reserve-info">
                                <tbody>
                                    <tr>
                                        <th>열람실</th>
                                        <td colspan="2">제 1열람실</td>
                                        <th class="left">좌석 번호</th>
                                        <td colspan="2">
                                           ${mySeatInfo.seat_no}
                                           <input type="hidden" class="my_seat_no" value="${mySeatInfo.seat_no}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>예약 시간</th>
                                        <td class="reg_time">${reg_time}</td>
                                        <th class="left">반납 시간</th>
                                        <td class="return_time">${return_time}</td>
                                        <th class="left">잔여 시간</th>
                                        <td>${diff_time}</td>
                                    </tr>
                                </tbody>

                            </table>
                            <div class="reserve-info-btn">
                                <button class="chk_out_btn return_btn" onclick="location.href='#'">퇴실</button>
                                <button class="renew_btn extend_btn" onclick="location.href='#'">연장</button>
                            </div>
                            
                            </c:if>


                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

<script src="https://code.jquery.com/jquery-3.6.0.js"integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

$(function () {
   
   // class가 occupied인 button은 disabled 속성 사용해 버튼 비활성화
   $(".occupied").prop("disabled", true);
   
   $(".sub3").addClass("active");
   
   $(".booking_btn").hide();
   
   
/*    var moveForm = $(".moveForm");
   var bookingForm = $(".bookingForm"); */
   
   /* $(".mine").on("click", function(e){
      e.preventDefault();
                                    
      var seat_no = $(this).attr("id");
      var user_id = "khi29";
                                    
      if(confirm("좌석을 반납하시겠습니까?")){
         alert("반납완료");
                                                                     
         moveForm.find("input[name = 'seat_no']").val(seat_no);
         moveForm.attr("action", "/mylib/returnSeat");
         moveForm.submit();
      }                           
   })  */
   
   $(".mine").on("click", function(e){
      e.preventDefault();
                                    
      var seat_no = $(this).attr("id");
                                    
      if(confirm("좌석을 반납하시겠습니까?")){
         alert("반납완료");
         
         location.href = "/mylib/returnSeat?seat_no="+seat_no;
      }                           
   })
   
   
   $(".vacant").on("click", function(e){
      e.preventDefault();
                                    
      var seat_no = $(this).attr("id");
      
      $(".selected_seat_no").html(seat_no);
      $(".input_selected_seat_no").val(seat_no);
      
      $(".booking_btn").show();
   })
   
   
   $(".booking_btn").on("click", function(e){
      e.preventDefault();
      
      var seat_no = $(".input_selected_seat_no").val();
                                    
      if(confirm("제1열람실 "+seat_no+"번 좌석을 예약하시겠습니까?")){
         alert("예약완료");
         
         location.href = "/mylib/bookingSeat?seat_no="+seat_no;
      }                           
   })
   
   $(".return_btn").on("click", function(e){
      e.preventDefault();
      
      var seat_no = $(".my_seat_no").val();
                                    
      if(confirm("좌석을 반납하시겠습니까?")){
         alert(seat_no+"번 자리 퇴실 완료~~");
         
         location.href = "/mylib/returnSeat?seat_no="+seat_no;
      }                           
   })
   
   $(".extend_btn").on("click", function(e){
      e.preventDefault();
      
      var seat_no = $(".my_seat_no").val();
                                    
      if(confirm("좌석을 연장하시겠습니까?")){
         alert(seat_no+"번 자리 연장 완료~~");
         
         location.href = "/mylib/extendSeat?seat_no="+seat_no;
      }                           
   })
   
   
});
        
   

</script>

</body>
</html>