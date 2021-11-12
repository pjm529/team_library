<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 분실물찾기</title>
</head>
<link rel="stylesheet" href="/resources/css/board/sub4/write_page.css">
<body>

     <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>분실물찾기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="#">분실물찾기</a>
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

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <form action="/board/articleModify" method="post">
	                                <input type="hidden" name="article_no" value="${dto.article_no}">
	                                <input type="hidden" name="amount" value="${cri.amount}">
	                                <input type="hidden" name="page" value="${cri.page}">
	                                <input type="hidden" name="type" value="${cri.type}">
	                                <input type="hidden" name="keyword" value="${cri.keyword}">
	                                    
	                                    <table class="bbs-edit">
	                                        <tbody>
	                                            <tr>
	                                                <th class="first">제목</th>
	                                                <td colspan="3">
	                                                    <input type="text" style="width: 80%; height: 27px;"
	                                                       name="article_title" value="${dto.article_title}">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                                <th class="first">작성자</th>
	                                                <td>
	                                                	<input type="text" name ="writer_name" value="${dto.writer_name}" readonly="readonly">
	                                                </td>
	                                             <!--    <th class="first">권한</th> -->
	                                                <td>
	                                                	<input type="hidden" name ="writer_id" value="${dto.writer_id}" readonly="readonly">
	                                                </td>
	                                                <th class="first">작성일</th>
	                                                <td>
	                                               		<fmt:formatDate var="article_reg_date" value="${dto.article_reg_date}" pattern="yyyy-MM-dd"/>
	                                    					${article_reg_date}
	                                            	</tr>
	
	<!--                                             <tr>
	                                                <th class="first">비밀번호</th>
	                                                <td colspan="3">
	                                                    <input type="password" style="width: 30%;" maxlength="10"
	                                                        placeholder="10자리 이내로 입력해 주세요">
	                                                </td>
	                                            </tr> -->
	                                            <tr>
	                                                <td colspan="4">
	                                                    <textarea id="popContent" name="article_content" cols="108"
	                                                        rows="15">${dto.article_content}</textarea>
	                                                </td>
	                                            </tr>
	                                        </tbody>
	
	                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <button class="write_btn" type="submit">수정하기</button>
                                    </div>

                                </form>

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
		$(".sub4").addClass("active");	
	})
 
</script>
</body>
</html>