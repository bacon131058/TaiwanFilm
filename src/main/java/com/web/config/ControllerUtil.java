package com.web.config;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class ControllerUtil {
	 //抓image內的圖檔轉成串流
	@Autowired
	ServletContext context;
	
    public Blob fileToBlob(String path) {
    	byte[] result = null;
    	Blob blob = null;
    	try(InputStream is = context.getResourceAsStream(path);
    			ByteArrayOutputStream baos = new ByteArrayOutputStream();){
    				byte[] b = new byte[819200];
    				int len = 0;
    				while((len = is.read(b))!=-1) {
    					baos.write(b,0,len);
    				}
    				result = baos.toByteArray();
    				blob = new SerialBlob(result);
    	}catch (Exception e) {
    		e.printStackTrace();
    		throw new RuntimeException("資料夾檔案轉blob失敗" + e.getMessage());
    	}
    	return blob;
    }
	
    public byte[] blobToByteArray(Blob blob) {
    	byte[] result = null;
    	try {
			InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();
		    byte[] b = new byte[819200];
		    int len = 0;
		    while((len = is.read(b))!=-1) {
		    	baos.write(b,0,len);
		    }
		    result = baos.toByteArray();
    	} catch (Exception e) {
			e.printStackTrace();
		}
    	return result;
    }
	//上船的FILE檔案轉成圖檔

	public Blob fileTransformBlob(MultipartFile file) {
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		Blob blob = null;
		if (file != null && !file.isEmpty()) {
			try {
				byte[] b = file.getBytes();
				blob = new SerialBlob(b);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		return blob;
	}
	// 取得上傳圖片的檔案名稱

	public String getFileName(MultipartFile file) {
		if(file != null) {
		String fileName = file.getOriginalFilename();
		if (fileName.length() > 0 && fileName.lastIndexOf(".") > -1) {
			return fileName;
		}
		return "UnknownImage";
		}else {
			return "noImage";
		}
		
	}
	//把影片網址擷取等號後段

	public String vedioLinkCut(String fullUrl) {
		if(fullUrl.startsWith("https://www.youtube.com/")||fullUrl.startsWith("www.youtube.com/")) {
		String url = fullUrl.substring((fullUrl.indexOf("=")+1));
		return url;}
		return "no vedio";
	}
	
}
