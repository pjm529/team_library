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
													<!-- <div class='bigPictureWrapper'>
														<div class='bigPicture'>
														</div>
													</div> -->
												
												 	
											      <div class="panel-body">
											        <div class='uploadResult'> 
											          <ul>
											          	
											          </ul>
											        </div>
											      </div>
												    
                                                </div>
                                            </td>
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
  
    var article_no = '<c:out value="${dto.article_no}"/>';

    
  
    
    $.getJSON("/board/getAttachList", {article_no: article_no}, function(arr){
        
     
       console.log(arr);
       
       var str = "";
       
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
           
           str += "<li data-path='"+attach.upload_path+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.file_name+"' data-type='"+attach.file_type+"' ><div>";
           str += "<img width='500px' src='/display?file_name="+fileCallPath+"'>";
           str += "</div>";
           str +"</li>";
         }else{
            
           str += "<li data-path='"+attach.upload_path+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.file_name+"' data-type='"+attach.file_type+"' ><div>";
           str += "<span> "+ attach.file_name+"</span><br/>";
           str += "<img src='/resources/fileImage/default.png'></a>";
           str += "</div>";
           str +"</li>";
         }
       });
       
       $(".uploadResult ul").html(str);
       
       
     });//end getjson

    
   }) ();//end function
  
  $(".uploadResult").on("click","li", function(e){
      
    console.log("view image");
    
    var liObj = $(this);
    
    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
    
    if(liObj.data("type")){
      showImage(path.replace(new RegExp(/\\/g),"/"));
    }else {
      //download 
      self.location ="/download?file_name="+path
    }
    
    
  });
  
  

  
/*   function showImage(fileCallPath){
	    
    alert(fileCallPath);
    
    $(".bigPictureWrapper").css("display","flex").show();
    
    $(".bigPicture")
    .html("<img src='/display?file_name="+fileCallPath+"' >")
    .animate({width:'100%', height: '100%'}, 1000);
    
  }

  $(".bigPictureWrapper").on("click", function(e){
    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
    setTimeout(function(){
      $('.bigPictureWrapper').hide();
    }, 1000);
  }); */
  


  
});

</script>

<!-- <script type="text/javascript">
  function modifunc() {
  	
  	var article_no = ${dto.article_no};
  	var amount = ${cri.amount};
  	var page = ${cri.page};
/*     var uuidName = $("#uuid").val();
    var thumbName = $("#thumb").val(); */
    /* location.href='/board/articleModifyForm?article_no='+article_no+'&amount='+amount+'&page='+page+'&uuidName='+uuidName+'&thumbName='+thumbName
   */  
    console.log();
   
  
  }
</script> -->


</body>
</html>