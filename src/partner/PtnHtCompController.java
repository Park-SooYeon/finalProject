package partner;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
		
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		List<PlaceVo> list = dao.select(member_id);
		
		mv.addObject("list", list);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_add.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		PlaceVo vo = null; 
		
		System.out.println("controller");
		//mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_add");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/insertR.ph", method= {RequestMethod.GET, RequestMethod.POST}, produces="application/text;charset=utf-8") 
	public ModelAndView insertR(HttpServletRequest req, PlaceVo vo) throws IOException {
		ModelAndView mv = new ModelAndView();
		int result = 1;
		System.out.println("req : " + req.getParameter("admHCompTel"));
		System.out.println("dksdksalkjsalk");
		
		System.out.println(req.getParameter("PtnHtStatus"));
		
		vo.setPlace_name(req.getParameter("admHCompNm"));
		vo.setPlace_tel(req.getParameter("admHCompTel"));
		vo.setPlace_location(req.getParameter("placeLocation"));
		
		vo.setPlace_code(Integer.parseInt(req.getParameter("htPlaceCode")));
		vo.setState(Integer.parseInt(req.getParameter("PtnHtStatus")));
		
		System.out.println("req : " + req.getParameter("wifi"));
		System.out.println("req : " + req.getParameter("breakfast"));
		System.out.println("req : " + req.getParameter("parking"));
		
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
		
		

		
		System.out.println("vo : " + vo.getPlace_name());
		
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		member_id = "jieun";
		
		MultipartFile multiFile1 = vo.getFileName1();
		MultipartFile multiFile2 = vo.getFileName2();
		MultipartFile multiFile3 = vo.getFileName3();
		
		String fileNm1 = multiFile1.getOriginalFilename();
		String fileNm2 = multiFile2.getOriginalFilename();
		String fileNm3 = multiFile3.getOriginalFilename();
		
		System.out.println(fileNm1);
		System.out.println(fileNm2);
		System.out.println(fileNm3);
		
		File f1 = new File(filePath + fileNm1);
		File f2 = new File(filePath + fileNm2);
		File f3 = new File(filePath + fileNm3);
		
		multiFile1.transferTo(f1);
		multiFile1.transferTo(f2);
		multiFile1.transferTo(f3);
		
		
		vo.setFileName1(multiFile1);
		vo.setFileName2(multiFile2);
		vo.setFileName3(multiFile3);
		
		List<MultipartFile> list = new ArrayList<MultipartFile>();
		list.add(multiFile1);
		list.add(multiFile2);
		list.add(multiFile3);
		
		System.out.println("vo file1 : " + vo.getFileName1());
		
		
//		FileUpload upload = new FileUpload(req, resp);
//		HttpServletRequest newReq = upload.uploading(); //  encType이 없는 req
		
	
		
		System.out.println("vo getBreakfast : " + vo.getBreakfast());
		System.out.println("vo getLatitude : " + vo.getLatitude());
		System.out.println("vo getPlace_location : " + vo.getPlace_location());
		System.out.println("vo getLocal_code : " + vo.getLocal_code());
		System.out.println("vo getPartner_serial : " + vo.getPartner_serial());
		System.out.println("vo getPlace_name : " + vo.getPlace_name());
		System.out.println("vo getPlace_tel : " + vo.getPlace_tel());
		
		
		
		result = dao.insert(member_id, vo, list);
		
		System.out.println("result : " + result);
		
		mv.addObject("vo", vo);
		mv.addObject("result", result);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	
	private String getExtension(String image2) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping(value="/admin/partner/hotel_comp_view.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_comp_modify.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modify(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		Object vo = null; 
		
		mv.addObject("vo", vo);
		mv.setViewName("hotel_comp_list");
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
