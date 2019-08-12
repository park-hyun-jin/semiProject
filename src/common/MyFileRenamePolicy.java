package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile)
	{
		// 현재시간 + 랜덤 5자리를 이용하여 파일명 변경
		long currentTime = System.currentTimeMillis();
		Date date = new Date(currentTime);
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		
		// 0 ~ 99999 랜덤 숫자 생성
		int ranNum = (int)(Math.random()*100000);
		
		// 확장자 유지를 위하여 확장자만 별도 추출
		String name = originFile.getName();
		String ext = null;
		
		int dot = name.lastIndexOf(".");
		
		if(dot != -1) { // 파일에 확장자가 있는 경우
			ext = name.substring(dot);
		} else {
			ext = "";
		}
		
		// 변경된 파일명
		String fileName = ft.format(date) + ranNum + ext; 
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	} 
	

}
