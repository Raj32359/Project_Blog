package com.ayvan.profile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ProfileConfig {
	
	public static boolean deleteFile(String path) {
		boolean flag =  false;
		try {
			File file = new File(path);
			flag = file.delete();
			flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static boolean saveFile(InputStream input, String path) {
		boolean flag = false;
		
		try {
			byte b[] = new byte[input.available()];
			input.read(b);
			FileOutputStream  output = new FileOutputStream(path);
			output.write(b);
			output.flush();
			output.close();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
}
