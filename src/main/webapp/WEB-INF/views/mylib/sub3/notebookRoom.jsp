<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                                    <div class="seat-list" style="width:60px;">
	                                    <c:forEach var="nb" items="${notebookRoomlist}" begin="0" end="2">
	                                    	<button class=" vacant">${nb.seat_no}</button>
	                                    </c:forEach>
                                    </div>
                                    
                                    <div class="seat-list">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="3" end="12">
	                                    	<button class=" vacant">${nb.seat_no}</button>
	                                    </c:forEach>
                                    </div>

                                    <div class="seat-list" style="margin-right: 145px;">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="13" end="20">
	                                    	<button class=" vacant">${nb.seat_no}</button>
	                                    </c:forEach>
                                    </div>

                                    <div class="seat-list">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="21" end="24">
	                                    	<button class=" vacant">${nb.seat_no}</button>
	                                    </c:forEach>
                                    </div>

                                    <div class="seat-list" style="width:60px; margin-right: 0px;">
                                    	<c:forEach var="nb" items="${notebookRoomlist}" begin="25" end="27">
	                                    	<button class=" vacant">${nb.seat_no}</button>
	                                    </c:forEach>
                                    </div>

                                </div>

                            </div>
                        </div>




                        <!-- 열람실 테이블 -->
                        <div class="wrapper-table">
                            <!-- 예약 x 테이블 -->
                            <table class="seat-info">
                                <tbody>
                                    <tr>
                                        <th>열람실</th>
                                        <td>제 1열람실</td>
                                        <th class="left">좌석 번호</th>
                                        <td>52번</td>
                                    </tr>
                                </tbody>

                            </table>

                            <button class="reserve_btn" onclick="location.href='#'">예약하기</button>


                            <!-- 예약 o 테이블 -->
                            <table class="reserve-info">
                                <tbody>
                                    <tr>
                                        <th>열람실</th>
                                        <td colspan="2">제 1열람실</td>
                                        <th class="left">좌석 번호</th>
                                        <td colspan="2">52번</td>
                                    </tr>
                                    <tr>
                                        <th>예약 시간</th>
                                        <td>18:11:45</td>
                                        <th class="left">반납 시간</th>
                                        <td>18:11:45</td>
                                        <th class="left">잔여 시간</th>
                                        <td>18:11:45</td>
                                    </tr>
                                </tbody>

                            </table>
                            <div class="reserve-info-btn">
                                <button class="chk_out_btn" onclick="location.href='#'">퇴실</button>
                                <button class="renew_btn" onclick="location.href='#'">연장</button>
                            </div>


                        </div>


                    </div>

                </div>

            </div>

        </div>

    </div>



    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


    <script>

        // class가 occupied인 button은 disabled 속성 사용해 버튼 비활성화
        $(function () {
            $(".occupied").prop("disabled", true);

        });

    </script>
</body>
</html>