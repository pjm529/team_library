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
	<link rel="stylesheet" href="/resources/css/mylib/sub3/myReservationInfo.css">
	<link rel="stylesheet" href="/resources/css/footer.css">
<title>나의 예약 현황</title>
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
                            <a href="/mylib/reservationRoomPage">좌석예약/조회</a>
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
                        <h2>나의 예약 현황</h2>
                        <hr style="border: 1px solid #dadada;">
                        <div class="wrapper-table">
                        
                        
                        
                            <div class="seat-info">
                                <h3>좌석 예약 현황</h3>

                                <div class="reserve-info-btn">
                                    <button class="chk_out_btn" onclick="location.href='#'">퇴실</button>
                                    <button class="renew_btn" onclick="location.href='#'">연장</button>
                                </div>
                                
                                <fmt:formatDate var="reg_time" value="${nbRoom_info.checkin_time}" pattern="HH:mm:ss"/>
                            	<fmt:formatDate var="return_time" value="${nbRoom_info.checkout_time}" pattern="HH:mm:ss"/>
                            	
                            	<fmt:parseNumber var="diff_hour" value="${nbRoom_info.diff_time/(1000*60*60)}" integerOnly="true" />
                            	<fmt:parseNumber var="diff_min" value="${nbRoom_info.diff_time/(1000*60) - diff_hour*60}" integerOnly="true" />
                            	<fmt:parseNumber var="diff_sec" value="${nbRoom_info.diff_time/1000 - diff_hour*60*60 - diff_min*60}" integerOnly="true" />
	                    		
	                    		<c:if test="${diff_min < 10}">
	                    			<c:set var="diff_min" value="${diff_min}" />
	                    		</c:if>
	                    		
	                    		<c:if test="${diff_sec < 10}">
	                    			<c:set var="diff_sec" value="${diff_sec}" />
	                    		</c:if>
	                    		
	                    		<c:set var="diff_time" value="${diff_hour}:${diff_min}:${diff_sec}" />
	                    		
	                    		<input type="hidden" id="diff_hour" value="${diff_hour}">
								<input type="hidden" id="diff_min" value="${diff_min}">
								
                                <table class="seat-reserve-info">
                                    <tbody>
                                        <tr>
                                            <th>열람실</th>
                                            <td>제 1열람실</td>
                                        </tr>
                                        <tr>
                                            <th class="left">좌석 번호</th>
                                            <td>${nbRoom_info.seat_no}</td>
                                        </tr>
                                        <tr>
                                            <th>예약 시간</th>
                                            <td>${nbRoom_info.checkin_time}</td>
                                        </tr>
                                        <tr>
                                            <th class="left">반납 시간</th>
                                            <td>${nbRoom_info.checkout_time}</td>
                                        </tr>
                                        <tr>
                                            <th class="left">잔여 시간</th>
                                            <td>${diff_time}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="info-text">
                                    <span>
                                        &#8251; <b>자리 이동</b>의 경우 열람실 예약 페이지에서 확인 가능
                                    </span>
                                </div>

                            </div>

                            <div class="room-info">
                                <h3>세미나룸 예약 현황</h3>
                                <div class="reserve-info-btn">
                                	<form id="room_delete_form" action="/mylib/smRoom_delete" method="post" onsubmit="return false;">
                                    	<button class="chk_out_btn booking_delete_btn">예약취소</button>
                                    </form>
                                </div>
                                <table class="room-reserve-info">

                                    <tbody>
                                        <tr>
                                            <th>세미나룸</th>
                                            <td colspan="2">${smRoom_info.room_name}</td>
                                        </tr>
                                        <tr>
                                            <th>예약 날짜</th>
                                            <td>${smRoom_info.sm_date}</td>
                                        </tr>
                                        <tr>
                                            <th>예약 시간</th>
                                            <td>
                                            	<c:set var='time' value="${smRoom_info.sm_time}" />
                                            	<c:choose>
                                            		<c:when test="${time == 'A01'}">
                                            			09:00 ~ 10:00
                                            		</c:when>
                                            		<c:when test="${time == 'A02'}">
                                            			09:00 ~ 11:00
                                            		</c:when>
                                            		<c:when test="${time == 'A03'}">
                                            			09:00 ~ 12:00
                                            		</c:when>
                                            		<c:when test="${time == 'B01'}">
                                            			10:00 ~ 11:00
                                            		</c:when>
                                            		<c:when test="${time == 'B02'}">
                                            			10:00 ~ 12:00
                                            		</c:when>
                                            		<c:when test="${time == 'B03'}">
                                            			10:00 ~ 13:00
                                            		</c:when>
                                            		<c:when test="${time == 'C01'}">
                                            			11:00 ~ 12:00
                                            		</c:when>
                                            		<c:when test="${time == 'C02'}">
                                            			11:00 ~ 13:00
                                            		</c:when>
                                            		<c:when test="${time == 'C03'}">
                                            			11:00 ~ 14:00
                                            		</c:when>
                                            		<c:when test="${time == 'D01'}">
                                            			12:00 ~ 13:00
                                            		</c:when>
                                            		<c:when test="${time == 'D02'}">
                                            			12:00 ~ 14:00
                                            		</c:when>
                                            		<c:when test="${time == 'D03'}">
                                            			12:00 ~ 15:00
                                            		</c:when>
                                            		<c:when test="${time == 'E01'}">
                                            			13:00 ~ 14:00
                                            		</c:when>
                                            		<c:when test="${time == 'E02'}">
                                            			13:00 ~ 15:00
                                            		</c:when>
                                            		<c:when test="${time == 'E03'}">
                                            			13:00 ~ 16:00
                                            		</c:when>
                                            		<c:when test="${time == 'F01'}">
                                            			14:00 ~ 15:00
                                            		</c:when>
                                            		<c:when test="${time == 'F02'}">
                                            			14:00 ~ 16:00
                                            		</c:when>
                                            		<c:when test="${time == 'F03'}">
                                            			14:00 ~ 17:00
                                            		</c:when>
                                            		<c:when test="${time == 'G01'}">
                                            			15:00 ~ 14:00
                                            		</c:when>
                                            		<c:when test="${time == 'G02'}">
                                            			15:00 ~ 17:00
                                            		</c:when>
                                            		<c:when test="${time == 'H03'}">
                                            			16:00 ~ 17:00
                                            		</c:when>
                                            	</c:choose>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="info-text">
                                    <span>
                                        &#8251; 1일 1회 최대 3시간 이용 가능(1시간 단위 예약)
                                    </span>
                                    <br>
                                    <span>
                                        &#8251; <b>예약 취소</b>의 경우 나의 예약 현황에서 확인 가능
                                    </span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        
        
    <script>
    	$(function() {
    		$(".sub3").addClass("active");
    		
    		$(".booking_delete_btn").on("click", function(e) {
    			
    			if(confirm("예약을 취소하시겠습니까?")) {
    				alert("예약 취소가 완료되었습니다.");
    				$("#room_delete_form").attr("onsubmit", "return ture;");
    				$("#room_delete_form").submit();
    			}	
    			
    		});
    		
    		
		})
    
    
    </script>

</body>
</html>