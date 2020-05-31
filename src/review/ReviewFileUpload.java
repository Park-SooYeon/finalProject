package review;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Page;
import bean.ReviewVo;


public class ReviewFileUpload {
	public static String upload = "C:\\Users\\choi\\Downloads\\";
    
	String tempDir = "c:/temp/";
	
	int maxSize = 1024*1024*50;
	HttpServletRequest req;
	HttpServletResponse resp;
	
	public ReviewFileUpload(HttpServletRequest req, HttpServletResponse resp) {
		this.req = req;
		this.resp = resp;
		System.out.println("ReviewFileUpload 생성자 실행 ");
	}
	public boolean uploadFormCheck() {
		boolean flag = ServletFileUpload.isMultipartContent(req);
		
		return flag;
	}
	public HttpServletRequest uploading() {
		System.out.println("uploading");
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
			System.out.println("트라이케치 들어옴");
			List<FileItem> list = sf.parseRequest(req);
			System.out.println(req);
			System.out.println(list);
			for(FileItem fi : list) {
				String v = fi.getString("utf-8");
				String k = fi.getFieldName();
				System.out.println("k:" + k);
				System.out.println("fi:" + fi.isFormField());
				if(fi.isFormField()) {
					System.out.println("if문 들어옴");
					switch(k) {	
					case "member_id":
						System.out.println("스위치케이스문 member_id 들어옴");
						HttpSession session = req.getSession();
						String member_id = (String)session.getAttribute("member_id");
						vo.setMember_id(member_id); 
						System.out.println(vo.getMember_id());
						break;
					
					case "place_serial":
						vo.setPlace_serial(Integer.parseInt(v));
						System.out.println(vo.getPlace_serial());
						break;
					case "reputation":
						vo.setReputation(Integer.parseInt(v));
						System.out.println(vo.getReputation());
						break;
					case "review_title":
						vo.setReview_title(v);
						System.out.println(vo.getReview_title());
						break;
					case "review_content":
						vo.setReview_content(v);
						System.out.println(vo.getReview_content());
						break;
					case "visit_date":
						int date = Integer.parseInt(req.getParameter("visit_date"));
						Calendar cal = Calendar.getInstance();
						cal.setTime(new Date());
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd");        
						cal.add(Calendar.MONTH, -date);
						String visit_date = df.format(cal.getTime());
						vo.setVisit_date(visit_date);
						System.out.println(vo.getVisit_date());
						break;

					case "delFile":
						ReviewAttVo attVo = new ReviewAttVo();
						attVo.setPhoto_name(v);
						delList.add(attVo);break;
					/*	
					case "findStr":
						p.setFindStr(v);break;
					case "nowPage":
						p.setNowPage(Integer.parseInt(v));break;
					*/	
					}
				}else { // <input type='file'/>
					if(fi.getSize()>0) {
						String f = fi.getName();
						String sysfile = new Date().getTime() + "-" +f ;
						ReviewAttVo attVo = new ReviewAttVo();
						attVo.setPhoto_name(f);
						//attVo.setSysFile(sysfile);
						attList.add(attVo);
						
						System.out.println(attVo.getPhoto_name());
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
