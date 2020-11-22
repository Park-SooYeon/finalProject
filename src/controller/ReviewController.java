package controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.PlaceVo;
import bean.ReviewVo;
import dao.DetailViewDao;
import dao.ReviewDao;

@Controller
public class ReviewController {
	ReviewDao dao;	
	
	public static final String filePath = "/Users/choi/git/finalProject/WebContent/images/food";
	
	public ReviewController(ReviewDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "review_insert.rv", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insert(@RequestParam String code, HttpServletRequest req, Model model) {		
		ModelAndView mv = new ModelAndView();
		DetailViewDao DetailViewDao = new DetailViewDao();
		
		PlaceVo vo = DetailViewDao.view(code);
		
		mv.addObject("vo", vo);
		mv.setViewName("review_insert");
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "review_insertR.rv", method= {RequestMethod.POST})
	public ModelAndView insertR(ReviewVo vo, HttpServletRequest req, HttpServletResponse resp) {		
		System.out.println(vo.toString());
		ModelAndView mv = new ModelAndView();
		//ReviewVo vo = new ReviewVo();		
		String msg = null;
		String uploadPath = req.getSession().getServletContext().getRealPath("/images/food/");		
	    String path = req.getRealPath("/images/");//파일이 저장되는 경로
	    
	    System.out.println("uploadPath : " + uploadPath);
	    System.out.println("path : " + path);
	    
	    File dir = new File(uploadPath);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }
		
		List<MultipartFile> file = vo.getFileUpload();
		
		int place_serial = Integer.parseInt(req.getParameter("place_serial"));
		HttpSession session = req.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int reputation = Integer.parseInt(req.getParameter("reputation"));
		String review_title = req.getParameter("review_title");
		String review_content = req.getParameter("review_content");
		int review_type = Integer.parseInt(req.getParameter("review_type"));
		
		//방문일 뉴데이트에서 먼스 마이너스 연산 처리 후 입력
		//Date 를 Calendar 맵핑
		int date = Integer.parseInt(req.getParameter("visit_date"));
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");        
		cal.add(Calendar.MONTH, -date);
		String visit_date = df.format(cal.getTime());
		
		vo.setMember_id(member_id);
		vo.setPlace_serial(place_serial);
		vo.setReputation(reputation);
		vo.setReview_title(review_title);
		vo.setReview_content(review_content);
		vo.setVisit_date(visit_date);
		vo.setReview_type(review_type);

		msg = dao.insert(vo, uploadPath);
		mv.addObject("msg", msg);
		mv.addObject("code", place_serial);
		mv.setViewName("redirect:detailView.dv");
		return mv;
	}
	
	
	
	/*
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
    public String dragAndDrop(Model model) {
        
        return "fileUpload";
        
    }
    
    @RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
         
        Iterator<String> itr =  multipartRequest.getFileNames();
        
        String filePath = "C:/test"; //설정파일로 뺀다.
        
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            
             기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            
            
            MultipartFile mpf = multipartRequest.getFile(itr.next());
     
            String originalFilename = mpf.getOriginalFilename(); //파일명
     
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
     
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
     
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                         
       }
         
        return "success";
    }
    */
	
	
	
	

}
