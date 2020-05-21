package partner;

import java.io.File;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Page;

public class FileUpload {
	static public  String upload = "/Users/jieun/eclipse-workspace/1907-spring/WebContent/upload/";
	String tempDir = "/Library/temp/";
	
	int maxSize = 1024*1024*50;	// 약 50mb
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public FileUpload(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}
	
	public boolean uploadFormCheck() {	// enctype이 있는가 
		boolean flag = ServletFileUpload.isMultipartContent(req);
		
		return flag;
	}
	
	public HttpServletRequest uploading() {
		BoardVo vo = new BoardVo();
		List<AttVo> attList = new ArrayList<AttVo>();
		List<AttVo> delList = new ArrayList<AttVo>();
		Page p = new Page();	// page정보 처리를 위해 
		
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4096);	// file 업로드 시 사용하는 메모리의 크기
		factory.setRepository(new File(tempDir));	// 파일이 업로드되면서 저장되는 임시 공간
		
		ServletFileUpload sf = new ServletFileUpload(factory);
		sf.setHeaderEncoding("utf-8");
		sf.setFileSizeMax(maxSize);
		
		List<FileItem> list; 
		try {
			list = sf.parseRequest(req);
			for(FileItem fi : list) {
				String v = fi.getString("utf-8");	// 입력상자에 있는 값이 한글인경우 인코딩 uft-8로 설정
				String k = fi.getFieldName();	// 입력태그의 name값
				
				if(fi.isFormField()){	// input type이 file이 아니라면
					switch(k) {
					case "id":	// 입력상자의 name값이 mId라면
						vo.setId(v); break;
					case "pwd" :
						vo.setPwd(v); break;
					case "subject" :
						vo.setSubject(v); break;
					case "content" : 
						vo.setContent(v); break;
					case "mDate" : 
						vo.setmDate(v); break;
					case "serial" : 
						vo.setSerial(Integer.parseInt(v)); break;
					case "pSerial" : 
						vo.setpSerial(Integer.parseInt(v)); break;
						 
					case "delFile" :
						AttVo attVo = new AttVo();
						attVo.setSysFile(v);
						delList.add(attVo); break;
						
					case "findStr" : 
						p.setFindStr(v); break;
					case "nowPage" :
						p.setNowPage(Integer.parseInt(v)); break;
					}
				}else {	// input tyoe이 file인 경우
					if(fi.getSize()>0) {	// fileSize가 0보다 큰경우 = 파일이 선택된 경우
						String f = fi.getName(); // 파일명 가져오기
						f = Normalizer.normalize(f, Normalizer.Form.NFC); // 맥(MAC)에서 한글 자모 분리되는 현상 막기 (정규)
						
						String sysfile = new Date().getTime() + "-" + f;	// 파일명뒤에 현재날짜와 시간을 추가하여 sysfile name 설정
						
						AttVo attVo = new AttVo();
						attVo.setOriFile(f);
						attVo.setSysFile(sysfile);
						attList.add(attVo);
						
						File file = new File(upload + sysfile);
						fi.write(file);

						fi.delete(); // "c:/Temp/" 임시파일 삭제
						
					}
				}
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}

		req.setAttribute("vo", vo);
		req.setAttribute("attList", attList);
		req.setAttribute("delList", delList);
		req.setAttribute("p", p);
		
		return req;
	}
	
	
}
