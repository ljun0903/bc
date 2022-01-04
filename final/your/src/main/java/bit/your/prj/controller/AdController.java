package bit.your.prj.controller;



import java.io.PrintWriter;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.your.prj.dto.CCDto;
import bit.your.prj.dto.IncomeDto;
import bit.your.prj.dto.MarketDto;
import bit.your.prj.dto.MemberDto;
import bit.your.prj.dto.RecipeDto;
import bit.your.prj.param.Param;
import bit.your.prj.service.AdService;
import bit.your.prj.service.MemberService;

@Controller
public class AdController {
	
	static Logger log = LoggerFactory.getLogger(AdController.class);
	
	@Autowired
	AdService service;
	@Autowired
	MemberService memservice;
	
	// 회원정보 List , paging
	@RequestMapping(value = "allmemlist.do", method = RequestMethod.GET)
	public String allmemlist(Model model, Param param ) {
		log.info("AdController allmemlist() " + new Date());
		
		int sn = param.getPageNumber();	// 0 1 2 3 4
		int start = 1 + sn * 30;	// 1  11
		int end = (sn + 1) * 30;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MemberDto> list = service.allmemlist(param);
		model.addAttribute("allmemlist",list);
		
		
		
		
		int totalCount = service.getMemCount(param);
		model.addAttribute("totalCount", totalCount);
		System.out.println("토탈카운트"+totalCount);
		
		model.addAttribute("pageNumber", param.getPageNumber() + 1);
		
		model.addAttribute("search", param.getSearch());
		model.addAttribute("choice", param.getChoice());
		
		
		return "allmemlist.tiles";
	}
 
	//회원정보 excel다운로드
	@RequestMapping(value = "excelDown.do")
	public void excelDown(HttpServletResponse response) throws Exception{
		
		List<MemberDto> list = service.excellist();
		
		// 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("회원정보");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
		
	    // 테이블 헤더 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선 설정
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터 격자
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이디");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("닉네임");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생년월일");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("회원상태");
	    cell = row.createCell(9);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("가입일자");

	    // 데이터 부분 생성
	    for(MemberDto dto : list) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getSeq());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getId());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getName());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getNickname());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getBirth());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getGender());
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getEmail());
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getAddress1());
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getAuth());
	        cell = row.createCell(9);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getJoindate().substring(0, 11));
	    }
	    
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=AllMemberList.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();		
	}
	
	@RequestMapping(value = "sellchart.do", method = RequestMethod.GET)
	public String home(Model model) {
		System.out.println("AdController sellchart()");
		
		// 회원성별 통계
		int mencount = service.getMenCount();
		int womencount = service.getWomenCount();
		// 총 카운트 
		int allmemcount = service.getAllMemCount();
		int allrecipecount = service.getAllRecipeCount();
		int allclasscount = service.getAllClassCount();
		int allmarketcount = service.getAllMarketCount();
		
		model.addAttribute("mencount",mencount);
		model.addAttribute("womencount",womencount);
		model.addAttribute("allmemcount",allmemcount);
		model.addAttribute("allrecipecount",allrecipecount);
		model.addAttribute("allclasscount",allclasscount);
		model.addAttribute("allmarketcount",allmarketcount);
		
		// 매출통계
		String jan = service.jan();
		model.addAttribute("jan",jan);
		
		String feb = service.feb();
		model.addAttribute("feb",feb);
		
		String mar = service.mar();
		model.addAttribute("mar",mar);
		
		String apr = service.apr();
		model.addAttribute("apr",apr);
		
		String may = service.may();
		model.addAttribute("may",may);
		
		String jun = service.jun();
		model.addAttribute("jun",jun);
		
		String jul = service.jul();
		model.addAttribute("jul",jul);
		
		String aug = service.aug();
		model.addAttribute("aug",aug);
		
		String sep = service.sep();
		model.addAttribute("sep",sep);
		
		String oct = service.oct();
		model.addAttribute("oct",oct);
		
		String nov = service.nov();
		model.addAttribute("nov",nov);
		
		String dec = service.dec();
		model.addAttribute("dec",dec);
		
		// 분류별 매출내역
		String meat = service.meat();
		model.addAttribute("meat",meat);
		String seefood = service.seefood();
		model.addAttribute("seefood",seefood);
		String vegetable = service.vegetable();
		model.addAttribute("vegetable",vegetable);
		String fruit = service.fruit();
		model.addAttribute("fruit",fruit);
		String mealkit = service.mealkit();
		model.addAttribute("mealkit",mealkit);
		
		return "sellchart.tiles";
	}
	
	//통계 끝
	
	// 레시피 
	@RequestMapping(value = "allrecipelist.do", method = RequestMethod.GET)
	public String allrecipelist(Model model, Param param ) {
		log.info("AdController allrecipelist() " + new Date());
		
		int sn = param.getPageNumber();	// 0 1 2 3 4
		int start = 1 + sn * 20;	// 1  11
		int end = (sn + 1) * 20;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<RecipeDto> list = service.allrecipelist(param);
		model.addAttribute("allrecipelist",list);
		
		int totalCount = service.getRecipeCount(param);
		model.addAttribute("totalCount", totalCount);
		System.out.println("토탈카운트"+totalCount);
		
		model.addAttribute("pageNumber", param.getPageNumber() + 1);
		
		model.addAttribute("search", param.getSearch());
		model.addAttribute("choice", param.getChoice());
		
		
		return "allrecipelist.tiles";
	}
	
	//레시피 엑셀 다운로드
	@RequestMapping(value = "recipeexcelDown.do")
	public void recipeexcelDown(HttpServletResponse response) throws Exception{
		
		List<RecipeDto> list = service.recipeexcellist();
		
		// 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("레시피등록글");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
		
	    // 테이블 헤더 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선 설정
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터 격자
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("번호");
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이디");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("제목");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("카테고리");
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("조회수");
	    
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("좋아요수");
	    

	    // 데이터 부분 생성
	    for(RecipeDto dto : list) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getSeq());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getId());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getRecipetitle());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getReccategory());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getReadcount());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getLiked());  
	    }
	    
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=AllrecipeList.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();		
	}
	// 레시피 끝
	
	
	
	
	// 쿠킹클래스
	@RequestMapping(value = "allclasslist.do", method = RequestMethod.GET)
	public String allclasslist(Model model, Param param ) {
		log.info("AdController allrecipelist() " + new Date());
		
		int sn = param.getPageNumber();	// 0 1 2 3 4
		int start = 1 + sn * 20;	// 1  11
		int end = (sn + 1) * 20;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<CCDto> list = service.allclasslist(param);
		model.addAttribute("allclasslist",list);
		
		int totalCount = service.getClassCount(param);
		model.addAttribute("totalCount", totalCount);
		System.out.println("토탈카운트"+totalCount);
		
		model.addAttribute("pageNumber", param.getPageNumber() + 1);
		
		model.addAttribute("search", param.getSearch());
		model.addAttribute("choice", param.getChoice());
		
		
		return "allclasslist.tiles";
	}
	
	// 쿠킹클래스엑셀 다운
	@RequestMapping(value = "ccexcelDown.do")
	public void ccexcelDown(HttpServletResponse response) throws Exception{
		
		List<CCDto> list = service.ccexcellist();
		
		// 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("레시피등록글");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
		
	    // 테이블 헤더 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선 설정
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터 격자
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("번호");
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("클래스강사");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("클래스명");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("분류");
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("수업시작일");
	    
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("수업종료일");
	    
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("장소");
	    
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("참여회원수");
	    
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("모집인원수");
	    
	    // 데이터 부분 생성
	    for(CCDto dto : list) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getSeq());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getNickname());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getTitle());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getKinds());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getCdate1());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getCdate2());
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getLocation());
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getMembercount());
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getMembernum());
	    }
	    
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=AllCCList.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();		
	}
	
	
	// 판매리스트
	@RequestMapping(value = "allmarketlist.do", method = RequestMethod.GET)
	public String allmarketlist(Model model, Param param ) {
		log.info("AdController allmarketlist() " + new Date());
		
		int sn = param.getPageNumber();	// 0 1 2 3 4
		int start = 1 + sn * 20;	// 1  11
		int end = (sn + 1) * 20;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<MarketDto> list = service.allmarketlist(param);
		model.addAttribute("allmarketlist",list);
		
		int totalCount = service.getMarketCount(param);
		model.addAttribute("totalCount", totalCount);
		System.out.println("토탈카운트"+totalCount);
		
		model.addAttribute("pageNumber", param.getPageNumber() + 1);
		
		model.addAttribute("search", param.getSearch());
		model.addAttribute("choice", param.getChoice());
		
		
		return "allmarketlist.tiles";
	}
	//판매리스트 엑셀다운
	@RequestMapping(value = "marketexcelDown.do")
	public void marketexcelDown(HttpServletResponse response) throws Exception{
		
		List<MarketDto> list = service.marketexcellist();
		
		// 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("레시피등록글");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
		
	    // 테이블 헤더 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선 설정
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 배경색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 가운데 정렬
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터 격자
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품번호");
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이템번호");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("판매상품명");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("서브상품명");
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품원산지");
	    
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품가격");
	    
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품등록일");
	    
	  
	    // 데이터 부분 생성
	    for(MarketDto dto : list) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getSeq());
	        
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getItemnum());
	        
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getTitle());
	        
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getSubtitle());
	        
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getCountry());
	        
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getPrice());
	        
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dto.getRdate());
	        
	       
	    }
	    
	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=AllMarketList.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();		
	}
	
	
	//admin login
	@RequestMapping(value = "adlogin.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public String adminlogin() {
		log.info("MemberController adminlogin() " + new Date());
		
		return "adminlogin.tiles";
		
	}
	@ResponseBody
	@RequestMapping(value = "adminloginAf.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public void adminloginAf(MemberDto dto, HttpServletRequest req, Model model, HttpServletResponse resp) throws Exception {
		log.info("MemberController adminloginAf() " + new Date());
		
		MemberDto login = memservice.login(dto);
		if(login != null && !login.getId().equals("")) {
//			System.out.println("로그인되었습니다");
			req.getSession().setAttribute("login", login);
			req.getSession().setMaxInactiveInterval(60 * 60 * 24);
			
			 resp.setContentType("text/html; charset=utf-8");
		      PrintWriter out = resp.getWriter();
		      out.println("<script>location.href='sellchart.do'; </script> ");
		      out.close();
		      out.flush();			
		}else {
			System.out.println("로그인 실패하였습니다");
			      resp.setContentType("text/html; charset=utf-8");
			      PrintWriter out = resp.getWriter();
			      out.println("<script>alert('로그인 실패하였습니다'); location.href='adminlogin.do'; </script> ");
			      out.close();
			      out.flush();
			}
		}
	
	// income 리스트
		@RequestMapping(value = "allincomelist.do", method = RequestMethod.GET)
		public String allincomelist(Model model, Param param ) {
			log.info("AdController allincomelist() " + new Date());
			
			int sn = param.getPageNumber();	// 0 1 2 3 4
			int start = 1 + sn * 30;	// 1  11
			int end = (sn + 1) * 30;	// 10 20 
			
			param.setStart(start);
			param.setEnd(end);
			
			List<IncomeDto> list = service.allincomelist(param);
			model.addAttribute("allincomelist",list);
			
			int totalCount = service.getIncomeCount(param);
			model.addAttribute("totalCount", totalCount);
			System.out.println("토탈카운트"+totalCount);
			
			model.addAttribute("pageNumber", param.getPageNumber() + 1);
			
			model.addAttribute("search", param.getSearch());
			model.addAttribute("choice", param.getChoice());
			
			
			return "allincomelist.tiles";
		}
	

		//판매리스트 엑셀다운
		@RequestMapping(value = "incomeexcelDown.do")
		public void incomeexcelDown(HttpServletResponse response) throws Exception{
			
			List<IncomeDto> list = service.incomeexcellist();
			
			// 워크북 생성
		    Workbook wb = new HSSFWorkbook();
		    Sheet sheet = wb.createSheet("판매내역");
		    Row row = null;
		    Cell cell = null;
		    int rowNo = 0;
			
		    // 테이블 헤더 스타일
		    CellStyle headStyle = wb.createCellStyle();

		    // 가는 경계선 설정
		    headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);

		    // 헤더 배경색
		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		    // 가운데 정렬
		    headStyle.setAlignment(HorizontalAlignment.CENTER);

		    // 데이터 격자
		    CellStyle bodyStyle = wb.createCellStyle();
		    bodyStyle.setBorderTop(BorderStyle.THIN);
		    bodyStyle.setBorderBottom(BorderStyle.THIN);
		    bodyStyle.setBorderLeft(BorderStyle.THIN);
		    bodyStyle.setBorderRight(BorderStyle.THIN);

		    // 헤더 생성
		    row = sheet.createRow(rowNo++);
		    cell = row.createCell(0);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("순서");
		    
		    cell = row.createCell(1);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("상품번호");
		    
		    cell = row.createCell(2);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("주문번호");
		    
		    cell = row.createCell(3);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("구매상품명");
		    
		    cell = row.createCell(4);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("구매수량");
		    
		    cell = row.createCell(5);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("판매가격");
		    
		    cell = row.createCell(6);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("결제일");
		    
		  
		    // 데이터 부분 생성
		    for(IncomeDto dto : list) {
		        row = sheet.createRow(rowNo++);
		        cell = row.createCell(0);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(dto.getSeq());
		        
		        cell = row.createCell(1);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(dto.getItemnum());
		        
		        cell = row.createCell(2);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(dto.getOrdernum());
		        
		        cell = row.createCell(3);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(dto.getTitle());
		        
		        cell = row.createCell(4);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(dto.getCount());
		        
		        cell = row.createCell(5);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(dto.getPrice());
		        
		        cell = row.createCell(6);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(dto.getPdate());
		        
		       
		    }
		    
		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=AllIncomeList.xls");

		    // 엑셀 출력
		    wb.write(response.getOutputStream());
		    wb.close();		
		}
	
	
	
}
