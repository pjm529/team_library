<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 연체내역</title>
<link rel="stylesheet" href="/resources/css/admin/member_list.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>연체중도서</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="#">
                                <img src="/resources/imges/admin/navi_home_icon.gif">
                            </a>
                        </li> 
                        <li>
                            <a href="/admin/member-list">관리자</a>
                        </li>
                        <li>
                            <a href="/admin/overdue-list">연체중도서</a>
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
                <div class="content" style="">
                    <div class="doc">
                        <div class="wrapper-bbs" style="">
							<!-- 회원 수 -->
                            <div class="inline">
                                <span style="margin-right: 10px;"> 연체 중 : <b>${total }</b> 건</span>
                            </div> 
                            <br>
                            <!-- 테이블 -->
                            
                            <form action="/admin/send-mail" method="get" onsubmit="return false;">
                            <button class="btn2" style="">메일</button>
                            <div class="table-wrap" style="overflow: auto; height: 500px;">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style=""><input type="checkbox" class="chk-all" ></th>
                                            <th style="width: 100px;">아이디</th>
                                            <th style="">도서명</th>
                                            <th style="">ISBN</th>
                                            <th style="width: 90px;">대출날짜</th>
                                            <th style="width: 90px;">반납예정일</th>
	                                </tr>
                                    </thead>
                                    <tbody>
                                    	
	                                    <c:forEach var="overdue_list" items="${overdue_list}">
										<tr>
											<td><input type="checkbox" name="user_email" 
											class="chk" value="${overdue_list.user_email}"></td>
											<td>${overdue_list.user_id }</td>
											<td>${overdue_list.book_title }</td>
											<td>${overdue_list.book_isbn}</td>
											<td>${overdue_list.loan_date }</td>
											<td>${overdue_list.return_period }</td>
											
										</tr>
										</c:forEach>
											
                                    </tbody>
                                </table>
                                </div>
                                
	                        </form>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>


	<script>
		
		$(function() {
			$(".sub4").addClass("active");
			
			$(".btn2").on("click", function(){
				let cnt = $("input[name=user_email]:checkbox:checked").length;
				
				if(cnt > 0) {
					if(confirm("메일을 전송하시겠습니까?")){
						$("form").attr("onsubmit", "return true;");
						$("form").submit();
					}
					
				} else {
					alert("회원을 선택해주세요");
				}
				
			});
			
			$(".chk-all").on("click", function() {
				$(".chk").prop("checked", this.checked);
			})
			
		});
		
	</script>	


</body>
</html>