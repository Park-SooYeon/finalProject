package review;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Page;
import bean.ReviewVo;


public class ReviewFileUpload {
	public static String upload = "N:/workspace/1907/1907-spring/WebContent/upload/";
    
	String tempDir = "c:/temp/";
	
	int maxSize = 1024*1024*50;
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public ReviewFileUpload(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
	}
	public boolean uploadFormCheck() {
		boolean flag = ServletFileUpload.isMultipartContent(req);
		
		return flag;
	}
	public HttpServletRequest uploading() {
		ReviewVo vo = new ReviewVo();
		List<ReviewAttVo> attList = new ArrayList<ReviewAttVo>();
		List<ReviewAttVo> delList = new ArrayList<ReviewAttVo>();
		Page p = new Page();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4096);
		factory.setRepository(new File(tempDir) );
		
		ServletFileUpload sf = new ServletFileUpload(factory);
		sf.setHeaderEncoding("utf-8");
		sf.setFileSizeMax(maxSize);
		
		try {
			List<FileItem> list = sf.parseRequest(req);
			for(FileItem fi : list) {
				String v = fi.getString("utf-8");
				String k = fi.getFieldName();
				
				if(fi.isFormField()) {
					switch(k) {
					case "id": // <input type='text' name='Id'/>
						//vo.setId(v);break;
					case "pwd":
						//vo.setPwd(v);break;
					case "subject":
						//vo.setSubject(v);break;
					case "content":
						//vo.setContent(v);break;
					case "mDate":
						//vo.setmDate(v);break;
						
					case "serial":
						//vo.setSerial(Integer.parseInt(v));break;
					case "pSerial":
						//vo.setpSerial(Integer.parseInt(v));break;

					case "delFile":
						ReviewAttVo attVo = new ReviewAttVo();
						attVo.setSysFile(v);
						delList.add(attVo);break;
						
					case "findStr":
						p.setFindStr(v);break;
					case "nowPage":
						p.setNowPage(Integer.parseInt(v));break;
					}
				}else { // <input type='file'/>
					if(fi.getSize()>0) {
						String f = fi.getName();
						String sysfile = new Date().getTime() + "-" +f ;
						ReviewAttVo attVo = new ReviewAttVo();
						attVo.setOriFile(f);
						attVo.setSysFile(sysfile);
						attList.add(attVo);
						
						File file = new File(upload + sysfile);
						fi.write(file);
						
						fi.delete();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		req.setAttribute("vo", vo);
		req.setAttribute("attList", attList);
		req.setAttribute("delList", delList);
		req.setAttribute("p", p);
		
		return req;
		
	}

}
