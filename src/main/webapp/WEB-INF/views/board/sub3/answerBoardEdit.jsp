<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>라온도서관 > 묻고답하기 > 글 수정페이지</title>
<link rel="stylesheet" href="/resources/css/board/sub3/qna_write_page.css">
</head>
<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>묻고답하기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="/board/qnaBoardList">묻고답하기</a>
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
                                <form action="/board/answerBoardUpdate" method="post">
                                	<input type="hidden" name="answer_no" value="${answer.answer_no}" >
                                	<input type="text" name="enquiry_no" value="${answer.enquiry_no}" >
                                	<input type="hidden" name="a_writer_id" value="${answer.a_writer_id}">
                                    <input type="hidden" name="a_writer_name" value="${answer.a_writer_name}">
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
                                                        placeholder="제목을 작성해 주세요"
                                                        name="answer_title"
                                                        value="${answer.answer_title}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>${answer.a_writer_id}</td>
                                                <th class="first">작성일</th>
                                                <td>
                                                ${fn:substring(answer.answer_reg_date, 0, 11)}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <textarea id="popContent" name="answer_content" cols="108"
                                                        rows="15">${answer.answer_content}</textarea>
                                                </td>
                                            </tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <input type="submit" class="write_btn" value="수정하기" style="margin-top: 40px;">
                                    </div>

                                </form>
                                
                                <div class="list_wrap">
                                	<form action="/board/qnaBoardList" method="get">
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>
                                
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
		
		$(".write_btn").on("click", function() {
			if(confirm('등록하시겠습니까?')) {
				$("form").attr("onsubmit", "result true");
				$("form").submit();
			}
		});
		
		
	});

</script>

</body>
</html>