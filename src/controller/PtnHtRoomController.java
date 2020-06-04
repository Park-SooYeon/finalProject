package controller;

import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bean.PlaceVo;
import bean.roomPhotoVo;
import bean.roomVo;
import dao.PtnHtCompDao;
import dao.PtnHtRoomDao;
import partner.UploadVo;


@Controller
public class PtnHtRoomController {
	
	PtnHtRoomDao dao;
	String image1 ="";// 중복처리된 이름
    String image2 ="";// 중복 처리전 실제 원본 이름
    long fileSize =0;// 파일 사이즈
    
    

	public PtnHtRoomController(PtnHtRoomDao dao) {
		this.dao = dao;
	}
	
	
	
	@RequestMapping(value="/admin/partner/hotel_room_list.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView select(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		// 파트너 시리얼 가져오기
		int serial = dao.getSerial(member_id);
		
		List<roomVo> list = dao.select(serial);
		List<roomPhotoVo> photoList = new ArrayList<roomPhotoVo>();

		for(roomVo vo : list) {
			// room serial 가져오기 
			int rserial = vo.getRooms_serial();
			int pserial = vo.getPlace_serial();
			
			// room serial에 해당하는 사진정보 가져오기 
			photoList = dao.getAttList(rserial);
			
			vo.setPhotos(photoList);
			
		}
		
		
		mv.addObject("list", list);
		mv.setViewName("hotel_room_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_room_add.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insert(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		PtnHtCompDao hotelDao = new PtnHtCompDao();
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
	
		// 등록된 호텔 목록 가져오기
		int serial = hotelDao.getSerial(member_id);
		List<PlaceVo> list = hotelDao.select(serial);
		
		mv.addObject("list", list);
		mv.setViewName("hotel_room_add");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_room_insertR.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView insertR(MultipartHttpServletRequest req) throws IOException {
		ModelAndView mv = new ModelAndView();
		int result = 1;
		
		roomVo vo = new roomVo();
		// place_serial
		vo.setPlace_serial(Integer.parseInt(req.getParameter("place_serial")));
		vo.setRooms_name(Integer.parseInt(req.getParameter("rooms_name")));
		vo.setPrice(Integer.parseInt(req.getParameter("price"))); 
		vo.setPeople(Integer.parseInt(req.getParameter("people"))); 
		
		if(req.getParameter("no_smoking") == null) {
			vo.setNo_smoking(0);
		}else {
			vo.setNo_smoking(Integer.parseInt(req.getParameter("no_smoking")));
		}
		
		if(req.getParameter("mt_view") == null) {
			vo.setMt_view(0);
		}else {
			vo.setMt_view(Integer.parseInt(req.getParameter("mt_view")));
		}
		
		if(req.getParameter("ocean_view") == null || req.getParameter("ocean_view") == "") {
			vo.setOcean_view(0);;
		}else {
			vo.setOcean_view(Integer.parseInt(req.getParameter("ocean_view")));
		}
		
		if(req.getParameter("city_view") == null || req.getParameter("city_view") == "") {
			vo.setCity_view(0);;
		}else {
			vo.setCity_view(Integer.parseInt(req.getParameter("city_view")));
		}
		
		
		//FileUpload
	    String uploadPath = req.getSession().getServletContext().getRealPath("/assets/images/upload/");
	    
	    File dir = new File(uploadPath);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }

	    /*
		 * uploadFile : 경로 maxSize : 크기 제한 설정 encoding: 인코딩 타입 설정 new
		 * DefaultFileRenamePolicy(); 동일한 이름일 경우 자동으로 (1),(2) 붙게 해줌
		 */ 
	    
	    //int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	         
	    
	   // String fileType ="";// 파일 타입
	    //String encoding = "utf-8";
	  
        roomPhotoVo rmVo;
	    List<roomPhotoVo> list = new ArrayList<roomPhotoVo>();
		//List<MultipartFile> mf = req.getFiles("fileName1");
		List<MultipartFile> mf = new ArrayList<MultipartFile>();
		
		MultipartFile file1 = req.getFile("fileName1");
		MultipartFile file2 = req.getFile("fileName2");
		MultipartFile file3 = req.getFile("fileName3");
		
		mf.add(file1);
		mf.add(file2);
		mf.add(file3);
		
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
            
        } else {
            for (int i = 0; i < mf.size(); i++) {
            	 // 파일 중복명 처리
				String nnName = UUID.randomUUID().toString();
				 // 본래 파일명
				image2 = mf.get(i).getOriginalFilename();
				image2 = Normalizer.normalize(image2, Normalizer.Form.NFC); // 맥(MAC)에서 한글 자모 분리되는 현상 막기 (정규)
				 //중복처리된 이름
				image1 = nnName + "." + getExtension(image2);
				
				fileSize = mf.get(i).getSize(); // 파일 사이즈
				
				String savePath = uploadPath + image1; // 저장 될 파일 경로
				 
                mf.get(i).transferTo(new File(savePath)); // 파일 저장
                
                rmVo = new roomPhotoVo(image1, image2);
                list.add(rmVo);
            }
        }
        
		result = dao.insert(vo, list);
		
		mv.addObject("vo", vo);
		mv.addObject("result", result);
		mv.setViewName("hotel_comp_list");
		return mv;
	}
	
	
	private String getExtension(String image2) {
		String mm = "jpg";
		
		return mm;
	}
	@RequestMapping(value="/admin/partner/hotel_room_view.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView view(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		roomVo vo = new roomVo();
		List<roomPhotoVo> photoList = null;
		
		
		// 세션 id 가져오기
		HttpSession session  = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		// 파트너 시리얼 가져오기
		int pserial = dao.getSerial(member_id);
		// 호텔 목록 가져오기
		List<PlaceVo> list = null; 
		list = dao.selectHotel(pserial);
		
		// room_serial 
		int serial = Integer.parseInt(req.getParameter("rooms_serial"));
		vo = dao.view(serial);
		photoList = dao.getAttList(serial);
		vo.setPhotos(photoList);

		mv.addObject("serial", serial);
		mv.addObject("list", list);
		mv.addObject("photoList", photoList);
		mv.addObject("vo", vo);
		mv.setViewName("hotel_room_modify");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_room_modifyR.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView modifyR(MultipartHttpServletRequest req, roomVo vo) throws IOException {
		ModelAndView mv = new ModelAndView();
		// photo_serial 값 세팅 
		String[] photoNum = new String[3];
		photoNum[0] = req.getParameter("photo_serial_1");
		photoNum[1] = req.getParameter("photo_serial_2");
		photoNum[2] = req.getParameter("photo_serial_3");
		
		//FileUpload
    	//ServletContext c;
    	// c.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
    	
	    String uploadPath = req.getSession().getServletContext().getRealPath("/assets/images/upload/");
	    
	    File dir = new File(uploadPath);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }
	  
	    roomPhotoVo rpVo;
	    List<roomPhotoVo> list = new ArrayList<roomPhotoVo>();
		List<MultipartFile> mf = new ArrayList<MultipartFile>();
		List<roomPhotoVo> delList = (List<roomPhotoVo>) req.getAttribute("photoList");
		
		MultipartFile file1 = req.getFile("fileName1");
		MultipartFile file2 = req.getFile("fileName2");
		MultipartFile file3 = req.getFile("fileName3");
		
		mf.add(file1);
		mf.add(file2);
		mf.add(file3);
		
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
            
        } else{
            for (int i = 0; i < mf.size(); i++) {
            	 // 파일 중복명 처리
				String nnName = UUID.randomUUID().toString();
				 // 본래 파일명
				
				if(mf.get(i).getOriginalFilename() == null) {
					break;
				}else {
					image2 = mf.get(i).getOriginalFilename();

				}
			
				image2 = Normalizer.normalize(image2, Normalizer.Form.NFC); // 맥(MAC)에서 한글 자모 분리되는 현상 막기 (정규)
				 //중복처리된 이름
				image1 = nnName + "." + getExtension(image2);
				
				fileSize = mf.get(i).getSize(); // 파일 사이즈
				
				String savePath = uploadPath + image1; // 저장 될 파일 경로
				 
                mf.get(i).transferTo(new File(savePath)); // 파일 저장
                
                rpVo = new roomPhotoVo(image1, image2);
                list.add(rpVo);
            }
        }
        
        
        vo.setRooms_serial(Integer.parseInt(req.getParameter("rooms_name")));
       
		
		int result = dao.modify(vo, list, delList, photoNum);
		
		
		// 업로드 파일 삭제 해주어야함
		// getAttLIst 에서 filePath에 있는 파일 delete
		//mv.addObject("serial", serial);
		mv.addObject("result", result);
		mv.setViewName("hotel_room_list");
		return mv;
	}
	
	@RequestMapping(value="/admin/partner/hotel_room_delete.ph", method= {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView delete(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		roomVo vo = new roomVo(); 
		// partner_serial 구하기 
		
		
		int place_serial = Integer.parseInt(req.getParameter("place_serial"));
		
		vo.setPlace_serial(place_serial);
		vo.setRooms_serial(Integer.parseInt(req.getParameter("rooms_name")));
		
		List<roomPhotoVo> delList = dao.getAttList(place_serial);
		int result = dao.delete(vo, delList);
		
		mv.addObject("result", result);
		mv.addObject("vo", vo);
		mv.setViewName("hotel_room_list");
		return mv;
	}
	
}
