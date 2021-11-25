<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>Update Notice Form</title>
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
                            <a href="/board/notice">공지사항</a>
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
                            
                            <fmt:formatDate var="notice_reg_date" value="${noticeContent.notice_reg_date}" pattern="yyyy-MM-dd HH:ss"/>
                            
                            <div class="table-wrap">
                                <form action="/board/updateNotice" method="post" onsubmit="return false" role="form">
                                    <input type="hidden" name="writer_id" value="writer_id">
                            		<input type="hidden" name="notice_no" id="notice_no" value="${noticeContent.notice_no}">
                            		
                            		<input type="hidden" name="amount" value="${cri.amount}">
                                	<input type="hidden" name="page" value="${cri.page}">
                                	<input type="hidden" name="type" value="${cri.type}">
                                	<input type="hidden" name="keyword" value="${cri.keyword}">
                                    
                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        value="${noticeContent.notice_title}" name="notice_title" autocomplete="off">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>${noticeContent.writer_name}</td>
                                                <th class="first">작성일</th>
                                                <td>${notice_reg_date}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <textarea id="popContent" name="notice_content" cols="108"
                                                        rows="15">${noticeContent.notice_content}</textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                            	<td colspan="4">
													<div class="uploadDiv">
														<input type="file" name="uploadNoticeFile" id="uploadNoticeFile" multiple="multiple">
														<input type="hidden" name="uuid" id="uuid">
													</div>
														
													<div class='uploadResult'> 
														<ul>
														    
														</ul>
													</div>
                                            	</td>
                                            </tr>
                                            
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <button class="write_btn" type="submit">수정완료</button>
                                        <!-- <button class="list_btn" onclick="location.href='/noticeList'">목록으로</button> -->
                                    </div>
                                    
                                </form>
                                
                                <div class="list_wrap">
                                	<form action="/board/noticeList" method="get">
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>

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
			
			
			if(confirm('등록하시겠습니까?')) {
				$("form").attr("onsubmit", "result true");
				$("form").submit();
			}
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/* 게시물 조회화면에서 수정화면으로 이동시 보여지는 첨부파일 화면 */
		(function(){
		    
			var notice_no = $("#notice_no").val();
			    
			$.getJSON("/board/getNoticeAttachList", {notice_no:notice_no}, function(arr){
			  
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
				 
					//image type /* 기존 사진 */
					
					
					if(attach.file_type){
						var fileCallPath =  encodeURIComponent(attach.upload_path + "/s_" + attach.uuid + "_" + attach.file_name);
											    
					    str += "<li data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-type='" + attach.file_type + "' >";
					    str += "<div style='margin-top: 5px;'>";
					    str += "<img src='/displayFiles?file_name=" + fileCallPath + "' width='20px' height='20px' style='vertical-align: middle;'>";
					    str += "<span> " + attach.file_name + " </span>";
					    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'>x</button><br>";
					    str += "</div>";
					    str += "</li>";
					    
					}else{
					     
					    str += "<li data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-type='" + attach.file_type + "' >";
					    str += "<div style='margin-top: 5px;'>";
					    str += "<img src='/resources/imges/board/sub1/file_icon.png' width='20px' height='20px' style='vertical-align: middle;'></a>";
					    str += "<span> " + attach.file_name + " </span>";
					    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'>x</button><br>";
						str += "</div>";
					    str += "</li>";
					}
					
					
					/* if(attach.file_type){
						var fileCallPath =  encodeURIComponent(attach.upload_path + "/s_" + attach.uuid + "_" + attach.file_name);
											    
					    str += "<li data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-type='" + attach.file_type + "' ><div>";
					    str += "<img src='/displayFiles?file_name=" + fileCallPath + "' width='25px' height='25px' style='vertical-align: middle;'>";
					    str += "<span> " + attach.file_name + " </span>";
					    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'>x</button><br>";
					    str += "</div>";
					    str + "</li>";
					    
					}else{
					     
					    str += "<li data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-type='" + attach.file_type + "' ><div>";
					    str += "<img src='/resources/fileImage/file_icon.png' width='25px' height='25px' style='vertical-align: middle;'></a>";
					    str += "<span> " + attach.file_name + " </span><br/>";
					    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'>x</button><br>";
						str += "</div>";
					    str + "</li>";
					} */
					
					
					
					
				});
				        
				$(".uploadResult ul").html(str);
			  
			  
			});//end getjson
			      
			
		})();
			
		
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click", function(e){
		    
			e.preventDefault();
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
			  
				var jobj = $(obj);
				
				console.dir(jobj);
				console.log("-------------------------");
				
				str += "<input type='hidden' name='noticeAttachList[" + i + "].file_name' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='noticeAttachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='noticeAttachList[" + i + "].upload_path' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='noticeAttachList[" + i + "].file_type' value='" + jobj.data("type") + "'>";
			  
			});
			
			formObj.append(str).submit();
		    
		});
			
		/* 용량, 파일 형식 지정 */
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		 
		function checkExtension(fileName, fileSize){
		  	    
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			  
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("input[type='file']").change(function(e){
		
			var formData = new FormData();
			var inputFile = $("input[name='uploadNoticeFile']");
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size) ){
				return false;
			}
			formData.append("uploadNoticeFile", files[i]);
			    
			}
			  	    
			$.ajax({
				url: '/uploadNoticeFileAjaxAction',
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
		
		
		/* 첨부파일 선택했을 때 */
		function showUploadResult(uploadResultArr){
				    
			if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			
			var uploadUL = $(".uploadResult ul");
			
			var str ="";
			
			$(uploadResultArr).each(function(i, obj){
				
				if(obj.image){
					var fileCallPath = encodeURIComponent(obj.upload_path + "/s_" + obj.uuid + "_" + obj.file_name);
					var uuidName = obj.uuid + "_" + obj.file_name;
					
					$("input[name='uuid']").attr('value', uuidName);
					
					str += "<li data-path='" + obj.upload_path + "'";
					str += " data-uuid='" + obj.uuid+"' data-filename='" + obj.file_name + "' data-type='" + obj.image + "'";
					str += " ><div style='margin-top: 5px;'>";
					str += "<img src='/displayFiles?file_name=" + fileCallPath + "' width='20px' height='20px' style='vertical-align: middle;'>";
					str += "<span> " + obj.file_name + " </span>";
					str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'>x</button><br>";

					str += "</div>";
					str += "</li>";
				}else{
					var fileCallPath = encodeURIComponent( obj.upload_path + "/" + obj.uuid + "_" + obj.file_name);			      
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					var uuidName = obj.uuid + "_" + obj.file_name;
					
					$("input[name='uuid']").attr('value', uuidName);
					
					
					str += "<li "
					str += "data-path='" + obj.upload_path + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.file_name + "' data-type='" + obj.image + "' >";
					str += "<div style='margin-top: 5px;'>";
					str += "<img src='/resources/imges/board/sub1/file_icon.png' width='20px' height='20px' style='vertical-align: middle;'></a>";
					str += "<span> " + obj.file_name + " </span>";
					str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'>x</button><br>";
					str += "</div>";
					str += "</li>";
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
				url: '/deleteNoticeFile',
				data: {file_name: targetFile, type:type, uuid:uuid},
				dataType:'text',
				type: 'POST',
				success: function(result){
					targetLi.remove();
					$("#uploadNoticeFile").val("");
				}
			}); //$.ajax */
		});
		      
		
		/* var formObj = $("form"); 
		
		$('button').on("click", function(e){
		    
			e.preventDefault(); 
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			  
			}else if(operation === 'list'){
				//move to list
				formObj.attr("action", "/board/list").attr("method","get");
				
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();      
				
				formObj.empty();
				
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);	  
			      
			}else if(operation === 'modify'){
				        
				console.log("submit clicked");
				        
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj){
				  
					var jobj = $(obj);
					  
					console.dir(jobj);
					  
					str += "<input type='hidden' name='noticeAttachList[" + i + "].file_name' value='" + jobj.data("filename") + "'>";
					str += "<input type='hidden' name='noticeAttachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
					str += "<input type='hidden' name='noticeAttachList[" + i + "].upload_path' value='" + jobj.data("path") + "'>";
					str += "<input type='hidden' name='noticeAttachList[" + i + "].file_type' value='" + jobj.data("type") + "'>";
				          
				});
				formObj.append(str).submit();
			}
			  
			formObj.submit();
		});  */
	
		
		
			  
	});
		
		
		
	
	
	
	
	
</script>
	
	




</body>

</html>
