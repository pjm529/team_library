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
${smList }
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
                            <button id="smBooking" onclick="">예약하기</button>
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
                                <tr>
                                    <td colspan="10">
                                        <span>
                                        &#8251; <b>예약 취소</b>의 경우 나의 예약 현황에서 확인 가능
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

		/* 현재 기준 날짜 */
		var todayDate = new Date(); // 현재 날짜 
    	
    	/* 받아온 날짜 값 view단에 보여주기 */
		var d_value = "<c:out value='${nowDate}'/>"; // 값 가져온 거
		var chDate = new Date(d_value); // 가져온 값 Date로 변경
		var nowDate = chDate.toISOString().slice(0, 10); // slice
		$(".nowDate").html(nowDate); // .nowDate => &lt 상단의 <h2>태그 && 테이블 표에 날짜 부분
		
		var chYear = chDate.getFullYear(); // 가져온 값의 Date
		var chMonth = chDate.getMonth()+1; // 가져온 값의 Month
		var lastDate = new Date(chYear, chMonth, 0); // 해당 날의 마지막 날짜 받아오기
		var lastDay = lastDate.getDate();
		
		/* &lt btn을 click 했을 시, (이전 날짜 이동) */
		$(".go-prev").on("click", function() {
			
			/* 날짜끼리 비교 */
			var tDay = todayDate.getDate(); // 현재 기준 날짜
			var cDay = chDate.getDate(); // 받아온 값의 날짜
			
			if(tDay < cDay){
				var dayMinus = chDate.setDate(chDate.getDate()-1);
				var MinusDate = new Date(dayMinus);
				var sliceMDate = MinusDate.toISOString().slice(0, 10);
				$(".nowDate").html(sliceMDate);
			}
			
		});
		
		/* &gt btn을 click 했을 시, (다음 날짜 이동) */
		$(".go-next").on("click", function() {
			
			$(".go-prev").show();
			
			/* 월끼리 비교 */
			var tMonth = todayDate.getMonth() + 1; // 현재 날짜의 월
			var cMonth = chDate.getMonth() + 1; // 받아온 값 날짜의 월
			
			/* 날짜끼리 비교(cDay, lastDay) 위해 받아온 값의 날짜 받아옴*/
			var cDay = chDate.getDate();
			
			if(tMonth == cMonth){ // 오늘 날의 월과 받아온 값의 월이 같을 때,
				if (cDay == lastDay){ // 받아온 값의 날짜와 마지막 날이 같을 경우 다음 달로 날짜 넘어가는 거 방지
					alert("다음 달 예약은 해당 월 1일에 확인하실 수 있습니다.");
				}else{ 
					var dayPlus = chDate.setDate(chDate.getDate()+1); 
					// 받아온 값(chDate)의 날짜를 받아와서 +1씩 증가
					var plusDate = new Date(dayPlus);
					// 증가한 dayPlus를 Date 형태로 변환
					var sliceDate = plusDate.toISOString().slice(0, 10);
					// dayPlus를 Date 형태로 변환한 후, sliceDate로 잘라서 yyyy-MM-dd 형태로 나타냄
					$(".nowDate").html(sliceDate);
				}
			}
			
		});
		
		
		
		/* 예약하기 btn click 시, ajax > insert */
		$("#smBooking").on("click", function(e){
    		e.preventDefault();

    		var room_name = $("#smName").text();
    		var room_no = 0;
    		if(room_name == '세미나룸 1'){
    			room_no = 1;
    		}else if(room_name == '세미나룸 2'){
    			room_no = 2;
    		}else if(room_name == '세미나룸 3'){
    			room_no = 3;
    		}else {
    			room_no = 4;
    		}
    		
    		var sm_time = $("#time option:selected").val(); // sm_time (예약 시간 : ex) A01, A02...)
    		var sm_date = chDate.toISOString().slice(0, 10); // sm_date (예약(사용할 날짜)
    		var user_id = "<c:out value='${user_id}'/>"
			
			var userRegistData = {room_no:room_no, user_id:user_id, sm_time:sm_time, sm_date:sm_date}
			
			
			$.ajax({
				url : '/mylib/sm_Room_booking',
				method : 'POST',
				contentType:'application/json;charset=utf-8', // 받아 올 때의 type
	            dataType:'json',
	            data: JSON.stringify(userRegistData),
	            success:function(data){
	               if(data==1){
	                  alert("세미나실 예약 완료");
	               }
	            },
	            error:function(request,status,error){
	               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
	        });
			
    		
    	});
		
		

		
	});
    
    
    </script>
</body>
</html>