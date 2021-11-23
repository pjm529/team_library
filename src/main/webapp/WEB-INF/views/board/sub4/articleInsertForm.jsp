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
                    <h3>공지사항</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="#">공지사항</a>
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
                                <form action="/board/articleInsertForm" method="post" enctype="multipart/form-data">
                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        placeholder="제목을 작성해 주세요" name="article_title">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>
                                                	<input type="text" name ="writer_name">
                                                </td>
                                                <th class="first">권한</th>
                                                <td>
                                                	<input type="text" name ="writer_id">
                                                </td>
                                                <th class="first">작성일</th>
                                                <td>
                                               	<%-- 	<fmt:formatDate var="article_reg_date" value="${dto.article_reg_date}" pattern="yyyy-MM-dd"/>
                                    					${article_reg_date} --%>
                                            	</td>
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
                                                        rows="15"></textarea>
                                                </td>
                                            </tr>
                                            
                                            <!-- 파일 업로드 -->
                                           <tr>
                                           	<td>
	                                           	
	                                           	
	                                           	
	                                           	<div class="uploadDiv">
													 <input type="file" name="uploadFile" multiple>
													 
													
												</div>
                                           	
                                           	
                                           	
                                           	</td>
                                           </tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                     	<!-- <button class="write_btn" onclick="location.href='/board/articleInsertForm'">글쓰기</button> -->
                                        <button class="write_btn" id="uploadBtn">글쓰기</button>
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
	   
		$("#uploadBtn").on('click', function(e) {
		
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for(var i=0; i<files.length; i++){
				formData.append('uploadFile', files[i]);
			}
			
			$.ajax({
				
				url: '/board/articleInsertForm',
				processData:false,
				contentType:false,
				data:formData,
				type:"post",
				success: function (result) {
					alert("업로드 완료");
				}
				
				
			})
			
			
		})
		

	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
   })
</script>
</body>
</html>