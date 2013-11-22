package com.rbnelite.udyogvishwa.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.persistence.QueryHint;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	@RequestMapping(value = "/fileUploader", method = RequestMethod.GET)
	public String getFileUploader(Model model) {
		return "fileUpload";
	}
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public String getFileUpload(@RequestParam("name") String name,
	        @RequestParam("file") MultipartFile file) {
		 if (!file.isEmpty()) {
	            try {
					writToFile(file, name);
				} catch (IOException e) {
					e.printStackTrace();
				}
	           return "redirect:uploadSuccess?name="+name;
	       } else {
	           return "redirect:uploadFailure?name="+name;
	       }		
	}
	
	private void writToFile(MultipartFile file, String fileName) throws IOException {
		InputStream is = file.getInputStream();  
		OutputStream os = new FileOutputStream(fileName);  
		byte[] buffer = new byte[4096];  
		int bytesRead;  
		while ((bytesRead = is.read(buffer)) != -1) {  
		  os.write(buffer, 0, bytesRead);  
		}  
		is.close();  
		os.close();  		
	}

	@RequestMapping(value = "/uploadSuccess", method = RequestMethod.GET)
	public String getFileUploadSuccess(ModelMap model, @RequestParam("name") String name) {
		model.addAttribute("fileName", name);
		return "fileUploadSuccess";
	}
	
	
}
