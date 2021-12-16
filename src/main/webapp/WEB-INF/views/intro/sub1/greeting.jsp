<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 도서관소개 > 인사말</title>
<link rel="stylesheet" href="/resources/css/intro/greeting.css">
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
                            <a href="/intro/greeting">인사말</a>
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
                            <div class="int-img">
                                <div class="int-img-box">
                                    <h2>대구광역시립 라온도서관 홈페이지 방문을 환영합니다.</h2>
                                    <p>- 4차 산업혁명의 시대, 책과 평생학습은 이 시대를 살아가는데 필수입니다. -</p>
                                </div>
                            </div>  
                            <!-- 게시물 수 -->
                            <div class="inline">
                                안녕하십니까?<br>
                                대구광역시립라온도서관에 오신 것을 환영합니다<br>
                                대구광역시립라온도서관은 다양한 책과 평생강좌를 통해<br> 
                                지역주민들의 삶의 질 향상은 물론 문화 소외 계층의<br>
                                문화충족에 이르기까지 다양한 프로그램으로 지역주민들의<br>
                                기대에 부응하고 있습니다.
                                <br>
                                <br>
                                <br>
                                급변하는 4차 산업사회에서 대구광역시립라온도서관은<br>
                                단순히 정보를 수집하고 제공하던 도서관의 기능에서 벗어<br>
                                나 문화 나눔의 창을 마련하고 4차 산업시대에 뒤쳐지지 않<br>
                                도록 지역주민들에게 첨단화된 정보을 제공하도록 노력하도<br>
                                록 노력하겠습니다. 또한 서구, 나아가 대구 관내의 여러<br>
                                도서관과 협력하여 지역 주민들에게 더 좋은 서비스를 제<br> 
                                공하도록 노력하겠습니다.<br>
                                <br>
                                <br>
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
            $(".sub1").addClass("active");
        });

    </script>

</body>
</html>