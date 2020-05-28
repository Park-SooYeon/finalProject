package review;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bean.Page;
import bean.ReviewVo;

@Controller
public class ReviewController {
	ReviewDao dao;
	
	public ReviewController(ReviewDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value = "review_select.rv", method= {RequestMethod.GET})
	public ModelAndView select(HttpServletRequest req) {
		System.out.println("실행됨?");
		ModelAndView mv = new ModelAndView();
		Page p = new Page();
		p.setFindStr(req.getParameter("findStr"));
		if(req.getParameter("nowPage") == null) {
			p.setNowPage(1);
		}else {
			p.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		}
		List<ReviewVo> list = dao.select(p);
		
		
		return mv;
	}
	
	
	@RequestMapping(value = "review_insert.rv", method= {RequestMethod.GET})
	public ModelAndView insert() {		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("review_insert");
		
		return mv;
	}
	
	
	@RequestMapping(value = "review_insertR.rv", method= {RequestMethod.POST})
	public ModelAndView insertR(HttpServletRequest req, HttpServletResponse resp) {		
		ModelAndView mv = new ModelAndView();
		String msg = null;
		HttpSession session = req.getSession();
		String member_id = (String)session.getAttribute("member_id");		
		int place_serial = Integer.parseInt(req.getParameter("place_serial"));
		System.out.println("시리얼값" + place_serial);
		int reputation = Integer.parseInt(req.getParameter("reputation"));
		String review_title = req.getParameter("review_title");
		String review_content = req.getParameter("review_content");
		
		//방문일 뉴데이트에서 먼스 마이너스 연산 처리 후 입력
		//Date 를 Calendar 맵핑
		int date = Integer.parseInt(req.getParameter("visit_date"));
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");        
        cal.add(Calendar.MONTH, -date);
        System.out.println("after: " + df.format(cal.getTime()));
        String visit_date = df.format(cal.getTime());
        
		
		
		
		mv.setViewName("detailView");
		return mv;
	}
	
	
	
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
            
            /* 기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
            
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
	
	
	
	
	

}
