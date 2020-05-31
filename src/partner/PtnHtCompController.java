package partner;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bean.PlaceVo;


@Controller
public class PtnHtCompController {
	
	PtnHtCompDao dao;
	
	private static final String filePath = "/Users/jieun/eclipse-workspace/finalProject/WebContent/assets/images/upload/";

	
	public PtnHtCompController(PtnHtCompDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="/admin/partner/dashboard.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView dashboard(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("dashboard");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_list.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		
		int serial = dao.getSerial(member_id);
		List<PlaceVo> list = dao.select(serial);
		List<UploadVo> photoList = null;
		
		for(PlaceVo vo : list) {
			// place serial 가져오기 
			int pserial = vo.getPlace_serial();
			
			// place_serial에 해당하는 사진정보 가져오기 
			photoList = dao.getAttList(pserial);
			
			vo.setPhotos(photoList);
			
		}
		
		mv.addObject("photoList", photoList);
		mv.addObject("list", list);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_add.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		PlaceVo vo = null; 
		
		//mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_add");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/insertR.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insertR(MultipartHttpServletRequest req) throws IOException {
		ModelAndView mv = new ModelAndView();
		int result = 1;
		
		PlaceVo vo = new PlaceVo();
		
		vo.setPlace_name(req.getParameter("admHCompNm"));
		vo.setPlace_tel(req.getParameter("admHCompTel"));
		vo.setPlace_location(req.getParameter("placeLocation"));
		vo.setLocal_code(Integer.parseInt(req.getParameter("htPlaceCode"))+1);
		vo.setState(Integer.parseInt(req.getParameter("PtnHtStatus")));
		
		if(req.getParameter("wifi") == null) {
			vo.setWifi(0);
		}else {
			vo.setBreakfast(Integer.parseInt(req.getParameter("wifi")));
		}
		
		if(req.getParameter("breakfast") == null) {
			vo.setBreakfast(0);
		}else {
			vo.setWifi(Integer.parseInt(req.getParameter("breakfast")));
		}
		
		if(req.getParameter("parking") == null || req.getParameter("parking") == "") {
			vo.setParking(0);
		}else {
			vo.setParking(Integer.parseInt(req.getParameter("parking")));
		}
		
		

		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		//FileUpload
    	//ServletContext c;
    	// c.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
    	
	    String uploadPath = req.getSession().getServletContext().getRealPath("/assets/images/");
	     //String uploadPath = "C:\\Users\\silve\\eclipse-workspace\\final_twitch\\WebContent\\store\\reviewimages";
	    System.out.println(uploadPath);
	    
	    File dir = new File(uploadPath);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }

	    /*
		 * uploadFile : 경로 maxSize : 크기 제한 설정 encoding: 인코딩 타입 설정 new
		 * DefaultFileRenamePolicy(); 동일한 이름일 경우 자동으로 (1),(2) 붙게 해줌
		 */ 
	    
	    //int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	    
	    String mId = "";
	    int pId;
	    String rContent ="";
	    String rSubject ="";
	    Double rLike;
	         
	    String image1 ="";// 중복처리된 이름
	    String image2 ="";// 중복 처리전 실제 원본 이름
	    long fileSize =0;// 파일 사이즈
	   // String fileType ="";// 파일 타입
	    //String encoding = "utf-8";
	  
	    UploadVo upVo;
	    List<UploadVo> list = new ArrayList<UploadVo>();
		List<MultipartFile> mf = req.getFiles("fileName1"); 
		
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
            
        } else {
            for (int i = 0; i < mf.size(); i++) {
            	 // 파일 중복명 처리
				String nnName = UUID.randomUUID().toString();
				 // 본래 파일명
				image2 = mf.get(i).getOriginalFilename();
				 //중복처리된 이름
				image1 = nnName + "." + getExtension(image2);
				
				fileSize = mf.get(i).getSize(); // 파일 사이즈
				
				String savePath = uploadPath + image1; // 저장 될 파일 경로
				 
                mf.get(i).transferTo(new File(savePath)); // 파일 저장
                
                upVo = new UploadVo(image1, image2);
               
                list.add(upVo);
            }
        }
        
		int serial = dao.getSerial(member_id);
		result = dao.insert(serial, vo, list);
		
		System.out.println("result : " + result);
		
		mv.addObject("vo", vo);
		mv.addObject("result", result);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	
	private String getExtension(String image2) {
		String mm = "jpg";
		
		return mm;
	}

	@RequestMapping(value="/admin/partner/hotel_comp_view.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		PlaceVo vo = null; 
		List<UploadVo> photoList = null;
		
		// place_serial 
		int serial = Integer.parseInt(req.getParameter("pserial"));
		System.out.println("serial" + serial);
		vo = dao.view(serial);
		photoList = dao.getAttList(serial);
		
		mv.addObject("serial", serial);
		mv.addObject("photoList", photoList);
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_view");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_modify.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		PlaceVo vo = null; 
		List<UploadVo> photoList = null;
		
		System.out.println("dsadsadas");
		
		// place_serial 
		int serial = Integer.parseInt(req.getParameter("pserial"));
		System.out.println("pserial : " + req.getParameter("pserial"));
		
		vo = dao.view(serial);
		photoList = dao.getAttList(serial);
		
		System.out.println("vo : " + vo);
		//System.out.println("vo get : " + vo.getPlace_name());
		
		mv.addObject("photoList", photoList);
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_modify"); 
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_delete.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	
	
	
}
