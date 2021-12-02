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
	<link rel="stylesheet" href="/resources/css/mylib/sub3/reservationRoomPage.css">
	<link rel="stylesheet" href="/resources/css/mylib/sub3/calendar.css">
	<link rel="stylesheet" href="/resources/css/footer.css">
<title>라온도서관 > 나의 도서관 > 좌석예약/조회</title>

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

                        <!-- 나의 예약 현황 btn -->
                        <div style="padding: 15px;">
                            <div class="my-booking-status">
                                <button class="my_info_btn" onclick="my_info_btn();">나의 예약현황</button>
                            </div>

                            <div class="room-seat">
                                <h3>좌석배정</h3>
                                <table class="seat-info">
                                    <thead>
                                        <tr>
                                            <th>명칭</th>
                                            <th>전체</th>
                                            <th class="align-right">잔여좌석</th>
                                            <th>사용율</th>
                                            <th> </th>
                                            <th>운영상태</th>
                                            <th> </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="room-name">제 1열람실</td>
                                            <td class="align-center">54</td>
                                            <td class="align-right">${rd1Room_usingSeat}</td>
                                            <td class="progress">
                                                <progress value="${rd1Room_usedSeat}" max="54"></progress>
                                            </td>
                                            <td class="percent">
                                            	<div id="rd1UsedSeat"></div>
                                            	</td>
                                            <td>운영중</td>
                                            <td>
                                                <button class="room-go-btn"  onclick="rdRoom();">상세</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="room-name">제 2열람실</td>
                                            <td class="align-center">42</td>
                                            <td class="align-right">${rd2Room_usingSeat}</td>
                                            <td class="progress">
                                                <progress value="${rd2Room_usedSeat}" max="100"></progress>
                                            </td>
                                            <td class="percent">
                                            	<div id="rd2UsedSeat"></div>
                                            </td>
                                            <td>운영중</td>
                                            <td>
                                                <button class="room-go-btn" onclick="rdRoom2();">상세</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="room-name">노트북실</td>
                                            <td class="align-center">28</td>
                                            <td class="align-right">${nbRoom_usingSeat}</td>
                                            <td class="progress">
                                                <progress value="${nbRoom_usedSeat}" max="28"></progress>
                                            </td>
                                            <td class="percent">
                                            	<div id="nbUsedSeat"></div>
                                            </td>
                                            <td>운영중</td>
                                            <td>
                                                <button class="room-go-btn" onclick="nbRoom();">상세</button>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                                <div class="calendar">
                                    <h3>세미나실</h3>
                                    <div class="header">
                                        <div class="nav">
                                            <button class="nav-btn go-prev" onclick="prevMonth();">&lt;</button>
                                            <button class="nav-btn go-next" onclick="nextMonth();">&gt;</button>
                                        </div>
                                        <div class="year-month"></div>
                                        <div class="nav">
                                            <button class="nav-btn go-today" onclick="goToday();">오늘</button>
                                        </div>
                                    </div>

                                    <div class="main">
                                        <div class="days">
                                            <div class="day">일</div>
                                            <div class="day">월</div>
                                            <div class="day">화</div>
                                            <div class="day">수</div>
                                            <div class="day">목</div>
                                            <div class="day">금</div>
                                            <div class="day line-none">토</div>
                                        </div>
                                        <div class="dates"></div>
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
    
    </div>



    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <script src="/resources/js/mylib/sub3/ReservationRoomPage.js"></script>



	<script>
	$(document).ready(function() {
		
		var usedSeat = "<c:out value='${nbRoom_usedSeat}'/>";
		var percent = (usedSeat/28) * 100;
		$('#nbUsedSeat').html(percent.toFixed(0) + "%");
		
		var rd1_usedSeat = "<c:out value='${rd1Room_usedSeat}'/>";
		var rd1_percent = (rd1_usedSeat/28) * 100;
		$('#rd1UsedSeat').html(rd1_percent.toFixed(0) + "%");
		
		var rd2_usedSeat = "<c:out value='${rd2Room_usedSeat}'/>";
		var rd2_percent = (rd2_usedSeat/28) * 100;
		$('#rd2UsedSeat').html(rd2_percent.toFixed(0) + "%");
		
	}); 
	</script>

</body>
</html>