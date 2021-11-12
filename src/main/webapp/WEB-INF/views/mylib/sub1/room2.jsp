<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                            <a href="#">좌석예약/조회</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <div class="lnb">
                    <h2>
                        <b>나의 도서관</b>
                    </h2>
                    <ul class="subMenu">
                        <li>
                            <a href="#">희망도서신청</a>
                        </li>
                        <li>
                            <a href="#">문화강좌신청/조회</a>
                        </li>
                        <li class="active">
                            <a href="#">좌석예약/조회</a>
                        </li>
                        <li>
                            <a href="#">개인정보</a>
                        </li>
                    </ul>
                </div>

                <!-- 본문 -->
                <div class="content">
                    <div class="doc">

                        <div class="room-list">
                            <div class="list-btn">
                                <button onclick="location.href='#'">제 1열람실</button>
                                <button class="active" onclick="location.href='/mylib/readingRoom2Rental'">제 2열람실</button>
                                <button>노트북실</button>
                                <button>세미나실</button>
                            </div>
                        </div>


                        <div class=" seat-chart">
                            <div class="seat-wrapper">
                                <div class="line1">
                                    <div class="seat-list-row">
                                        <button class="vacant">1</button>
                                        <button class="vacant">2</button>
                                        <button class="vacant">3</button>
                                        <button class="occupied">4</button>
                                        <button class="vacant">5</button>
                                        <button class="vacant">6</button>
                                        <button class="vacant">7</button>
                                        <button class="vacant">8</button>
                                        <button class="vacant">9</button>
                                        <button class="vacant">10</button>
                                    </div>
                                </div>

                                <div class="line2">
                                    <div class="seat-list" style="height: 120px; overflow: hidden;">
                                        <button class="occupied">11</button>
                                        <button class="vacant">12</button>
                                        <button class="vacant">13</button>
                                        <button class="vacant">14</button>
                                    </div>

                                    <div class="seat-list">
                                        <button class="vacant">15</button>
                                        <button class="vacant">16</button>
                                        <button class="vacant">17</button>
                                        <button class="vacant">18</button>
                                        <button class="vacant">19</button>
                                        <button class="vacant">20</button>
                                    </div>

                                    <div class="seat-list">
                                    </div>

                                    <div class="seat-list">
                                        <button class="vacant">21</button>
                                        <button class="vacant">22</button>
                                        <button class="vacant">23</button>
                                        <button class="vacant">24</button>
                                        <button class="vacant">25</button>
                                        <button class="vacant">26</button>

                                    </div>

                                    <div class="seat-list" style="margin-right: 0;">
                                        <button class="vacant">27</button>
                                        <button class="vacant">28</button>
                                        <button class="vacant">29</button>
                                        <button class="occupied">30</button>
                                        <button class="vacant">31</button>
                                        <button class="vacant">32</button>
                                    </div>
                                </div>


                                <div class="line3">
                                    <div class="seat-list-row">
                                        <button class="vacant">33</button>
                                        <button class="vacant">34</button>
                                        <button class="vacant">35</button>
                                        <button class="occupied">36</button>
                                        <button class="vacant">37</button>
                                        <button class="vacant">38</button>
                                        <button class="vacant">39</button>
                                        <button class="vacant">40</button>
                                        <button class="vacant">41</button>
                                        <button class="vacant">42</button>
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