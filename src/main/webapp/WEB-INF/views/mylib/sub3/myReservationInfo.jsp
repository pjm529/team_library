<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                                <table class="seat-reserve-info">
                                    <tbody>
                                        <tr>
                                            <th>열람실</th>
                                            <td>제 1열람실</td>
                                        </tr>
                                        <tr>
                                            <th class="left">좌석 번호</th>
                                            <td>18</td>
                                        </tr>
                                        <tr>
                                            <th>예약 시간</th>
                                            <td>18:11:45</td>
                                        </tr>
                                        <tr>
                                            <th class="left">반납 시간</th>
                                            <td>18:11:45</td>
                                        </tr>
                                        <tr>
                                            <th class="left">잔여 시간</th>
                                            <td>18:11:45</td>
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
                                    <button class="chk_out_btn" onclick="location.href='#'">예약취소</button>
                                </div>
                                <table class="room-reserve-info">

                                    <tbody>
                                        <tr>
                                            <th>세미나룸</th>
                                            <td colspan="2">세미나룸 1</td>
                                            <th>예약 날짜</th>
                                            <td>18:11:45</td>
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
		})
    
    
    </script>

</body>
</html>