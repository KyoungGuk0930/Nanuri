package com.kh.finalPJ.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ChangeFileName {
	public static String changeMainImgN(String g_code,MultipartFile file) {
		String filename = file.getOriginalFilename();
		String fpost= ".jpg";
		
		if(filename.indexOf(".") >=0) {
			fpost = filename.substring( filename.indexOf(".") );
		}
		
		filename = g_code + "Main" + fpost;
		return filename;
	}
	
	public static List<String> changeSubImgN(String g_code,List<MultipartFile> sub_imgs){
		List<String> filenames = new ArrayList<>();
		
		for(int i = 0; i<sub_imgs.size(); i++) {
			String filename = sub_imgs.get(i).getOriginalFilename();
			String fpost= ".jpg";
			
			if(filename.indexOf(".") >=0) {
				fpost = filename.substring( filename.indexOf(".") );
			}
			filename = g_code + "Sub" + i + fpost;
			
			filenames.add(filename);
		}
		
		return filenames;
	}
	
	public static String changeContentImgN(String g_code,MultipartFile file) {
		String filename = file.getOriginalFilename();
		String fpost= ".jpg";
		
		if(filename.indexOf(".") >=0) {
			fpost = filename.substring( filename.indexOf(".") );
		}
		
		filename = g_code + "Content" + fpost;
		return filename;
	}
}
