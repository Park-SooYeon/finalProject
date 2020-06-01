package service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import vo.RestDataVo;

public interface ApiService {

	public List<RestDataVo> getAreaBasedList(String menu, String local);
	
	public List<RestDataVo> getDetailCommon(String menu);
	
	public StringBuilder getFilterList(String menu, List<String> local, List<String> filter, String findStr, String pageNum);

}
