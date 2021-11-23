<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의 도서관 > 제2열람실</title>
<link rel="stylesheet" href="/resources/css/mylib/sub3/sb_page.css">
<link rel="stylesheet" href="/resources/css/mylib/sub3/readingRoom2.css">
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
                    <h3>좌석예약/조회</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">나의 도서관</a>
                        </li>
                        <li>
                            <a href="/mylib/readingRoom2">좌석예약/조회</a>
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
                                <button onclick="#">제 1열람실</button>
                                <button class="active" onclick="location.href='/mylib/readingRoom2'">제 2열람실</button>
                                <button>노트북실</button>
                                <button>세미나실</button>
                            </div>
                        </div>


                        <div class=" seat-chart">
                            <div class="seat-wrapper">
                                <div class="line1">
                                    <div class="seat-list-row">
                                       <c:forEach var="readingRoomlist" items="${readingRoomlist}" begin="0" end="9">
                                
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

                                <div class="line2">
                                    <div class="seat-list" style="height: 120px; overflow: hidden;">
                                       <c:forEach var="readingRoomlist" items="${readingRoomlist}" begin="10" end="13">
                                
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

                                     <div class="seat-list">
                                       <c:forEach var="readingRoomlist" items="${readingRoomlist}" begin="14" end="19">
                                
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

                                    <div class="seat-list">
                                    </div>

                                    <div class="seat-list">
                                       <c:forEach var="readingRoomlist" items="${readingRoomlist}" begin="20" end="25">
                                
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

                                    <div class="seat-list" style="margin-right: 0;">
                                    	<c:forEach var="readingRoomlist" items="${readingRoomlist}" begin="26" end="31">
                                
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


                                <div class="line3">
                                    <div class="seat-list-row">
                                        <c:forEach var="readingRoomlist" items="${readingRoomlist}" begin="32" end="41">
                                
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
                            </div>
                        </div>


                        <!-- 열람실 테이블 -->
                        <div class="wrapper-table">
                            <!-- 예약 x 테이블 -->
                            <c:if test="${room2_info == null}">
	                            <input type="hidden" name="user_id" value="user123">
	                            <input type="hidden" name="seat_no" value="seat_no" class="input_selected_seat_no"> 
	                            
	                            <table class="seat-info">
	                                <tbody>
	                                    <tr>
	                                        <th>열람실</th>
	                                        <td>제 2열람실</td>
	                                        <th class="left">좌석 번호</th>
	                                        <td class="selected_seat_no"></td>
	                                    </tr>
	                                </tbody>
	
	                            </table>

                            	<button class="reserve_btn booking_btn">예약하기</button>
							</c:if>

                            <!-- 예약 o 테이블 -->
                            <c:if test="${room2_info != null}">
                            
	                            <fmt:formatDate var="reg_time" value="${room2_info.reg_time}" pattern="HH:mm:ss"/>
	                            <fmt:formatDate var="return_time" value="${room2_info.return_time}" pattern="HH:mm:ss"/>
	                            
	                            <fmt:parseNumber var="diff_hour" value="${room2_info.diff_time/(1000*60*60)}" integerOnly="true"/>
	                    		<fmt:parseNumber var="diff_min" value="${room2_info.diff_time/(1000*60) - diff_hour*60}" integerOnly="true"/>
	                    		<fmt:parseNumber var="diff_sec" value="${room2_info.diff_time/1000 - diff_hour*60*60 - diff_min*60}" integerOnly="true"/>
	                            
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
	                                        <td colspan="2">제 2열람실</td>
	                                        <th class="left">좌석 번호</th>
	                                        
	                                        <td colspan="2">
	                                        	${room2_info.seat_no}
	                                        	<input type="hidden" class="my_seat_no" value="${room2_info.seat_no}">       
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
	                                <button class="chk_out_btn return_btn">퇴실</button>
	                                <button class="renew_btn extend_btn">연장</button>
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
		
		/*좌석번호 클릭하기 전까지 나타지않도록 */
		$(".booking_btn").hide(); 
 		
		/* class가 occupied인 button은 disabled 속성 사용해 버튼 비활성화 */
        $(".occupied").prop("disabled", true);  
             
		
        $(".vacant").on("click", function(e) {
			
			e.preventDefault();

			var seat_no = $(this).attr("id");/* a태그 vacant클래스의 아이디값, this는 $(".vacant")의미함 */	
			
			if($(".mine").length){
				 
				if(confirm("제2열람실 "+seat_no+"번 좌석으로 이동하시겠습니까?")){
					
					alert("이동 완료");

		            var mySeat_no = $(".mine").attr("id");
		            
		            location.href = "/mylib/moveSeat2?newSeat_no="+seat_no+"&seat_no="+mySeat_no;
			}
				 
			
		 }else{

	         $(".vacant").css("background-color", "#284d70");
	         $(".vacant").css("border", "#4d445b");
	         
	         $(this).css("background-color", "#ff6600");
	         $(this).css("border", "#ff6600");


			$(".selected_seat_no").html(seat_no); /* 좌석 번호의 값이 내가 선택한(vacant) 좌석의 아이디값이 .selected_seat_no클래스 입력되게 된다.*/
			$(".input_selected_seat_no").val(seat_no);
			
			$(".booking_btn").show();
			
		 }
	
		})
		
		/* 좌석예약  */
		$(".booking_btn").on("click", function(e) {  
			
			e.preventDefault();
			
			/* <input type="hidden" name="seat_no" value="seat_no" class="input_selected_seat_no"> 값을 가져온다 */
		 	var seat_no = $(".input_selected_seat_no").val(); 

			if(confirm("제2열람실 "+seat_no+"번 좌석을 예약하시겠습니까?")){
								
				alert("예약완료");
				
				location.href = "/mylib/room2_booking?seat_no="+seat_no; 
				
			}
			
		})
		
		$(".mine").on("click", function(e) {
			
			e.preventDefault();
			
			var seat_no =$(this).attr("id");
			
			if(confirm("좌석을 반납하시겠습니까?")){
				
				alert(seat_no +"번 반납완료")
				
				location.href = "/mylib/room2_delete?seat_no="+seat_no;
			
			}
			
		}) 
		
		 $(".return_btn").on("click", function(e){
      		e.preventDefault();
      
		    var seat_no = $(".my_seat_no").val();
		                                    
		    if(confirm("좌석을 반납하시겠습니까?")){
		         alert(seat_no+"번 자리 퇴실 완료");
		         
		         location.href = "/mylib/room2_delete?seat_no="+seat_no;
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
	               
	               location.href = "/mylib/room2_extend?seat_no="+seat_no;
	            }
	         }    
		
		
		
	})
	
	});
 
</script> 
</body>
</html>