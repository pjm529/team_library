<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라온도서관 > 관리자 > 관리자권한</title>
<link rel="stylesheet" href="/resources/css/admin/popup.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="container">

        <div class="section">
            <div class="doc">
                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs">

                            <!--검색-->
                            <div class="search">
                                <form action="" onsubmit="return false;">
                                    <select name="type">
                                        <option value="user_id" selected="selected">아이디</option>
                                        <option value="user_name">이름</option>
                                        <option value="user_tel">전화번호</option>
                                        <option value="user_email">이메일</option>
                                    </select>
                                    <input type="text" name="keyword" autocomplete="off">
                                    <button id="search_btn" class="btn">검색</button>

                                </form>

                            </div>

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 100px;">아이디</th>
                                            <th style="width: 100px;">이름</th>
                                            <th style="width: 100px;">전화번호</th>
                                            <th style="width: 235px;">이메일</th>
                                            <th style="width: 90px;">회원가입일</th>
                                            <th style="width: 60px;">정보</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>

                                <br>


                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>


    <script>



    </script>


</body>
</html>