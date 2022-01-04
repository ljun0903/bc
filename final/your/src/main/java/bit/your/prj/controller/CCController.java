package bit.your.prj.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bit.your.prj.util.CalendarUtil;
import bit.your.prj.util.PdsUtil;
import bit.your.prj.dto.CCDto;
import bit.your.prj.dto.CMDto;
import bit.your.prj.dto.CalendarDto;
import bit.your.prj.dto.MemberDto;
import bit.your.prj.param.ClassParam;
import bit.your.prj.service.CCService;
import bit.your.prj.service.CalendarService;

@Controller
public class CCController {
	
	@Autowired
	CCService service;
	
	@Autowired
	CalendarService service2;
	
	/*
	@RequestMapping(value = "cclist.do", method = RequestMethod.GET) 
	public String cclist(Model model) {
		model.addAttribute("doc_title", "글목록");
		
		List<CCDto> list = service.getCClist();
		model.addAttribute("cclist", list);
		
		return "cclist.tiles";
	}
	*/
	
	@RequestMapping(value = "cclist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cclist(Model model, ClassParam param, HttpServletRequest request) { 
		model.addAttribute("doc_title", "글목록");
	 	
		int sn = param.getPageNumber(); 
	 	int start = 1 + sn * 12; 
	 	int end = (sn + 1) * 12;
	 	
	  	param.setStart(start); 
	  	param.setEnd(end);
		
	 	List<CCDto> list = service.getCClist(param);
	 	model.addAttribute("cclist", list);
	 
	 	MemberDto login = (MemberDto)request.getSession().getAttribute("login");
		String nickname = login.getNickname();
		List<Map<String, Object>> list2 = service.getNickNameCM(nickname);
		//System.out.println("list2>>>" + list2);
		model.addAttribute("cmlist", list2);
		
	  	int totalCount = service.getCCCount(param); 
	  	model.addAttribute("totalCount", totalCount);
	    model.addAttribute("pageNumber", param.getPageNumber() + 1);
	    
	    model.addAttribute("check", param.getCheck());
	 	model.addAttribute("search", param.getSearch()); 
	 	model.addAttribute("choice", param.getChoice());
	 	model.addAttribute("category", param.getCategory());
	  	
	 	return "cclist.tiles"; 
	 }
	 
	@RequestMapping(value = "ccwrite.do", method = RequestMethod.GET)
	public String ccwrite(Model model) {
		model.addAttribute("doc_title", "자료 올리기");
		
		return "ccwrite.tiles";
	}
	
	@RequestMapping(value = "ccupload.do", method = RequestMethod.POST)
	public String ccupload(CCDto ccdto,
							@RequestParam("sample2_address") String location1,
							@RequestParam("sample2_detailAddress") String location2,
							//@RequestParam("cdate1") String cdate1,
							//@RequestParam("cdate2") String cdate2,
							@RequestParam(value = "fileload", required = false)
							MultipartFile fileload,
							HttpServletRequest req) throws ParseException{
		
		//주소합치기
		String location = location1 + ", " + location2;
		ccdto.setLocation(location);
		
		//ccdto.setCdate1(cdate1);
		//ccdto.setCdate2(cdate2);
		
		// filename(원본) 취득
		String filename = fileload.getOriginalFilename();
		ccdto.setFilename(filename);	// DB에 저장하기 위해서 원파일명을 넣어 준다
		
		// upload 경로설정
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
	//	String fupload = "d:\\tmp";
		
		System.out.println("fupload:" + fupload);
		
		// 파일명 변경
		String newfilename = PdsUtil.getNewFileName(ccdto.getFilename());
		ccdto.setNewfilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		
		try {
			// 실제로 업로드
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// DB에 저장
			service.uploadCC(ccdto);
			
			System.out.println("ccdto.getSeq()>>>>>>>>>>>>>>>>>>>>"  + ccdto.getSeq());
			
			List<Integer> dto = service.getNowCC(ccdto);
		
			int seq_class = dto.get(0);
			String title = ccdto.getTitle();
			String cdate1 = ccdto.getCdate1();
			String cdate2 = ccdto.getCdate2();
			String cday = ccdto.getCday();
			String nickname = ccdto.getNickname();
			
			//날짜 형식 바꾸기 ex)2021-09-03 -> 20210903 
			//시작날
			String yyyy1 = cdate1.substring(0, 4);
			String mm1 = cdate1.substring(5, 7);
			String dd1 = cdate1.substring(8, 10);
			String cdate3 = yyyy1+ mm1 + dd1;
				
			//마지막날
			String yyyy2 = cdate2.substring(0, 4);
			String mm2 = cdate2.substring(5, 7);
			String dd2 = cdate2.substring(8, 10);
			String cdate4 = yyyy2+ mm2 + dd2;
			
			//날짜들을 담을 배열
			ArrayList<String> dates = new ArrayList<String>();
					
			//요일을 한글자씩 담을 배열
			char[] array_word = new char[cday.length()];
					
			//요일을 숫자로 변환하여 담을 배열
			List<Integer> days = new ArrayList<Integer>();
			
			for(int i=0; i<array_word.length; i++){ 
				array_word[i]=(cday.charAt(i));	//요일을 한글자씩 배열에 저장
				
				days.add(CalendarUtil.Switch(array_word[i])); //한글자씩 구분하여 숫자로 변화하여 담는다
			}	
			
			Calendar cal = Calendar.getInstance();
			DateFormat df = new SimpleDateFormat("yyyyMMdd");
			
			String StartDate = cdate3;
			String EndDate = cdate4;
			
			Date d1 = df.parse(StartDate);
			Date d2 = df.parse(EndDate);
					
			Date currentDate = d1;
					
			while (currentDate.compareTo(d2) <= 0){
				cal.setTime(currentDate);
				int num = cal.get(Calendar.DAY_OF_WEEK);
			
				//시작날이 여러 수업요일에 포함되어있는가? 포함되어있으면 배열추가
				if(days.contains(num)) {
					dates.add(df.format(currentDate));
					cal.add(Calendar.DAY_OF_MONTH, 1);
					currentDate = cal.getTime();
				//다르면 다른날로 넘김
				}else {
					cal.add(Calendar.DAY_OF_MONTH, 1);
					currentDate = cal.getTime();
				}
			}
			
			List<CalendarDto> list = new ArrayList<CalendarDto>();
			
			for (int j = 0; j < dates.size(); j++) {
				//dto에 날짜와 파라미터를 담는다
				CalendarDto tempDto = new CalendarDto();
				tempDto.setSeq_class(seq_class);
				tempDto.setNickname(nickname);
				tempDto.setTitle(title);
				tempDto.setCdate(dates.get(j));
				list.add(tempDto);
			}	
			
			System.out.println("list>>>>>>>>>" + list.toString());
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			for(CalendarDto dto1 : list) {
		        service2.writeTeachCalendar(dto1);	
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/cclist.do";
	}
	
	@RequestMapping(value = "ccdetail.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String ccdetail(int seq, Model model, HttpServletRequest request) {
		model.addAttribute("doc_title", "상세글 보기");
			  
		service.readCount(seq); // 조회수 증가
			  
		CCDto cc = service.getCC(seq); 
		model.addAttribute("cc", cc);
		
		int count = service.getCMCount(seq);
		model.addAttribute("cmc", count);
		
		
		List<CMDto> list = service.getCM(seq);
		model.addAttribute("cmlist", list);
		
		MemberDto login = (MemberDto)request.getSession().getAttribute("login");
		String nickname = login.getNickname();
		boolean check = list.toString().contains(nickname);
		model.addAttribute("check", check);
		
		return "ccdetail.tiles"; 
	}
	
	@RequestMapping(value = "ccdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(int seq, Model model) {		
		service.deleteCC(seq);
		service2.deleteMemberCal(seq);
		return "redirect:/cclist.do";		
	}

	@RequestMapping(value = "ccupdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String ccupdate(int seq, Model model) {
		model.addAttribute("doc_title", "자료 수정");
		
		// dto 취득
		CCDto ccdto = service.getCC(seq);
		model.addAttribute("cc", ccdto);
		
		return "ccupdate.tiles";
	}
	
	@RequestMapping(value = "ccupdateAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String ccupdateAf(	CCDto ccdto, 
								String namefile,	// 기존의 파일 명,
								String newnamefile,
								HttpServletRequest req,
								@RequestParam("sample2_address") String location1,
								@RequestParam("sample2_detailAddress") String location2,
								@RequestParam(value = "fileload", required = false)MultipartFile fileload) {
		
		//주소합치기
		String location = location1 + ", " + location2;
		ccdto.setLocation(location);
		System.out.println(location.toString());

		ccdto.setFilename(fileload.getOriginalFilename());
		
		// 파일 경로
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 수정할 파일이 있음
		if(ccdto.getFilename() != null && !ccdto.getFilename().equals("")) {
			
			String f = ccdto.getFilename();
			String newfilename = PdsUtil.getNewFileName(f);
			
			ccdto.setFilename(f);
			ccdto.setNewfilename(newfilename);
			
			File file = new File(fupload + "/" + newfilename);			
			
			try {
				// 실제 업로드
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				// DB 갱신
				service.updateCC(ccdto);		
				
			} catch (IOException e) {				
				e.printStackTrace();
			}			
		}
		else {	// 수정할 파일 없음
			
			// 기존의 파일명으로 설정
			ccdto.setFilename(namefile);
			ccdto.setNewfilename(newnamefile);
			
			// DB
			service.updateCC(ccdto);	
			
		}
		
		return "redirect:/cclist.do";
	}
	
	@RequestMapping(value = "enterCM.do", method = RequestMethod.GET)
	public String enterCM(Model model, CMDto dto,
									@RequestParam("seq_class") int seq_class,
									@RequestParam("nickname") String nickname,
									@RequestParam("gender") String gender) {		
		model.addAttribute("doc_title", "참여하기");
		dto.setSeq_class(seq_class);
		dto.setNickname(nickname);
		dto.setGender(gender);
		//System.out.println(dto.toString());
		
		service.memberCount(seq_class);
		
		boolean b = service.enterCM(dto);
		
		if(b) {
			System.out.println("성공");
			return "cclist.tiles";
		}
		System.out.println("실패");
			return "cclist.tiles";
	}
	
	@RequestMapping(value="resignCM.do", method = RequestMethod.GET)
	public String resignCM(Model model, CMDto dto,
						 @RequestParam("seq_class") int seq_class,
						 @RequestParam("nickname") String nickname) {
		model.addAttribute("doc_title", "탈퇴하기");
		
		dto.setSeq_class(seq_class);
		dto.setNickname(nickname);
		
		service.memberCountDown(seq_class);
		
		service.resignCM(dto);
		
		return "cclist.tiles";
	}
	
	/////////효제추가/////////
	@RequestMapping(value="managing_cc.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String managing_cc(Model model, HttpServletRequest request) throws Exception {
	    
		MemberDto login = (MemberDto)request.getSession().getAttribute("login");
	    String nickname = login.getNickname();
		
	 	List<CCDto> list = service.mycclist(nickname); 
	 	System.out.println(nickname);
	 	
	 	model.addAttribute("mycclist", list);
	 	System.out.println(list);
	 	

		return "managing_cc.tiles";
	
	}
	
	@RequestMapping(value="mycc.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String myclass(Model model, HttpServletRequest request) throws Exception {
		
		MemberDto login = (MemberDto)request.getSession().getAttribute("login");
	    String nickname = login.getNickname();
	    
	    List<Map<String, Object>> list = service.myclass(nickname); 
	 	System.out.println(nickname);
	 	
	 	
	 	model.addAttribute("myclass", list);
	 	System.out.println(list);
		
		return "mycc.tiles";
	}
	
}
