package com.niit.frontend.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtilility {
	
	
	
	private static final String ABS_PATH="D:\\workspace\\frontend\\src\\main\\webapp\\resources\\images\\";
	private static String REAL_PATH="";
	public static void uploadFile(HttpServletRequest request, MultipartFile file, int hashCode, String id) {
		

		// get the real path
		REAL_PATH=request.getSession().getServletContext().getRealPath("/resources/images");
		
		// to make sure all the directories exists
		// please create if doesnt exist
		if(!new File(ABS_PATH).exists())
		{
			new File(ABS_PATH).mkdirs();
		}
		
		if(!new File(REAL_PATH).exists())
		{
			new File(REAL_PATH).mkdirs();
		}
		
		try
		{
			//server upload
			file.transferTo(new File(REAL_PATH+ id +".jpg"));
			
			//project dir upload
			file.transferTo(new File(ABS_PATH+ id +".jpg"));
		}
		catch(IOException ie)
		{
			
		}
	}
	

	
	
}