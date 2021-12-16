<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>라온도서관 > 이용안내 > 회원가입안내</title>
	<link rel="stylesheet" href="/resources/css/info/sub1/signup.css">
	<link rel="stylesheet" href="/resources/css/info/sb_page.css">
</head>
<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>회원가입안내</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/info/signup">이용안내</a>
                        </li>
                        <li>
                            <a href="/info/signup">회원가입안내</a>
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
                <!-- 60행까지는 기존 sub_page와 동일         -->
                        <div class="doc-body con17" id="contentArea">
                            <div class="body">
                                <div class="doc-body">
                                    <div class="roomicon">
                                        <div class="inner icowrap">
                                            <span class="ico ico5"></span>
                                            <strong>회원가입 안내</strong>
                                            <p>
                                                "대구광역시립라온도서관에 회원가입하셔서 대구광역시립, 구립도서관을 
                                                편리하게 이용하시고 더불어 다양한 혜택을 누리세요." 회원 가입하시면
                                                다양한 문화행사 및 신간도서에 대한 소식을 쉽게 접할 수 있을 뿐 아니
                                                라 대구 관내 모든 도서관을 쉽고 편리하게 이용할 수 있습니다.
                                            </p>
                                            <!-- 회원가입 화면으로 연결 -->
                                            <p class="basic_btn">
                                                <a href="#a" class="btn_go newWin" target="_blank" tutle="새창으로 열립니다."></a> 
                                        </div>
                                    </div>
                                    <h3>회원가입은 어떻게 할 수 있나요?</h3>
                                        <div class="step_box01">
                                            <ul class="mode">
                                                <li class="step01">
                                                    <div>
                                                        <h4>STEP 01</h4>
                                                        <h5>회원정보입력,<br>
                                                             본인인증</h5>
                                                    </div>
                                                </li>
                                                <li class="arr">
                                                    <div>
                                                        <img src="https://library.daegu.go.kr/data/menuResources/h35/17/1602747627060.png">
                                                    </div>
                                                </li>
                                                <li class="step02">
                                                    <div>
                                                        <h4>STEP 02</h4>
                                                        <h5>도서관 방문,<br>
                                                             신분증 제시</h5>
                                                    </div>
                                                </li>
                                                <li class="arr">
                                                    <div>
                                                        <img src="https://library.daegu.go.kr/data/menuResources/h35/17/1602747627060.png">
                                                    </div>
                                                </li>
                                                <li class="step03">
                                                    <div>
                                                        <h4>STEP 03</h4>
                                                        <h5>회원증 발급,<br>
                                                             수령</h5>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <h3>구비서류</h3>
                                        <div class="rsv-info"></div>
                                        <div class="auto-scroll">
                                            <table class="tbl-type01" summary="구비서류 안내표">
                                                <caption>구비서류</caption>
                                                <colgroup>
                                                    <col width="22%"></col1>
                                                    <col width="22%"></co12>
                                                    <col width="*"></col13>
                                                </colgroup>
                                                <thead>
                                                    <tr class="first">
                                                        <th scope="col" class="first th1">구분</th>
                                                        <th scope="col" colspan="2" class="first th1">세부내용</th>
                                                    </tr>
                                                </thead>    
                                                <tr>
                                                    <tr class="first">
                                                        <th scrop="col" class="first th1">발급 가능대상</th>
                                                        <td class="left last td1" colspan="2">
                                                            <ul class="con">
                                                                <li>주민등록상 대구시민(경산시, 칠곡군도 여기에 해당)</li>
                                                                <li>타지역 거주자 중 대구소재 학생 또는 직장인</li>
                                                                <li>대구에 거주 중인 외국인 등록자</li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                        <th scope="col" rowspan="5" class="first th1">
                                                            구비서류
                                                        </th>
                                                        <td scope="row" class="td1">만 18세 이상</td>
                                                        <td class="left last td1">
                                                            <ul class="con">
                                                                <li>주민등록증 또는 운전면허증</li>
                                                                <li>※ 신분증 주소와 실주소지가 다른 경우 등본을 추가 지참해야 함.</li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row" class="td1">만 14세 이상 ~ 18세 미만<br> (둘 중 하나에 해당)</td>
                                                        <td class="left last td1">
                                                            <ul class="con">
                                                                <li>청소년증</li>
                                                                <li>주민등록등본과 보호자 신분증 또는 학생증</li>
                                                            </ul>                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row" class="td1">만 14세 미만</td>
                                                        <td class="left last td1">
                                                            <ul class="con">
                                                                <li>
                                                                    주민등록등본과 보호자 신분증<br>
                                                                    (회원가입 시 법적대리인 동의 필요)
                                                                </li>
                                                            </ul>                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row" class="td1">타지역 거주자</td>
                                                        <td class="left last td1">
                                                            <ul class="con">
                                                                <li>기본구비서류 및 대구광역시 소재 직장, 학교의 재직 및 재학증명서</li>
                                                            </ul>                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td scope="row" class="td1">주의사항</td>
                                                        <td class="left last td1">
                                                            <ul class="con">
                                                                <li>증명서류는 회원가입일로부터 3개월 이내 발급</li>
                                                                <li>휴대폰 등에 저장된 사본은 불가</li>
                                                            </ul>                                                            
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <!-- 재발급 안내 -->
                                        <h3>회원증 재발급</h3>
                                        <ul class="con">
                                            <li>회원증 분실 시 도서관으로 전화 또는 방문신고</li>
                                            <li>신고일로부터 7일 경과 후 신분증 확인 후 재발급 가능</li>
                                        </ul>

                                        <!-- 유의사항 -->
                                        <h3>유의사항</h3>
                                        <ul class="con">
                                            <li>도서관 방문하여야만 회원증 수령 및 대출이 가능합니다.</li>
                                        </ul>
                                    </div>
                                    <div id="menuRatingDiv"></div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	$(".sub1").addClass("active");
	
</script>
</body>
</html>
