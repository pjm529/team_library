<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
   <title>라온도서관 > 열린공간 > 분실물찾기</title>
<link rel="stylesheet" href="/resources/css/board/sub4/content_page.css">
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
                    <h3>분실물찾기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li style="background-image: none;">
                            <a href="/board/articleList">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="#">열린공간</a>
                        </li>
                        <li>
                            <a href="/articleList">분실물찾기</a>
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
                                <table class="bbs-edit">
                                    <tbody>
                                        <!-- 제목 -->
                                        <tr>
                                            <td class="bbs-title" colspan="6">
                                                <b>${dto.article_title}</b>
                                            </td>
                                        </tr>

                                        <!-- 작성자 | 작성일 | 조회수 -->
                                        <tr>
                                            <th class="first">작성자</th>
                                            <td style="width: 15%;">${dto.writer_name}</td>
                                            <th class="first">작성일</th>                                            
                                            <td>
                                            	<fmt:formatDate var="article_reg_date" value="${dto.article_reg_date}" pattern="yyyy-MM-dd"/>
                                            		${article_reg_date}
                                            </td>
                                            <th class="first">조회수</th>
                                            <td>${dto.article_views}</td>
                                        </tr>

                                        <!-- 본문 내용 -->
                                        <tr>
                                            <td colspan="6">
                                                <div class="bbs-content">
                                                    <p>${dto.article_content}</p>
                                                      
                                                      
                                                      <!-- 첨부파일 -->
												      <div class="panel-body">
												        <div class='uploadResult'> 
												          <ul>
												          	
												          </ul>
												        </div>
												        
												      <div class="downloadAreaWrap">  
													       <div class="downloadArea">
		
														  		<ul>
														  		
														  		</ul>
														 </div>
												     </div>
												      
												      </div>
												  
											
												    
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>
                                
                                <!-- 이전글, 다음글 -->
                                <table class="article-board">
                                	<tbody>
                                		<tr class="board-prev first">
                                			<td class="first td1">
                                				<div class="fa-angle-up"></div>	
                                				<span><img src="/resources/imges/board/sub4/angle_up.png" width=15px; height=15px; style="float: left;"/>이전글</span>
                                			</td>
											
											
											<c:if test="${dtoPre.article_no == null}">
												<td>이전글이 없습니다.</td>
												<td class="td3"></td>
											</c:if>
											
											<c:if test="${dtoPre.article_no != null}">
	                                			<td class="td2">
	                                				<input type="hidden" value="${dtoPre.article_no}"> 
	                                				<a href="/board/articleContent?article_no=${dtoPre.article_no}&amount=${cri.amount}&page=${cri.page}">${dtoPre.article_title}</a>                                				
	                                			</td>
	                                			<td class="td3">관리자</td>
                                			</c:if>
                                				
                                			
                                		</tr>
                                		
                                		<tr class="board-next">
                                			<td class="first td1">
                                				<i class="fa-angle-down"></i>
                                				<span><img src="/resources/imges/board/sub4/angle_down.png" width=15px; height=15px; style="float:left;"/>다음글</span>
                                			</td>
                                			
                                			<c:if test="${dtoNext.article_no == null}">
												<td>다음글이 없습니다.</td>
												<td class="td3"></td>
											</c:if>
                                			
                                			<c:if test="${dtoNext.article_no != null}">
	                                			<td class="td2">
	                                				<input type="hidden" value="${dtoNext.article_no}">
	                                				<a href="/board/articleContent?article_no=${dtoNext.article_no}&amount=${cri.amount}&page=${cri.page}">${dtoNext.article_title}</a>
	                                			</td>
	                                			<td class="td3">관리자</td>
                                			</c:if>
                                			
                                			<!-- <td class="datetime last td4"></td> -->
                                		</tr>
                                	</tbody>
                                </table>

                                <!-- 글쓰기 btn -->
                                <div class="list_wrap">
	                                
	                                <!-- '목록으로' 눌렀을 때 처음 봤던 게시물 해당목록 페이지로 가기 -->
	                                <form action="/board/articleList" method="get">	                                	
	                                	<input type="hidden" name="amount" value="${cri.amount}">
	                                	<input type="hidden" name="page" value="${cri.page}">
	                                	<input type="hidden" name="type" value="${cri.type}">
	                                	<input type="hidden" name="keyword" value="${cri.keyword}">
	                               		<button class="list_btn">목록으로</button>
	                                </form>
	                             </div>
	                             
	                             <div class="delete_wrap">  
	                             	<!-- '삭제하기' 눌렀을 때 처음 봤던 게시물 해당목록 페이지로 가기 --> 
									<form action="/board/articleDelete" method="get" onsubmit="return confirm('삭제하시겠습니까?');">
										<input type="hidden" name="article_no" value="${dto.article_no}">
										<input type="hidden" name="amount" value="${cri.amount}">
	                                	<input type="hidden" name="page" value="${cri.page}">
	                                	<input type="hidden" name="type" value="${cri.type}">
	                                	<input type="hidden" name="keyword" value="${cri.keyword}">
	                                	<input type="hidden" name="uuid" id="uuid">
	                                	<input type="hidden" name="thumb" id="thumb">
	                                	<input type="hidden" name="file_name" id="file_name">
	                                	
	                                	
	                                    <button class="delete_btn">삭제하기</button>
	                                 </form>       
                                 </div>       
                                   
                                 <div class="update_wrap"> 
                                 	 
	                               <button class="update_btn" style="margin-right: 20px;"
	                                        onclick="location.href='/board/articleModifyForm?article_no=${dto.article_no}&amount=${cri.amount}&page=${cri.page}'">수정하기</button> 
                           
                           
                       <!--    <button class="update_btn" style="margin-right: 20px;"
	                            onclick="modifunc()">수정하기</button>  -->
                         
                                 
                                 </div>       

                                

                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
    
<!--     첨부파일
	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>

 	<div class="panel-heading">첨부파일</div>
      <div class="panel-body">
        <div class='uploadResult'> 
          <ul>
          
          </ul>
        </div>
      </div>
     -->

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>

$(document).ready(function(){
$(".sub4").addClass("active");	
  (function(){ 
	  
	  $(".downloadAreaWrap").hide();
  
    var article_no = '<c:out value="${dto.article_no}"/>';


    $.getJSON("/board/getAttachList", {article_no: article_no}, function(arr){
        
     
       console.log(arr);
       
       var str = "";
       var str2 = "";
       
       $(arr).each(function(i, attach){
    	   
         //image type
         if(attach.file_type){
           var fileCallPath =  encodeURIComponent(attach.upload_path+ "/"+attach.uuid +"_"+attach.file_name);
       
           var uuidName = $("#uuid").val(attach.uuid+"_"+attach.file_name);
           var thumbName = $("#thumb").val('s_'+attach.uuid+"_"+attach.file_name);
          /*  var file_name =$("#file_name").val(attach.file_name); */
           $("input[name='uuid']").attr('value',uuidName);
           $("input[name='thumb']").attr('value',thumbName);
          /*  $("input[name='file_name']").attr('value',file_name); */
           
          	/* content 본문에 보여지는 첨부된 사진 원본*/
          	str += "<img width='500px' src='/display?file_name="+fileCallPath+"'>";         
           	
          	str2 += "<li data-path='"+attach.upload_path+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.file_name+"' data-type='"+attach.file_type+"' ><div>";
           	str2 += "<span><img src='/resources/fileImage/imageDown.png' width='15px' height='15px' style='vertical-align: middle;'><a href='#'> "+ attach.file_name+"</a></span><br/>";         
           	str2 += "</div>";
           	str2 +"</li>";
         }else{
            
           str2 += "<li data-path='"+attach.upload_path+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.file_name+"' data-type='"+attach.file_type+"' ><div>";
           str2 += "<span><img src='/resources/fileImage/text.png' width='15px' height='15px' style='vertical-align: middle;'><a href='#'> "+ attach.file_name+"</a></span><br/>";
           str2 += "</div>";
           str2 +"</li>";
         }
       });
       
       $(".uploadResult ul").html(str);
       $(".downloadArea ul").html(str2);
       
       if($(".downloadAreaWrap li").length){
    	   $(".downloadAreaWrap").show();
       }
 
     });//end getjson

    
   }) ();//end function
  
   $(".downloadArea").on("click", "li a", function(e){
	      e.preventDefault();
	           
	      console.log("view image");
	      
	      var liObj = $(this).closest("li");
	      
	      var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
	      
	      /* alert(liObj.data("filename")); */
	      
	      self.location ="/download?file_name=" + path;
	      
	   });
   
  
  
  

  
});

</script>



</body>
</html>