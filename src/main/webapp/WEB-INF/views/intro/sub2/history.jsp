<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 도서관소개 > 연혁</title>
<link rel="stylesheet" href="/resources/css/intro/history.css">
<link rel="stylesheet" href="/resources/css/intro/road.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="header">
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>찾아오시는길</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/intro/greeting">도서관소개</a>
                        </li>
                        <li>
                            <a href="/intro/history">연혁</a>
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
                        <div class="wrapper-bbs">
                            <div class="history">
                                <div>
                                    <h2>2019</h2>
                                    <ol>
                                        <li><b>1월</b> : 대구광역시립라온도서관 개관준비팀 구성</li>
                                        <li><b>2월</b> : 대구광역시립라온도서관 전산시스템 구축완료</li>
                                        <li><b>4월</b> : 대구광역시립라온도서관 개관</li>
                                        <li><b>6월</b> : 학교로 찾아가는 도서관 시작</li>
                                        <li><b>6월</b> : 가족회원제도 실시</li>
                                        <li><b>8월</b> :북스타트 시작</li>
                                        <li><b>10월</b> : 카카오 알림톡 메시지 서비스 실시</li>
                                        <li><b>12월</b> : 작가초청강연회(김난도)</li>
                                    </ol>
                                </div>
                                <div>
                                    <h2>2020</h2>
                                    <ol>
                                        <li><b>2월</b> : 서구를 기록하다(지역향토독서문화프로그램, 옛날카메라전시회)</li>
                                        <li><b>3월</b> : 찾아가는 도서관 서비스 시작</li>
                                        <li><b>4월</b> : 다문화가정과 함께하는 그림책 읽기(어린이특강, 2회)</li>
                                        <li><b>5월</b> : 영화상영 서비스(매주 수, 토요일) 시작</li>
                                        <li><b>7월</b> : 찾아가는 도서관 서비스 시작</li>
                                        <li><b>11월</b> : 장서 점검 및 폐기</li>
                                    </ol>
                                </div>
                                <div>
                                    <h2>2021</h2>
                                    <ol>
                                        <li><b>1월</b> : 대구시 공공도서관 통합허브시스템 통합에 따른 신규 홈페이지 오픈</li>
                                        <li><b>2월</b> : 작가초청강연회(김초록)</li>
                                        <li><b>10월</b> : 사회적 거리두기 3단계 격상에 따른 휴관</li>
                                        <li><b>11월</b> : 사회적 거리두기 완화로 인한 라온도서관 재개관</li>
                                    </ol>
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
    <script>
        $(function () {
            $(".sub2").addClass("active");
        });

    </script>

</body>
</html>