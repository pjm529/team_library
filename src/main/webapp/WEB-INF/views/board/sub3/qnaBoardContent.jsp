<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A Board Content</title>
<link rel="stylesheet" href="/resources/css/board/write_page.css">
    <style>
        .wrapper-bbs {
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
                            <input type="hidden" value="${dto.enquiry_no}" name="${dto.enquiry_no}">
                                <table class="bbs-edit">
                                    <tbody>
                                        <!-- 제목 -->
                                        <tr>
                                            <td class="bbs-title" colspan="6">
                                                <b>${dto.enquiry_title}</b>
                                            </td>
                                        </tr>

                                        <!-- 작성자 | 작성일 | 조회수 -->
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">${dto.writer_id}</td>
                                            <th class="first">작성일</th>
                                            <td>${fn:substring(dto.enquiry_reg_date, 0, 11)}</td>
                                            <th class="first">조회수</th>
                                            <td>${dto.enquiry_hits}</td>
                                        </tr>

                                        <!-- 본문 내용 -->
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content">
                                                    <p>${dto.enquiry_content}</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>

                                <!-- 글쓰기 btn -->
                                <div class="list_wrap">
                                	<form action="/board/qnaBoardList" method="get">
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>
                                
                                <div class="delete_wrap">
	                               <form action="/board/qnaBoardDelete" method="get" onsubmit="return false" class="delete_form">
	                               		<input type="hidden" name="notice_no" value="${dto.enquiry_no}">
	                               		<input type="hidden" name="amount" value="${cri.amount}">
	                               		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
	                               		<button class="delete_btn" style="background-color: #518d7d; border: 1px solid #3e6b5f;">삭제하기</button>
	                               	</form>
	                            </div>
                                
								<div class="update_wrap">
									<form action="/board/qnaBoardEdit" method="get">
	                               		<input type="hidden" name="notice_no" value="${dto.enquiry_no}">
	                               		<input type="hidden" name="amount" value="${cri.amount}">
	                               		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
	                               		<button class="update_btn" style="margin-right: 20px;">수정하기</button>
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
				
		
		var moveForm = $(".moveForm");
		
		$(".delete_btn").on("click", function(e) {
			e.preventDefault();
			if(confirm("삭제하시겠습니까?")){
				alert("게시물이 삭제되었습니다.");
				$(".delete_form").attr("onsubmit", "result true");
				$(".delete_form").submit();
			}else{
			}
		})
				
	})
	
</script>  
    
<script>
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode= 2;
			return false;
		}else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82)){
			return false;
		}
	}
	
	document.onkeydown = noEvent;
</script>

</body>
</html>