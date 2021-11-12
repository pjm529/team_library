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
<link rel="stylesheet" href="/resources/css/mylib/sub1/room.css">
<style>
.seat-list-row {
	width: 100%;
	max-width: 100%;
	}

.line1 {
	margin-bottom: 0px;
    }
</style>
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
                    <div class="doc">

                        <div class="room-list">
                            <div class="list-btn">
                                <button onclick="#'">제 1열람실</button>
                                <button class="active" onclick="location.href='/mylib/readingRoom2Rental'">제 2열람실</button>
                                <button onclick="location.href='/mylib/room2'">노트북실</button>
                                <button>세미나실</button>
                            </div>
                        </div>


                        <div class=" seat-chart">
                            <div class="seat-wrapper">
                                <div class="line1">
                                	<div class="seat-list-row">
                                		<c:forEach var="readingRoomlist" items="${readingRoomlist}">
                                
		                                	<!-- 좌석 예약된 상태 status(0) occupied -->
		                                	<c:if test="${readingRoomlist.seat_status == '0'}">
		                                    	<c:set var="status" value="occupied"/>
		                                        <c:set var="user_id" value="${readingRoomlist.user_id}"/>
		                                    </c:if>
		                                    
		                                    <!-- 좌석 예약가능한 상태 status(1) vacant -->
		                                	<c:if test="${readingRoomlist.seat_status == '1'}">
		                                    	<c:set var="status" value="vacant"/>
		                                        <c:set var="user_id" value="user123"/>
		                                    </c:if>
		                                    
		                                    <!-- 예약된 좌석의 user_id가 sessionId와 일치하면 class를 mine으로 설정 -->
                                       		<c:if test="${readingRoomlist.user_id == 'user123'}">
                                          		<button class="mine" id="${readingRoomlist.seat_no}">${readingRoomlist.seat_no}</button>
                                       		</c:if>
                                       
                                       <!-- 예약된 좌석의 user_id가 sessionId와 일치하지 않을 경우 -->
                                       <c:if test="${readingRoomlist.user_id != 'user123'}">
                                          <button class="${status}" id="${readingRoomlist.seat_no}">${readingRoomlist.seat_no}</button>
                                       </c:if>	  
		                                </c:forEach>
		                             </div>    
                                </div>
                                

                    <%--             <div class="line2">
                                    <div class="seat-list" style="height: 120px; overflow: hidden;">
	                                    <c:forEach var="readingRoomlist" items="${readingRoomlist}">
	                                    <!-- 좌석 예약된 상태 status(0) occupied -->
		                                	<c:if test="${readingRoomlist.seat_status == '0'}">
		                                    	<c:set var="status" value="occupied"/>
		                                        <c:set var="user_id" value="${readingRoomlist.user_id}"/>
		                                    </c:if>
		                                    
		                                    <!-- 좌석 예약가능한 상태 status(1) vacant -->
		                                	<c:if test="${readingRoomlist.seat_status == '1'}">
		                                    	<c:set var="status" value="vacant"/>
		                                        <c:set var="user_id" value="user123"/>
		                                    </c:if>
		                                    
		                                    <!-- 예약된 좌석의 user_id가 sessionId와 일치하면 class를 mine으로 설정 -->
                                       		<c:if test="${readingRoomlist.user_id == 'user123'}">
                                          		<button class="mine" id="${readingRoomlist.seat_no}">${readingRoomlist.seat_no}</button>
                                       		</c:if>
                                       
                                       <!-- 예약된 좌석의 user_id가 sessionId와 일치하지 않을 경우 -->
                                       <c:if test="${readingRoomlist.user_id != 'user123'}">
                                          <button class="${status}" id="${readingRoomlist.seat_no}">${readingRoomlist.seat_no}</button>
                                       </c:if>	  
	                                    </c:forEach>
                                     
                                   </div> --%>
                        
                                </div>

                            
                            </div>
                        </div>


                        <!-- 열람실 테이블 -->
                        <div class="wrapper-table">
                        
  	                  <c:if test="{readingRoomlist.user_id == 'user123'}">   
                            <!-- 예약 x 테이블 -->
                            <input type="hidden" name="seat_no" value="seat_no" class="input_selected_seat_no">
                            
                            
                            <table class="seat-info">
                                <tbody>
                                    <tr>
                                        <th>열람실</th>
                                        <td>제 2열람실</td>
                                        <th class="left">좌석번호</th>
                                        <td class="selected_seat_no"></td>
                                    </tr>
                                </tbody>

                            </table>

                            <button class="reserve_btn">예약하기</button>
					</c:if> 

					<c:if test="{readingRoomlist.user_id == 'user123'}"> 
                            <!-- 예약 o 테이블 -->
                            <table class="reserve-info">
                                <tbody>
                                    <tr>
                                        <th>열람실</th>
                                        <td colspan="2">제 2열람실</td>
                                        <th class="left">좌석 번호</th>
                                        <td colspan="2">test</tdd>
                                    </tr>
                                    <tr>
                                        <th>예약 시간</th>
                                        
                                        <td>{readingRoomlist.reg_time}</td>
                                        
                                        <th class="left">반납 시간</th>
                                        <td>{readingRoomlist.return_time}</td>
                                        <th class="left">잔여 시간</th>
                                        <td>test</td>
                                    </tr>
                                </tbody>

                            </table>
                            <div class="reserve-info-btn">
                                <button class="chk_out_btn" onclick="location.href='#'">퇴실</button>
                                <button class="renew_btn" onclick="location.href='#'">연장</button>
                            </div>
						</c:if>

                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function() {
		
		$(".sub3").addClass("active");
 
        $(".occupied").prop("disabled", true);  /* class가 occupied인 button은 disabled 속성 사용해 버튼 비활성화 */

		$(".vacant").on("click", function() {
			var seat_no = $(this).attr("id");/* a태그 vacant클래스의 아이디값, this는 $(".vacant")의미함 */	
			
			$(".selected_seat_no").html(seat_no); /* 좌석 번호의 값이 내가 선택한(vacant) 좌석의 아이디값이 .selected_seat_no클래스 입력되게 된다.*/
			$(".input_selected_seat_no").val(seat_no);
			
	
		})
		
		$(".reserve_btn").on("click", function(e) {  
			
			e.preventDefault();
			
			/* <input type="hidden" name="seat_no" value="seat_no" class="input_selected_seat_no"> 값을 가져온다 */
		 	var seat_no = $(".input_selected_seat_no").val(); 

			if(confirm(seat_no +"번 좌석을 예약하시겠습니까?")){
						
				location.href = "/mylib/bookingSeat2?seat_no="+seat_no; 
				
				alert("예약완료");
			
			}
			
		})
		
		$(".chk_out_btn").on("click", function(e) {
			
			e.preventDefault();
			
			var seat_no =$("")
			
		})
       
		
		/* 
		var moveForm = $(".moveForm");
		
		$(".vacant").on("click", function(e) {
			e.preventDefault();
			
			var seat_no = $(this).attr("id"); /* a태그 vacant클래스의 아이디값, this는 $(".vacant")의미함 */	
			/* var user_id = $("#user_id").val(); */ /* 추후에 세션 아이디로 바꾸기 */
/* 	 		if(confirm(seat_no+"번 좌석을 예약하시겠습니까?")){
				
				moveForm.attr("action", "/mylib/bookingSeat2");  컨트롤러 
				 moveForm.find("input[name=seat_no]").val(111);
			 	moveForm.submit(); 
				/ $(this).attr("class", "mine"); 
				alert("예약완료");
			}  
			
			

			
		}) */ 
		
		
	})
 
</script> 
</body>
</html>