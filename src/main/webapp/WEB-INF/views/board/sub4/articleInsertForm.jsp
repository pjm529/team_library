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
                                <form action="/board/articleInsertForm" method="post" role="form">
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
														 <input type="hidden" name="uuid" id="uuid">
													</div>
													
													<div class="uploadResult">
														<ul>
														
														</ul>
													</div>
		                                           	

	                                           	</td>
                                           </tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                     	<!-- <button class="write_btn" onclick="location.href='/board/articleInsertForm'">글쓰기</button> -->
                                        <button class="write_btn" id="uploadBtn" type="submit">글쓰기</button>
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
$(document).ready(function(e){
	   $(".sub4").addClass("active");
	   
	   /* var formObj = $("form[role='form']");
	   
	   $("button[type='submit']").on("click", function(e){
	     e.preventDefault();
	     alert("submit clicked");
	     
	   }); */
	   
	   /* 파일업로드 ,전송할 때 넘겨주는 것들*/
	   
	   var formObj = $("form[role='form']");
	   
	   $("button[type='submit']").on("click", function(e){
	     
	     e.preventDefault();
	     
	     var str = "";
	     
	     $(".uploadResult ul li").each(function(i, obj){
	       
	       var jobj = $(obj);
	       
	       console.dir(jobj);
	       console.log("-------------------------");
	       console.log(jobj.data("filename"));

		   str += "<input type='hidden' name='attachList["+i+"].file_name' value='"+jobj.data("filename")+"'>";
	       str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	       str += "<input type='hidden' name='attachList["+i+"].upload_path' value='"+jobj.data("path")+"'>";
	       str += "<input type='hidden' name='attachList["+i+"].file_type' value='"+ jobj.data("type")+"'>";
	       
	     });
	     
	     console.log(str);
	     	     
	     formObj.append(str).submit();
	     
	   });

	   
	   /* 용량,파일형식 지정 */
	   var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	   var maxSize = 5242880; //5MB
	   
	   function checkExtension(file_name, fileSize){
	     
	     if(fileSize >= maxSize){
	       alert("파일 사이즈 초과");
	       return false;
	     }
	     
	     if(regex.test(file_name)){
	       alert("해당 종류의 파일은 업로드할 수 없습니다.");
	       return false;
	     }
	     return true;
	   }
	   
	   
	   /* 선택된 파일을 지정된 폴더에 저장  */
	   $("input[type='file']").change(function(e){

		    var formData = new FormData();
		    var inputFile = $("input[name='uploadFile']");
		    var files = inputFile[0].files;
		    
		    for(var i = 0; i < files.length; i++){

		      if(!checkExtension(files[i].name, files[i].size) ){
		        return false;
		      }
		      formData.append("uploadFile", files[i]);
		    }
		    
		    $.ajax({
		      url: '/uploadAjaxAction',
		      processData: false, 
		      contentType: false,
		      data: formData,
		      type: 'POST',
		      dataType:'json',
		      success: function(result){
		          console.log(result); 
				  showUploadResult(result); //업로드 결과 처리 함수 

		      }
		    }); //$.ajax
		    
		  }); 
	   
	   

	   
	   function showUploadResult(uploadResultArr){
		    
		    if(!uploadResultArr || uploadResultArr.length == 0){ 
		    	return; 
		    }
		    
		    var uploadUL = $(".uploadResult ul");
		    
		    var str =""; /* li값들이 채워짐 */
		    
		    $(uploadResultArr).each(function(i, obj){
		    
				
				if(obj.image){
					var fileCallPath = encodeURIComponent( obj.upload_path+ "/s_"+obj.uuid +"_"+obj.file_name);					
					var uuidName = obj.uuid+"_"+obj.file_name;
				
           			/* var thumbName = $("#thumb").val('s_'+attach.uuid+"_"+attach.file_name); */
           			
	           		 $("input[name='uuid']").attr('value',uuidName);
	           		/*  $("input[name='thumb']").attr('value',thumbName); */
		
					str += "<li data-path='"+obj.upload_path+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.file_name+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.file_name+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='image'>x</button><br>";
					str += "<img src='/display?file_name="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
					
				}else{
					var fileCallPath = encodeURIComponent( obj.upload_path+"/"+ obj.uuid +"_"+obj.file_name);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				    var uuidName = obj.uuid+"_"+obj.file_name;
				    
				    $("input[name='uuid']").attr('value',uuidName);
				      
					str += "<li "
					str += "data-path='"+obj.upload_path+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.file_name+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.file_name+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\'data-type='file'>x</button><br>";
					str += "<img src='/resources/fileImage/default.png' width='150px'></a>";
					str += "</div>";
					str +"</li>";
				}

		    });
		    
		    uploadUL.append(str);
		  }
	  
	   /* x버튼 눌렀을 때 첨부파일 화면에서 사라짐 */
	   $(".uploadResult").on("click", "button", function(e){

		    console.log("delete file");
		    
		    var uuid = $("#uuid").val();      
		    var targetFile = $(this).data("file");
		    var type = $(this).data("type");
		    
		    
		    var targetLi = $(this).closest("li");
		    
		    $.ajax({
		      url: '/deleteFile',
		      data: {file_name: targetFile, type:type, uuid:uuid},
		      dataType:'text',
		      type: 'POST',
		      success: function(result){
		        
		           
		           targetLi.remove();
		           
		         }
		    }); //$.ajax
		   });

	   
	   
   })
</script>
</body>
</html>