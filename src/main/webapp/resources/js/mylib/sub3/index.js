

// Date 객체 사용으로 날짜 받아옴
// let 사용 이유 => goToday 함수에서 date 값을 재할당해 주기 위해
let date = new Date();



var renderCalendar = () => {
	
    var viewYear = date.getFullYear(); // 현재 년
    var viewMonth = date.getMonth(); // 현재 월
	
	
    // html .year-month 태그 채우기
    document.querySelector('.year-month').textContent
        = `${viewYear}년 ${viewMonth + 1}월`;


    var prevLast = new Date(viewYear, viewMonth, 0); // 지난 달 
    var thisLast = new Date(viewYear, viewMonth + 1, 0); // 이번 달

    var PLDate = prevLast.getDate(); // 지난 달 마지막 날짜
    var PLDay = prevLast.getDay(); // 지난 달 마지막 요일

    var TLDate = thisLast.getDate(); // 이번 달 마지막 날짜
    var TLDay = thisLast.getDay(); // 이번 달 마지막 요일


    // 전체 달력에 필요한 날짜 담아둘 배열
    // 지난 달 날짜와 다음 달 날짜는 상황에 따라 없을 수도 있기 때문에 값 초기화
    var prevDates = [];
    var thisDates = [...Array(TLDate + 1).keys()].slice(1);
    var nextDates = [];


    // prevDates와 nextDates 채우기 위한 반복문
    if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

    for (let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }


    // 배열 html에 출력
    // concat 메서드 통해 세 배열 합침
    var dates = prevDates.concat(thisDates, nextDates);

    //foreach 메서드로 전체 요소들을 돌리고, html 코드로 데이터를 하나씩 수정
    var firstDateIndex = dates.indexOf(1);
    // 지난 달 부분을 알아내기 위해 첫 날의 index를 얻음
    var lastDateIndex = dates.lastIndexOf(TLDate);
    // 다음 달 부분을 알아내기 위해 마지막 날의 index를 얻음
    dates.forEach((date, i) => {
        var condition = i >= firstDateIndex && i < lastDateIndex + 1
            ? 'this'
            : 'other';
        // 연산자 사용해 이번 달에 해당하는 부분을 this로, 나머지는 other라는 문자열로 구분 


        dates[i] = `<div class="date">
						<span class="${condition}">${date}
							<input type="hidden" id="nowDate" value="${viewYear + "-"}${viewMonth + 1 + "-"}${date}">
						</sapn>
					</div>`;
    })

    // html의 .dates 태그의 innerHTML 프로퍼티에 dates 배열에 join 메서드를 호출한 결과를 할당
    document.querySelector('.dates').innerHTML = dates.join('');

    let today = new Date();
    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.date')) {
            if (+date.innerText === today.getDate()) {
                date.classList.add('today');
                break;
            }
        }
    }

    let nowdate = today.getDate();
    let afterWeek = today.getDate() + 6;

    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let i = nowdate; i < afterWeek + 1; i++) {

            let groupBooking = document.createElement("button");
            groupBooking.innerHTML = "예약 가능";
            groupBooking.setAttribute("id", "group_booking");

            let date = document.getElementsByClassName('this')[i - 1];

            date.appendChild(groupBooking);

        }
    }


}

// 정의해 놓은 함수 호출
renderCalendar();


var prevMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
}

var nextMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
}

var goToday = () => {
    date = new Date();
    renderCalendar();
}

// 나의 예약 현황 btn 속성 추가
var my_info_btn = () => {
	location.href = "#";
}


// 좌석 배정 상세 btn 속성 추가
var rdRoom1 = () => {
	location.href = "#";
}

var rdRoom2 = () => {
	location.href = "#";
}

var nbRoom = () =>{
	location.href = "/mylib/notebookRoom";
}

var groupRoom_booking = () => {
	location.href = "/mylib/notebookRoom";
}


/* 세미나실 예약 btn의 해당하는 날짜 값 구하기*/
$(document).ready(function() {
	
	
	$('body').on("click", "#group_booking", function(){
		
		var nowDate = $(this).closest('span').find('#nowDate').val();
		
		location.href = '/mylib/seminarRoomService?nowDate=' + nowDate;
		
		
	});

	
}); 







