<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>Insert Notice Form</title>
    <link rel="stylesheet" href="/resources/css/board/sub1/notice_write_page.css">
</head>

<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>공지사항</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/board/noticeList">열린공간</a>
                        </li>
                        <li>
                            <a href="/board/noticeList">공지사항</a>
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
                            
                            <c:set var="now" value="<%=new java.util.Date()%>" />
                            <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
                            
                            <div class="table-wrap">
                                <form action="/board/insertNotice" method="post" onsubmit="return false" enctype="multipart/form-data">
                                    <input type="hidden" name="writer_id" value="writer_id">
                            		<input type="hidden" name="writer_name" value="writer_name">
                                    
                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        placeholder="제목을 작성해 주세요" name="notice_title" id="notice_title" autocomplete="off" required="required">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>writer_name</td>
                                                <th class="first">작성일</th>
                                                <td>${today}</td>
                                            </tr>
                                            <!-- <tr>
                                                <th class="first">비밀번호</th>
                                                <td colspan="3">
                                                    <input type="password" style="width: 30%;" maxlength="10"
                                                        placeholder="10자리 이내로 입력해 주세요">
                                                </td>
                                            </tr> -->
                                            <tr>
                                                <td colspan="4">
                                                    <textarea id="popContent" name="notice_content" cols="108"
                                                        rows="15"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <input type="file" name="notice_img" multiple>
                                                </td>
                                            </tr>
                                            
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <button class="write_btn" type="submit">작성완료</button>
                                        <button class="list_btn" onclick="location.href='/board/noticeList'">목록으로</button>
                                    </div>
                                    
                                    

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.js"
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
	$(function(){
		
		$(".sub1").addClass("active");
		
		$(".write_btn").on("click", function() {
			
			var notice_title = $("#notice_title").val();
			
			if(notice_title == ""){
				
				return false;
			}
			
			if(confirm('등록하시겠습니까?')) {
				$("form").attr("onsubmit", "result true");
				$("form").submit();
			}
		});
	})
</script>



</body>

</html>
