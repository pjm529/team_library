<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 자주묻는질문</title>
</head>
<link rel="stylesheet" href="/resources/css/board/sub2/faq.css">
<body>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>분실물찾기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/board/noticeList">열린공간</a>
                        </li>
                        <li>
                            <a href="/board/faq">자주묻는질문</a>
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
                    <div class="accordion">
                        <input type="radio" name="accordion" id="answer01">
                            <label for="answer01">회원탈퇴는 어떻게 해야 하나요?<em></em></label>
                            <div>
                                <p>
                                    회원탈퇴는 정회원과 웹회원으로 구분됩니다.<br><br>

                                    정회원(도서관 방문하여 회원증을 발급받은 회원증 소지자) : 도서관에 직접 방문하여 탈퇴의사를 밝히고 대출된 도서 및 연체 확인 후 탈퇴 처리 해드립니다.<br><br>

                                    회원(홈페이지만 가입되어있고 회원증은 가지고 있지 않은 이용자) : 로그인 -> 정보수정 -> 왼쪽 상단의 회원탈퇴 버튼 클릭하시면 바로 탈퇴됩니다.<br><br>
                                </p>
                            </div>
                         <!-- 기존'의 질문 종료 -->
                        <!-- 다음 질문을 추가 -->
                        <input type="radio" name="accordion" id="answer02">
                        <label for="answer02">희망도서 신청은 어떻게 하나요?<em></em></label>
                        <div>
                        </label>
                            <p>
                                희망자료신청은 온라인 혹은 직접 도서관에 방문하여 신청가능합니다.<br><br>

                                <온라인><br><br>

                                홈페이지접속 > 로그인 > 내서재 > 희망도서신청 > 직접입력 후 신청<br><br>

                                후 서명, 저자, 출판사, 출판년도, ISBN, 도서정가 등을 작성하여 신청가능합니다.<br><br><br><br>


                                <방문신청><br><br>

                                각 층 자료실 데스크에서<br><br>

                                희망도서 신청서를 작성하시면 신청가능합니다.(회원번호 및 핸드폰 번호 작성 후 가능)<br><br>

                                희망도서는 한 달에 1인당 3권 신청가능합니다.<br><br><br>

                                ※ 희망도서는 2013년 9월부터 신청가능합니다.<br><br>
                            </p>
                        </div>
                        <!-- 기존의 질문 종료 -->
                        <!-- 다음 질문을 추가 -->
                        <input type="radio" name="accordion" id="answer03">
                        <label for="answer03">회원가입은 어떻게 해야하나요?<em></em></label>
                        <div> 
                            <p>
                                <b>대출회원가입></b>
                                도서관 대출회원으로 가입하시면 도서관 자료를 무료로 빌려가실 수 있으며, 이를 이용하면 대구광역시 통합도서서비스 참여도서관에서 모두 이용가능합니다.<br><br><br>
 

                                <b>가입대상</b><br><br>

                                 - 주민등록상 대구광역시, 경산시, 칠곡군 거주자<br>
                                 - 다만, 직장 및 학교가 대구광역시, 경산시, 칠곡군 소재(증명서 제출)<br><br><br>

 

                                <b>가입 방법</b><br>
                                범어도서관 홈페이지 접속 ->본인인증(공공 I-PIN, 휴대폰본인인증) 후 홈페이지 회원가입 -> 도서관 방문 -> 신분확인 -> 회원카드 발급 및 수령<br><br>

                               - 구비 서류 :<br><br>

                                성 인 : 신분증(주민등록증, 운전면허증, 여권등 주민등록번호가 기재되어있는 신분증)<br> 
                                청소년 : 학생증(주민등록 번호가 기재되있는 학생증) , 주민등록등본 또는 건강보험증<br>
                                아 동 : 주민등록등본(최근 3개월 이내) 또는 건강보험증<br><br><br>



                                가족회원가입<br> 
                                : 개인회원 가입 후 가족관계증명서 등 가족임을 증빙할수 있는 서류 제출<br><br><br> 
                                

                                기타안내사항<br>
                                - 회원증은 본인 외에는 사용할 수 없으며, 자료의 대출 시에는 회원증을 제시하여야 합니다.<br>
                                - 회원증 분실시 도서관회원증 재발급신청서를 제출하여 재발급 받으셔야 합니다.(신청후 5일 뒤 재발급)<br> 
                            </p>
                        </div>
                        <input type="radio" name="accordion" id="answer04">
                        <label for="answer04">주차장은 어떻게 사용하나요?<em></em></label>
                        <div>
                            <p>
                                도서관 뒤편, 좌측편에 주차장이 마련되어 있으며, 도서관 운영시간(평일 09시~20시,<br><br>
                            </p>    
                        </div>    
                    </div>	                
                </div>

            </div>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
   $(function() {
   		$(".sub2").addClass("active");  
   })
</script>
</body>
</html>