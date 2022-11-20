package com.fork.store.action;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;
import com.fork.user.db.CeoDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StoreJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : StoreJoinProAction_execute() 호출");
		
		// 한글처리(생략)
		// 정보 처리
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int c_no = (Integer)session.getAttribute("c_no");
		
		String cno = String.valueOf(c_no);
		//System.out.println(id);
		//System.out.println(c_no);
		ActionForward forward = new ActionForward();
		if(id == null || cno == null) {
			forward.setPath("./Login.us"); 
			forward.setRedirect(true);
			return forward;
		}
		
		// 첨부파일
		ServletContext CTX = request.getServletContext();
		String realPath = CTX.getRealPath("/upload");
		System.out.println(" M : realPath : " + realPath);
		int maxSize = 10 * 1024 * 1024; // 10MB
		
		MultipartRequest multi 
						= new MultipartRequest(
										request, 
										realPath,
										maxSize,
										"UTF-8",
										new DefaultFileRenamePolicy()
										);
		
		// 가게정보 저장 (DTO) - 가게이름, 전화번호, 분류, 식당소개, 사업자번호, 주소, 편의시설, 메뉴이름, 메뉴가격, 운영시간, 가게사진, 메뉴사진, 점주번호(c_no)
		StoreDTO dto = new StoreDTO();
		dto.setS_name(multi.getParameter("storeName"));
		dto.setS_tel(multi.getParameter("tel"));
		dto.setS_type(multi.getParameter("sort"));
		dto.setS_price(Integer.parseInt(multi.getParameter("priceSort")));
		dto.setS_content(multi.getParameter("discrition"));
		dto.setS_number(Integer.parseInt(multi.getParameter("businessNumber")));
		
		// 주소
		String addrArr = multi.getParameter("Addr1")+" "+ multi.getParameter("Addr2");
		dto.setS_addr(addrArr);
		System.out.println(addrArr);
		
		
		
		
		  String facArr = multi.getParameter("facility1")+"," 
						  + multi.getParameter("facility2")+"," 
						  + multi.getParameter("facility3")+"," 
						  +multi.getParameter("facility4")+"," 
						  + multi.getParameter("facility5");
		  dto.setS_facility(facArr);
		 
		
		/*  step2 편의시설의 추가 정보를 저장하는 콘텐츠를 사용하려면 사용 - 추가로 할 일 1) db에 컬럼추가 2) dao에 sql문 변경, pstmt.setString()으로 추가
		 * String FDArr = multi.getParameter("facDisc1")+"," +
		 * multi.getParameter("facDisc2")+"," + multi.getParameter("facDisc3")+"," +
		 * multi.getParameter("facDisc4")+"," + multi.getParameter("facDisc5");
		 * dto.setS_facilityContents(FDArr);
		 */
		
		String MNArr = multi.getParameter("menuName1")+","
						+ multi.getParameter("menuName2")+","
						+ multi.getParameter("menuName3")+","
						+ multi.getParameter("menuName4")+","
						+ multi.getParameter("menuName5");
		
		dto.setS_menuname(MNArr);
		
		String MPArr = multi.getParameter("menuPrice1")+","
						+ multi.getParameter("menuPrice2")+","
						+ multi.getParameter("menuPrice3")+","
						+ multi.getParameter("menuPrice4")+","
						+ multi.getParameter("menuPrice5");
		dto.setS_menuprice(MPArr);
		
		
		// 영업시간 정보
		dto.setS_hours(multi.getParameter("openTime")+"~"+multi.getParameter("closeTime"));
		
		// 가게 이미지
		String stImg = multi.getFilesystemName("stfile1")+","
						 + multi.getFilesystemName("stfile2")+","
						 + multi.getFilesystemName("stfile3");
		
		System.out.println(" M : img : "+ stImg);
		dto.setS_image(stImg);
		
		// 메뉴 이미지
		String mImg = multi.getFilesystemName("mfile1")+","
						+ multi.getFilesystemName("mfile2")+","
						+ multi.getFilesystemName("mfile3")+","
						+ multi.getFilesystemName("mfile4")+","
						+ multi.getFilesystemName("mfile5");
		dto.setS_menuImg(mImg);
		
		dto.setC_no(c_no); // 점주번호
		System.out.println("@@@@@@@@@@@"+dto);
		
		// DAO - 가게 가입 메서드 
		StoreDAO dao = new StoreDAO();
		int result = dao.storeJoin(dto, c_no); // 1대신 c_no 를 넣기
		
		// 페이지 이동
		if(result == 1) {
			System.out.println(" M :"+id+" 가게 등록 성공!"); // 
			forward.setPath("./CeoMyPage_st.us"); // 점주 마이페이지로 연결할 것
			forward.setRedirect(true);
		} else if(result == -1 ) {
			System.out.println(" M : "+id+" 비정상 접근이 발생했습니다.");
			forward.setPath("./main.st");
			forward.setRedirect(true);
		} else {
			System.out.println(" M : "+id+" 가게 등록이 되지 않았습니다.");
			forward.setPath("./StoreJoin.st"); // 점주 마이페이지 또는 가게 등록 페이지로 연결할 것
			forward.setRedirect(true); 
		}
	
		return forward;
	}
}
