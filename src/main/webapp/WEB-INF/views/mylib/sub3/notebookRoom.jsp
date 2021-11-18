<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/mylib/sub3/nbRoom_sb_page.css">
	<link rel="stylesheet" href="/resources/css/mylib/sub3/notebookRoom.css">

   <style>
        .seat-wrapper {
            margin-top: 50px;
        }
    </style>

<title>라온도서관 > 나의 도서관 > 노트북실</title>

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
                            <a href="/mylib/notebookRoom">좌석예약/조회</a>
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
                                <button onclick="#'">제 2열람실</button>
                                <button class="active">노트북실</button>
                                <button>세미나실</button>
                            </div>
                        </div>


						<!-- 좌석 -->
                        <div class=" seat-chart">
                            <div class="seat-wrapper">

                                <div class="line1">
                                	
                                	<!-- 좌석 1 ~ 3 -->
                                    <div class="seat-list" style="width:60px;">
	                                    <c:forEach var="nb" items="${notebookRoomlist}" begin="0" end="2">
	                               			
	                               			<!-- seat_status == 0 => 좌석 예약 불가 (사용 중) -->
	                                    	<c:if test="${nb.seat_status == '0'}">
	                                    		<c:set var="status" value="occupied"/>
	                                    		<c:set var="user_id" value="${nb.user_id}"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- seat_status == 1 => 좌석 예약 가능 -->
	                                    	<c:if test="${nb.seat_status == '1'}">
	                                    		<c:set var="status" value="vacant" />
	                                    		<c:set var="user_id" value="id"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 일치할 시, class name == mine -->
	                                    	<c:if test="${nb.user_id == 'id2'}">
	                                    		<button class="mine" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 불일치할 시, class name == status -->
	                                    		<!-- status => 사용 중이면 occupied || 사용 가능하면 vacant -->
	                                    	<c:if test="${nb.user_id != 'id2'}">
	                                    		<button class="${status}" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    
	                                    </c:forEach>
                                    </div>
                                    
                                    
                                    <!-- 좌석 4~13 -->
                                    <div class="seat-list">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="3" end="12">
                                    	
	                                    	<!-- seat_status == 0 => 좌석 예약 불가 (사용 중) -->
	                                    	<c:if test="${nb.seat_status == '0'}">
	                                    		<c:set var="status" value="occupied"/>
	                                    		<c:set var="user_id" value="${nb.user_id}"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- seat_status == 1 => 좌석 예약 가능 -->
	                                    	<c:if test="${nb.seat_status == '1'}">
	                                    		<c:set var="status" value="vacant" />
	                                    		<c:set var="user_id" value="id"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 일치할 시, class name == mine -->
	                                    	<c:if test="${nb.user_id == 'id2'}">
	                                    		<button class="mine" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 불일치할 시, class name == status -->
	                                    		<!-- status => 사용 중이면 occupied || 사용 가능하면 vacant -->
	                                    	<c:if test="${nb.user_id != 'id2'}">
	                                    		<button class="${status}" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    </c:forEach>
                                    </div>
                                    
                                    
                                    <!-- 좌석 14~21 -->
                                    <div class="seat-list" style="margin-right: 145px;">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="13" end="20">
	                                    	<!-- seat_status == 0 => 좌석 예약 불가 (사용 중) -->
	                                    	<c:if test="${nb.seat_status == '0'}">
	                                    		<c:set var="status" value="occupied"/>
	                                    		<c:set var="user_id" value="${nb.user_id}"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- seat_status == 1 => 좌석 예약 가능 -->
	                                    	<c:if test="${nb.seat_status == '1'}">
	                                    		<c:set var="status" value="vacant" />
	                                    		<c:set var="user_id" value="id"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 일치할 시, class name == mine -->
	                                    	<c:if test="${nb.user_id == 'id2'}">
	                                    		<button class="mine" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 불일치할 시, class name == status -->
	                                    		<!-- status => 사용 중이면 occupied || 사용 가능하면 vacant -->
	                                    	<c:if test="${nb.user_id != 'id2'}">
	                                    		<button class="${status}" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    </c:forEach>
                                    </div>


									<!-- 좌석 22~25 -->
                                    <div class="seat-list">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="21" end="24">
	                                    	<!-- seat_status == 0 => 좌석 예약 불가 (사용 중) -->
	                                    	<c:if test="${nb.seat_status == '0'}">
	                                    		<c:set var="status" value="occupied"/>
	                                    		<c:set var="user_id" value="${nb.user_id}"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- seat_status == 1 => 좌석 예약 가능 -->
	                                    	<c:if test="${nb.seat_status == '1'}">
	                                    		<c:set var="status" value="vacant" />
	                                    		<c:set var="user_id" value="id"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 일치할 시, class name == mine -->
	                                    	<c:if test="${nb.user_id == 'id2'}">
	                                    		<button class="mine" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 불일치할 시, class name == status -->
	                                    		<!-- status => 사용 중이면 occupied || 사용 가능하면 vacant -->
	                                    	<c:if test="${nb.user_id != 'id2'}">
	                                    		<button class="${status}" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    </c:forEach>
                                    </div>


									<!-- 좌석 26~28 -->
                                    <div class="seat-list" style="width:60px; margin-right: 0px;">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="25" end="27">
                                    	
	                                    	<!-- seat_status == 0 => 좌석 예약 불가 (사용 중) -->
	                                    	<c:if test="${nb.seat_status == '0'}">
	                                    		<c:set var="status" value="occupied"/>
	                                    		<c:set var="user_id" value="${nb.user_id}"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- seat_status == 1 => 좌석 예약 가능 -->
	                                    	<c:if test="${nb.seat_status == '1'}">
	                                    		<c:set var="status" value="vacant" />
	                                    		<c:set var="user_id" value="id"/>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 일치할 시, class name == mine -->
	                                    	<c:if test="${nb.user_id == 'id2'}">
	                                    		<button class="mine" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    	
	                                    	<!-- 예약된 좌석의 id와 저장된 session id가 불일치할 시, class name == status -->
	                                    		<!-- status => 사용 중이면 occupied || 사용 가능하면 vacant -->
	                                    	<c:if test="${nb.user_id != 'id2'}">
	                                    		<button class="${status}" id="${nb.seat_no}">${nb.seat_no}</button>
	                                    	</c:if>
	                                    	
	                                    </c:forEach>
                                    </div>

                                </div>

                            </div>
                        </div>




                        <!-- 열람실 테이블 -->
                        <div class="wrapper-table">
                        
                            <!-- 예약 x 테이블 -->
                             <c:if test="${reservation_info == null}">
                            	<input type="hidden" name="user_id" value="id">
                            	<input type="hidden" name="seat_no" value="seat_no" class="input_selected_seat_no">
                            
	                            <table class="seat-info">
	                                <tbody>
	                                    <tr>
	                                        <th>열람실</th>
	                                        <td>노트북실</td>
	                                        <th class="left">좌석 번호</th>
	                                        <td class="selected_seat_no"></td>
	                                    </tr>
	                                </tbody>
	
	                            </table>
	
	                            <button class="reserve_btn booking_btn">예약하기</button>
							</c:if> 

                            <!-- 예약 o 테이블 -->
                            <c:if test="${reservation_info != null}">
                            
                            	<fmt:formatDate var="reg_time" value="${reservation_info.reg_time}" pattern="HH:mm:ss"/>
                            	<fmt:formatDate var="return_time" value="${reservation_info.return_time}" pattern="HH:mm:ss"/>
                            	
                            	<fmt:parseNumber var="diff_hour" value="${reservation_info.diff_time/(1000*60*60)}" integerOnly="true" />
                            	<fmt:parseNumber var="diff_min" value="${reservation_info.diff_time/(1000*60) - diff_hour*60}" integerOnly="true" />
                            	<fmt:parseNumber var="diff_sec" value="${reservation_info.diff_time/1000 - diff_hour*60*60 - diff_min*60}" integerOnly="true" />
	                    		
	                    		<c:if test="${diff_min < 10}">
	                    			<c:set var="diff_min" value="${diff_min}" />
	                    		</c:if>
	                    		
	                    		<c:if test="${diff_sec < 10}">
	                    			<c:set var="diff_sec" value="${diff_sec}" />
	                    		</c:if>
	                    		
	                    		<c:set var="diff_time" value="${diff_hour}:${diff_min}:${diff_sec}" />
	                    		
	                    		<input type="hidden" id="diff_hour" value="${diff_hour}">
								<input type="hidden" id="diff_min" value="${diff_min}">
	                    		
	                            <table class="reserve-info">
	                                <tbody>
	                                    <tr>
	                                        <th>열람실</th>
	                                        <td colspan="2">노트북실</td>
	                                        <th class="left">좌석 번호</th>
	                                        <td colspan="2">
	                                        	${reservation_info.seat_no}
	                                        	<input type="hidden" class="my_seat_no" value="${reservation_info.seat_no}">
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



<script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


<script>

	
	$(function () {
		$(".sub3").addClass("active");
		
		/* 좌석 번호 클릭하기 전, 예약하기 버튼 비활성화 */
		$(".booking_btn").hide(); 
		
		/* class가 occupied(사용 중)인 button은 disabled 속성 사용해 버튼 비활성화 */
	    $(".occupied").prop("disabled", true);
	
		/* class가 vacant(사용 가능)인 seat 누를 시, */
		$(".vacant").on("click", function(e) {
			
			e.preventDefault();
			
			/* .vacant class의 id 속성 값을 가져와 seat_no 변수에 저장 */
			var seat_no = $(this).attr("id"); 
			
			if($(".mine").length){
				
				if(confirm("노트북실 " + seat_no + "번 좌석으로 이동하시겠습니까?")){
					
					alert("이동 완료");

					var mySeat_no = $(".mine").attr("id");
					
					location.href = "/mylib/moveSeat?newSeat_no=" + seat_no + "&seat_no=" + mySeat_no;
				}
				
			}else {
				$(".vacant").css("background-color", "#284d70");
				$(".vacant").css("border", "#4d445b");
				
				/* 좌석 누를 시, css 변환 */
				$(this).css("background-color", "#ff6600");
				$(this).css("border", "#ff6600");
				
				/* 좌석 번호의 값이 내가 선택한(vacant) 좌석의 아이디값이 .selected_seat_no클래스 입력되게 된다.*/
				$(".selected_seat_no").html(seat_no); 
				$(".input_selected_seat_no").val(seat_no);
				
				/* 좌석 번호 클릭 시, 예약하기 버튼 활성화 */
				$(".booking_btn").show();
			}
			
			
		
		});
		
		
		
		/* 좌석 예약 */
		$(".booking_btn").on("click", function(e) {
			
			e.preventDefault();
			
			var seat_no = $(".input_selected_seat_no").val(); 
			
			
 			if(confirm("노트북실 " + seat_no + "번 좌석을 예약하시겠습니까?")){
				
				alert("예약완료");
				
				location.href = "/mylib/nb_seat_booking?seat_no=" + seat_no; 
			} 
			
		});
		
		
		
		/* mine 좌석 click 시, 좌석 반납 */
		$(".mine").on("click", function(e) {
			
			e.preventDefault();
			
			var seat_no = $(this).attr("id");
			
			if(confirm("좌석을 반납하시겠습니까?")){
				
				alert (seat_no + "번 반납완료");
				
				location.href = "/mylib/nb_seat_return?seat_no=" + seat_no;
			}
			
			
		});
		
		/* 퇴실 btn click 시, 좌석 반납 */
		$(".return_btn").on("click", function(e) {
			
			e.preventDefault();
			
			var seat_no = $(".my_seat_no").val();
			
			if(confirm("좌석을 반납하시겠습니까?")){
				
				alert (seat_no + "번 퇴실 완료");
				
				location.href = "/mylib/nb_seat_return?seat_no=" + seat_no;
			}
			
			
		});
		
		
		/* 자리 연장 */
		$(".extend_btn").on("click", function(e) {
			
			e.preventDefault();
			
	      	var diff_hour = $("#diff_hour").val();
	        var diff_min = $("#diff_min").val();
	        var result = diff_hour < 1 && diff_min < 30;
	        /* 30분 이하로만 자리 연장 가능 */
			
			var seat_no = $(".my_seat_no").val();
			
			if(result == false){
				
	            alert("연장 가능한 시간이 아닙니다.");
	            
	         }else{
	        	 
	            if(confirm("좌석을 연장하시겠습니까?")){
	               alert(seat_no+ "번 자리 연장되었습니다.");
	               
	               location.href = "/mylib/nb_seat_extend?seat_no=" + seat_no;
	            }
	         }  
			
			
		});
		
		
	});

</script>
</body>
</html>