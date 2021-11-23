<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 이용안내 > 도서대출/반납/예약</title>
<link rel="stylesheet" href="/resources/css/info/sub3/sb_page.css">
<link rel="stylesheet" href="/resources/css/info/sub3/loanBook.css">

<style>
 .wrapper-bbs{
	padding-top: 20px;
 	}

.bbs-content b {
	font-size: 140%;
	font-weight: 800;
	padding: 10px 15px;
	}

.bbs-title {
	height: 40px;
	}

.bbs-content {
	min-height: 240px;
	}

p {
	margin: 0;
	padding: 20px 15px;
	line-height: 150%;
	word-break: keep-all;
	font-size: 15px;
	font-weight: normal;
	color: #464646;
	}
</style>   
</head>
<body>
 <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>도서대출/반납/예약</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">이용안내</a>
                        </li>
                        <li>
                            <a href="/loanBook">도서대출/반납/예약</a>
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
                        
                        <div class="doc-body">
							  <h3>대출자격</h3>
							  <ul class="con">
							    <li>주민등록상 대구광역시 거주자</li>
							    <li>대구광역시 소재 학교 재학생 및 직장인</li>
							  </ul>
							  <h3>대출권수 및 대출기간</h3>
							  <ul class="con">
							    <li>일반회원 : 1인당 1회 10권 (대출일포함 15일)</li>
							    <li>노인회원(65세이상) : 1인당 1회 10권 (대출일포함 30일)</li>
							    <li>장애인 등록회원 : 1인당 1회 10권 (대출일포함 30일)</li>
							    <ul>
							      <li class="dep01">대출시 본인회원증으로만 대출가능</li>
							      <li class="dep01">대출 연장 불가</li>
							      <li class="dep01">재대출의 경우는 도서 반납일로부터 5일 경과 후 가능</li>
							      <li></li>
							    </ul>
							  </ul>
							  <h3>대출 불가능 자료</h3>
							  <ul class="con">
							    <li>희귀자료 및 고서 등 귀중본자료</li>
							    <li>참고자료 및 행정자료</li>
							    <li>연속간행물 및 음악CD자료</li>
							    <li>기타 대출제한이 필요하다고 인정되는 자료</li>
							  </ul>
							  <h3>도서예약</h3>
							  <ul class="con">
							    <li>원하는 자료가 대출중인 경우 홈페이지 또는 도서관 자료검색대를 통해 예약신청 가능</li>
							    <ul>
							      <li class="dep01">1인당 예약 가능 권수 : 최대 2권</li>
							      <li class="dep01">도서 1권당 예약자수 : 최대 2명
							      <li>
							    </ul>
							    <li>도서 반납시 문자서비스로 통보</li>
							    <li>예약만기일은 통보받은 날(포함)로부터 3일</li>
							  </ul>
							</div>

                            <!-- 테이블 -->
                          <!--   <div class="table-wrap">
                                <table class="bbs-edit">
                                    <tbody>
                                        제목
                                        <tr>
                                            <td class="bbs-title" colspan="6">
                                                <b>title 부분입니다.</b>
                                            </td>
                                        </tr>

                                        작성자 | 작성일 | 조회수
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">관리자</td>
                                            <th class="first">작성일</th>
                                            <td>2021-11-04</td>
                                            <th class="first">조회수</th>
                                            <td>0</td>
                                        </tr>

                                        본문 내용
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content">
                                                    <p>content 부분입니다.</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table> --> 

                                <!-- 글쓰기 btn -->
                          <!--       <div class="write">
                                    <button class="list_btn" onclick="location.href='#'">목록으로</button>
                                    <button class="delete_btn"
                                       
                                        onclick="location.href='#'">삭제하기</button>
                                    <button class="update_btn" style="margin-right: 20px;"
                                        onclick="location.href='#'">수정하기</button>

                                </div> -->

                            </div>

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