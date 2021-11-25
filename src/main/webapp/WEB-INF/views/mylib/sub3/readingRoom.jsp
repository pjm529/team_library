<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 나의 도서관 > 좌석예약/조회</title>
	<link rel="stylesheet" href="/resources/css/mylib/sub3/readingRoom1_sb_page.css">
	<link rel="stylesheet" href="/resources/css/mylib/sub3/readingRoom1.css">

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
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">나의 도서관</a>
                        </li>
                        <li>
                            <a href="/mylib/readingRoom">좌석예약/조회</a>
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
                    <div class="doc">

                        <div class="room-list">
                            <div class="list-btn">
                                <button onclick="rdRoom();">제 1열람실</button>
                                <button onclick="rdRoom2();">제 2열람실</button>
                                <button class="active" onclick="nbRoom();">노트북실</button>
                                <button>세미나실</button>
                            </div>
                        </div>
                

                        <div class="seat-chart">
                            <div class="seat-wrapper">
								<div class="line1">
                                    <div class="seat-list">
                                    <c:forEach var="seatsList" items="${seatsList}" begin="0" end="9">
                                    	
                                    	<c:if test="${seatsList.seat_status == '0'}">
                                    		<c:set var="status" value="occupied"/>
                                    		<c:set var="user_id" value="${seatsList.user_id}"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.seat_status == '1'}">
                                    		<c:set var="status" value="vacant"/>
                                    		<c:set var="user_id" value="khi29"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id == 'khi29'}">
                                    		<button class="mine" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id != 'khi29'}">
                                    		<button class="${status}" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    
                                    </c:forEach>
                                    </div>
                                    
                                    <div class="seat-list">
                                    <c:forEach var="seatsList" items="${seatsList}" begin="10" end="19">
                                    	
                                    	<c:if test="${seatsList.seat_status == '0'}">
                                    		<c:set var="status" value="occupied"/>
                                    		<c:set var="user_id" value="${seatsList.user_id}"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.seat_status == '1'}">
                                    		<c:set var="status" value="vacant"/>
                                    		<c:set var="user_id" value="khi29"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id == 'khi29'}">
                                    		<button class="mine" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id != 'khi29'}">
                                    		<button class="${status}" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    </c:forEach>
                                    </div>
                                    
                                    <div class="seat-list" style="height: 180px; overflow: hidden;">
                                    <c:forEach var="seatsList" items="${seatsList}" begin="20" end="27">
                                    	
                                    	<c:if test="${seatsList.seat_status == '0'}">
                                    		<c:set var="status" value="occupied"/>
                                    		<c:set var="user_id" value="${seatsList.user_id}"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.seat_status == '1'}">
                                    		<c:set var="status" value="vacant"/>
                                    		<c:set var="user_id" value="khi29"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id == 'khi29'}">
                                    		<button class="mine" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id != 'khi29'}">
                                    		<button class="${status}" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    </c:forEach>
                                    </div>
                                    
                                    <div class="seat-list">
                                    <c:forEach var="seatsList" items="${seatsList}" begin="28" end="37">
                                    	
                                    	<c:if test="${seatsList.seat_status == '0'}">
                                    		<c:set var="status" value="occupied"/>
                                    		<c:set var="user_id" value="${seatsList.user_id}"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.seat_status == '1'}">
                                    		<c:set var="status" value="vacant"/>
                                    		<c:set var="user_id" value="khi29"/>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id == 'khi29'}">
                                    		<button class="mine" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    	
                                    	<c:if test="${seatsList.user_id != 'khi29'}">
                                    		<button class="${status}" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
                                    	</c:if>
                                    
                                    </c:forEach>
                                    </div>
                                 </div>
                                  
                                    
								<div class="line2">
									<div class="seat-list-row">
									<c:forEach var="seatsList" items="${seatsList}" begin="38" end="53">
									
										<c:if test="${seatsList.seat_status == '0'}">
											<c:set var="status" value="occupied"/>
											<c:set var="user_id" value="${seatsList.user_id}"/>
										</c:if>
									
										<c:if test="${seatsList.seat_status == '1'}">
											<c:set var="status" value="vacant"/>
											<c:set var="user_id" value="khi29"/>
										</c:if>
									
										<c:if test="${seatsList.user_id == 'khi29'}">
											<button class="mine" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
										</c:if>
									
										<c:if test="${seatsList.user_id != 'khi29'}">
											<button class="${status}" id="${seatsList.seat_no}">${seatsList.seat_no}</button>
										</c:if>
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
                            <!-- </form> -->
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
							
							<input type="hidden" id="diff_hour" value="${diff_hour}">
							<input type="hidden" id="diff_min" value="${diff_min}">
						
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
                                        
                                        <c:choose>
                                        	<c:when test="${diff_hour < 1 && diff_min < 30}">
                                        		<td style="color: red; font-weight: bold;">${diff_time}</td>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<td style="color: blue; font-weight: bold;">${diff_time}</td>
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                        
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
	
	/* $("#10").after("</div><div class='seat-list'>");
	$("#20").after("</div><div class='seat-list' style='height: 180px; overflow: hidden;'>");
	$("#28").after("</div><div class='seat-list'>");
	$("#38").after("</div></div><div class='line2'><div class='seat-list-row'>"); */
	
	
	
	
	// class가 occupied인 button은 disabled 속성 사용해 버튼 비활성화
	$(".occupied").prop("disabled", true);
	
	$(".sub3").addClass("active");
	
	$(".booking_btn").hide();
	
	
	
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
		
		if($(".mine").length){
			
			if(confirm("제1열람실 "+seat_no+"번 좌석으로 이동하시겠습니까?")){
				
				alert("이동 완료");

				var mySeat_no = $(".mine").attr("id");
				
				location.href = "/mylib/moveSeat?newSeat_no="+seat_no+"&seat_no="+mySeat_no;
			}
			
		}else{

			$(".vacant").css("background-color", "#284d70");
			$(".vacant").css("border", "#4d445b");
			
			$(this).css("background-color", "#ff6600");
			$(this).css("border", "#ff6600");
						
			$(".selected_seat_no").html(seat_no);
			$(".input_selected_seat_no").val(seat_no);
			
			$(".booking_btn").show();
			
		}
		
	})
	
	
	$(".booking_btn").on("click", function(e){
		e.preventDefault();
		
		var seat_no = $(".input_selected_seat_no").val();
												
		if(confirm("제1열람실 "+seat_no+"번 좌석을 예약하시겠습니까?")){
			
			alert("예약 완료");
			
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
		
		var diff_hour = $("#diff_hour").val();
		var diff_min = $("#diff_min").val();
		var result = diff_hour < 1 && diff_min < 30;
		
		var seat_no = $(".my_seat_no").val();
		
		if(result == false){
			alert("연장 가능한 시간이 아닙니다.");
			
		}else{
			if(confirm("좌석을 연장하시겠습니까?")){
				alert(seat_no+"번 자리 연장 완료~~");
				
				location.href = "/mylib/extendSeat?seat_no="+seat_no;
			}
		}									
											
	})
	
});

function rdRoom(){
	location.href = "/mylib/readingRoom";
}
 
function rdRoom2(){
	location.href = "/mylib/readingRoom2";
}
 
function nbRoom(){
	location.href = "/mylib/notebookRoom";
}

        
	

</script>

</body>
</html>
