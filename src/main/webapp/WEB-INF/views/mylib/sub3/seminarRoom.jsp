<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 나의 도서관 > 좌석예약/조회(세미나실 예약 안내)</title>
	<link rel="stylesheet" href="/resources/css/mylib/sub3/seminarRoom.css">
	<link rel="stylesheet" href="/resources/css/footer.css">
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
                        <!-- seminarRoom 이용 안내 -->
                        <h2><u>세미나실 이용 안내</u></h2>
                        <div class=" service-wrap">
                            <div class="service-info">
                                <h3 style="margin-top: 10px;">이용시간</h3>
                                <ul class="con">
                                    <li>09:00 ~ 17:00</li>
                                </ul>
                                <h3>시설 및 장비</h3>
                                <ul class="con">
                                    <li>
                                        <b>시설 : </b>
                                        화이트 보드, 테이블, 의자
                                    </li>
                                    <li>
                                        <b>장비 : </b>
                                        노트북, TV(모니터용)
                                    </li>
                                </ul>

                                <h3>유의사항</h3>
                                <ul class="con" style="margin-bottom: 20px;">
                                    <li>1일 1회, 최대 3시간 이용 가능(1시간 단위 예약)</li>
                                    <li>취소 요청없이 사용하지 않을 겨우 1개월동안 이용이 중지됩니다.</li>
                                    <li>대출 자료를 30일 이상 장기연체 중인 이용자는 스터디룸 예약이 불가합니다.</li>
                                    <li>흡연 및 음식물 반입을 금지합니다.</li>
                                    <li>실내에서는 정숙하여 주십시오.</li>
                                    <li>고의로 비품 및 시설을 훼손할 경우에는 변상조치 합니다.</li>
                                    <li>학습이외의 용도 사용 및 유의사항 위반 시 퇴실조치 합니다.</li>
                                    <li>다음 이용자를 위하여 깨끗이 정리, 정돈해 주십시오.</li>
                                </ul>
                            </div>
                        </div>
                        
                        
                        
                        <!-- 날짜 부분 -->
                        <div class="wrap-seminarRoomBox">
                            <div class="nowDate-btn">
                                <h2><span class="nowDate"></span></h2>
                                <button class="go-prev">&lt;</button>
                                <button class="go-next">&gt;</button>
                            </div>
                        </div>

                        <!-- 세미나룸 시간대 | 예약하기 btn -->
                        <div class="select-box">
                            <span id="smName">세미나룸 1</span>
                            <select id="allTime" name="allTime"></select>
                            <select id="time" name="time" style="display: none;">
                            </select>
                            <button id="smBooking">예약하기</button>
                        </div>

                        <!-- 세미나실 예약 현황 -->
                        <table>
                            <thead>
                                <tr>
                                    <th rowspan="2"></th>
                                    <th class="nowDate" colspan="9"></th>
                                </tr>
                                <tr>
                                    <th>
                                        <span>09:00</span>
                                    </th>
                                    <th>
                                        <span>10:00</span>
                                    </th>
                                    <th>
                                        <span>11:00</span>
                                    </th>
                                    <th>
                                        <span>12:00</span>
                                    </th>
                                    <th>
                                        <span>13:00</span>
                                    </th>
                                    <th>
                                        <span>14:00</span>
                                    </th>
                                    <th>
                                        <span>15:00</span>
                                    </th>
                                    <th>
                                        <span>16:00</span>
                                    </th>
                                    <th>
                                        <span>17:00</span>
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <th>
                                        <button class="smName_btn" value="세미나룸 1">세미나룸1</button>
                                        <b>정원(4)</b>
                                    </th>
                                    <td>
                                        <!-- <div></div> -->
                                    </td>
                                    <td>
                                        <!-- <div></div> -->
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>
                                        <button class="smName_btn" value="세미나룸 2">세미나룸2</button>
                                        <b>정원(4)</b>
                                    </th>
                                    <td></td>
                                    <td>
                                        <!-- <div></div> -->
                                    </td>
                                    <td>
                                        <!-- <div></div> -->
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>
                                        <button class="smName_btn" value="세미나룸 3">세미나룸3</button>
                                        <b>정원(8)</b>
                                    </th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>
                                        <button class="smName_btn" value="세미나룸 4">세미나룸4</button>
                                        <b>정원(12)</b>
                                    </th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>

                            <tfoot>
                                <tr>
                                    <td colspan="10">
                                        <span>
                                            &#8251; 1일 1회 최대 3시간 이용 가능(1시간 단위 예약)
                                        </span>
                                    </td>
                                </tr>
                            </tfoot>


                        </table>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>
    
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="/resources/js/mylib/sub3/select.js"></script>
    
    <script>
    
    $(function() {
    	
    	/* 왼쪽 사이드바 class 추가 */
		$(".sub3").addClass("active");

    	/* 받아온 날짜 값 view단에 보여주기 */
		var d_value = "<c:out value='${nowDate}'/>";
		var chDate = new Date(d_value);
		var nowDate = chDate.toISOString().slice(0, 10);
		$(".nowDate").html(nowDate); // .nowDate => &lt 상단의 <h2>태그 && 테이블 표에 날짜 부분
		
		
		
		

		
	});
    
    </script>
</body>
</html>