package com.library.controller.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.library.model.board.NoticeAttachForAjaxDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@Controller
@Log4j
public class NoticeAttachController {
	
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	@PostMapping(value = "/uploadNoticeFileAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NoticeAttachForAjaxDTO>> uploadNoticeFileAjaxPost(MultipartFile[] uploadNoticeFile) {
		
		System.out.println("uploadNoticeFileAjaxAction 진입완료");
		
		List<NoticeAttachForAjaxDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\notice_file";
		
		File uploadPath = new File(uploadFolder);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadNoticeFile) {
			
			System.out.println("메롱메롱");
			
			NoticeAttachForAjaxDTO attachForAjaxDTO = new NoticeAttachForAjaxDTO();
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachForAjaxDTO.setFile_name(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachForAjaxDTO.setUuid(uuid.toString());
				attachForAjaxDTO.setUpload_path(uploadFolder);
				
				if(checkImageType(saveFile)) {
					attachForAjaxDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				
				list.add(attachForAjaxDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	

	@GetMapping("/displayFiles")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String file_name){
		
		File file = new File(file_name);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
//	@PostMapping("/deleteNoticeFile")
//	@ResponseBody
//	public ResponseEntity<String> deleteNoticeFile(String file_name, String type, 
//			@RequestParam("uuid") String uuid) {
//				
//		log.info("deleteFile: " + file_name);
//		
//		File file;
//		
//		try {
//			file = new File("C:\\notice_file\\" + URLDecoder.decode(file_name, "UTF-8"));
//			file.delete();
//			fileDelete(uuid);
//			
//			if(type.equals("image")) {
//				String largeFileName = file.getAbsolutePath().replace("s_", "");
//				log.info("largeFileName: " + largeFileName);
//				file = new File(largeFileName);
//				file.delete();
//				fileDelete(uuid);
//			}
//			
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//		}
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);
//	}
	
	@PostMapping("/deleteNoticeFile")
	@ResponseBody
	public ResponseEntity<String> deleteNoticeFile(String file_name, String type, 
			@RequestParam("uuid") String uuid) {
				
		log.info("deleteFile: " + file_name);
		
		fileDelete(uuid, type);
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	public void fileDelete(String uuid, String type) {
		
		System.out.println(uuid);
		System.out.println(type);
	
		String filePath = "C:\\notice_file\\";
		File deleteFileName = new File(filePath + uuid);
		
		if(type.equals("image")) {
			String thumb = "s_" + uuid;
			File deleteThumbFileName = new File(filePath + thumb);
			deleteFileName.delete();
			deleteThumbFileName.delete();
			System.out.println("파일삭제완료");
		}else {
			deleteFileName.delete();
			System.out.println("파일삭제완료");
		}
		
	}
	
	

}
