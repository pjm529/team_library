<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A Board Edit</title>
<link rel="stylesheet" href="/resources/css/board/write_page.css">
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
                            <a href="/qnaBoardList">묻고답하기</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <div class="lnb">
                    <h2>
                        <b>열린공간</b>
                    </h2>
                    <ul class="subMenu">
                        <li>
                            <a href="#">공지사항</a>
                        </li>
                        <li>
                            <a href="#">자주묻는질문</a>
                        </li>
                        <li class="active">
                            <a href="/qnaBoardList">묻고답하기</a>
                        </li>
                        <li>
                            <a href="#">분실물찾기</a>
                        </li>
                        <li>
                            <a href="#">도서관일정</a>
                        </li>
                    </ul>
                </div>

                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs">

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <form action="/qnaBoardUpdate" method="post">
                                	<input type="text" value="${dto.enquiry_no}" name="${dto.enquiry_no}">
                                	<input type="hidden" name="writer_id" value="writer_id">
                                    <input type="hidden" name="writer_name" value="writer_name">
                                    
                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        placeholder="제목을 작성해 주세요"
                                                        name="enquiry_title"
                                                        value="${dto.enquiry_title}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>${dto.writer_id}</td>
                                                <th class="first">작성일</th>
                                                <td>
                                                ${fn:substring(dto.enquiry_reg_date, 0, 11)}
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">비밀번호</th>
                                                <td colspan="3">
<!--                                                     <input type="password" style="width: 30%;" maxlength="10"
                                                        placeholder="10자리 이내로 입력해 주세요"> -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <textarea id="popContent" name="enquiry_content" cols="108"
                                                        rows="15">${dto.enquiry_content}</textarea>
                                                </td>
                                            </tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <input type="submit" class="write_btn" value="수정하기">
                                        <button class="list_btn" type="button" onclick="location.href='/qnaBoardList'">목록으로</button>
                                    </div>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>





</body>
</html>