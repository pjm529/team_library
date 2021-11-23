<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관/열람실</title>
<link rel="stylesheet" href="/resources/css/mylib/sub1/readingRoom.css">
</head>
<body>
	<div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>열람실</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="#">열람실</a>
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
                <div class="content" style="border: 1px solid brown;">
                    <div class="doc">
                        <div class="wrapper-bbs" style="border: 1px solid black;">
                            
                            <button>제1열람실</button>
                            <button onclick="location.href='/mylib/readingRoom2Rental'">제2열람실</button>
                        </div>

                    </div>

                </div>

            </div>
        </div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function() {
		$(".sub3").addClass("active");	
	})
 
</script> 
</body>
</html>