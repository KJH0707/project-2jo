package com.fork.store.action;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StoreUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : StoreUpdateProAction_execute() ");
		 
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int c_no = (Integer) session.getAttribute("c_no");
		int s_no =  (Integer)session.getAttribute("s_no");
		
		System.out.println(id);
		System.out.println(c_no);
		System.out.println(s_no);
		
		ActionForward forward = new ActionForward();
		if(id == null || c_no == 0) { 
			forward.setPath("./Login.us"); 
			forward.setRedirect(true);
			return forward;
		}
		
		ServletContext CTX = request.getServletContext();
		String realPath = CTX.getRealPath("/upload");
		//System.out.println(" M : realPath : " + realPath);
		int maxSize = 10 * 1024 * 1024; // 10MB
		
		MultipartRequest multi 
		= new MultipartRequest(
				request, 
				realPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
				
		// 가게정보 저장 (DTO) - 가게이름, 전화번호, 분류, 식당소개, 주소, 편의시설, 메뉴이름, 메뉴가격, 운영시간, 가게사진, 메뉴사진, 점주번호(c_no)
		StoreDTO dto = new StoreDTO();
		
		dto.setS_name(multi.getParameter("storeName"));
		dto.setS_tel(multi.getParameter("tel"));
		dto.setS_type(multi.getParameter("sort"));
		dto.setS_price(Integer.parseInt(multi.getParameter("priceSort")));
		dto.setS_content(multi.getParameter("discrition"));
		System.out.println(multi.getParameter("priceSort"));
		
		// address223 - 현재 주소 / Addr1 - 바꿀 주소
		//System.out.println(multi.getParameter("address223"));
		//System.out.println(multi.getParameter("Addr1"));
		 
		if(multi.getParameter("Addr1").length()==0) { // 변경주소가 없는 경우
			dto.setS_addr(multi.getParameter("address223"));
		}else {
			String addrArr = multi.getParameter("Addr1")+" "+ multi.getParameter("Addr2");
			dto.setS_addr(addrArr);
		}
		
		System.out.println(" M : dto :"+dto);		
		
		String facArr = multi.getParameter("facility1")+"," 
						  + multi.getParameter("facility2")+"," 
						  + multi.getParameter("facility3")+"," 
						  + multi.getParameter("facility4")+"," 
						  + multi.getParameter("facility5");
		if(facArr!=null) {
			dto.setS_facility(facArr);
		}
				 
		String MNArr = multi.getParameter("menuName1")+","
						+ multi.getParameter("menuName2")+","
						+ multi.getParameter("menuName3")+","
						+ multi.getParameter("menuName4")+","
						+ multi.getParameter("menuName5");
		if(MNArr!=null) {
			dto.setS_menuname(MNArr);
		}	
		
		String MPArr = multi.getParameter("menuPrice1")+","
						+ multi.getParameter("menuPrice2")+","
						+ multi.getParameter("menuPrice3")+","
						+ multi.getParameter("menuPrice4")+","
						+ multi.getParameter("menuPrice5");
		if(MPArr!=null) {
			dto.setS_menuprice(MPArr);
		}			
				
		// 영업시간 정보
		if(multi.getParameter("openTime")!=null || multi.getParameter("closeTime")!=null) {
			dto.setS_hours(multi.getParameter("openTime")+"~"+multi.getParameter("closeTime"));
		}		
		
		// 가게 이미지
		String stfile1 = multi.getFilesystemName("stfile1");
		String stfile2 = multi.getFilesystemName("stfile2");
		String stfile3 = multi.getFilesystemName("stfile3");
		String originFile1 = multi.getFilesystemName("originMainImg");
		String originFile2 = multi.getFilesystemName("originMainImg2");
		String originFile3 =  multi.getFilesystemName("originMainImg3");
		String stImg = null;
		String orStImg = null;
		
		if(stfile1!=originFile1 || stfile2!=originFile2 || stfile3!=originFile3 || stfile1!=null || stfile2!=null || stfile3!=null ) {
			stImg = stfile1+","+ stfile2+","+stfile3;
			dto.setS_image(stImg);
		}else { // 사진을 바꾸지 않았다면
			orStImg = originFile1+","+originFile2+","+originFile3;
			dto.setS_image(orStImg);
		}
		
		//System.out.println(" M : 변경된 img : "+ stImg);
		//System.out.println(" M : 초기 img : "+ orStImg);
				
		// 메뉴 이미지
		String mfile1 = multi.getFilesystemName("mfile1");
		String mfile2 = multi.getFilesystemName("mfile2");
		String mfile3 = multi.getFilesystemName("mfile3");
		String mfile4 = multi.getFilesystemName("mfile4");
		String mfile5 = multi.getFilesystemName("mfile5");
		String orignMFile1 = multi.getFilesystemName("originMenuImg1");
		String orignMFile2 = multi.getFilesystemName("originMenuImg2");
		String orignMFile3 =  multi.getFilesystemName("originMenuImg3");
		String orignMFile4 =  multi.getFilesystemName("originMenuImg4");
		String orignMFile5 =  multi.getFilesystemName("originMenuImg5");
		String mImg = null;
		String orMImg = null;
		
		if(mfile1!=orignMFile1 || mfile2!=orignMFile2 || mfile3!=orignMFile3 || mfile4!=orignMFile4 || mfile5!=orignMFile5 || mfile1!=null || mfile2!=null || mfile3!=null || mfile4!=null || mfile5!=null ){
			mImg = mfile1+","+mfile2+","+mfile3+","+mfile4+","+mfile5;
			dto.setS_menuImg(mImg);
		}else { // 사진을 바꾸지 않았다면
			orMImg = orignMFile1+","+orignMFile2+","+orignMFile3+","+orignMFile4+","+orignMFile5;
			dto.setS_menuImg(orMImg);
		}
		//System.out.println(" M : 변경된 메뉴img : "+ mImg);
		//System.out.println(" M : 초기 메뉴img : "+ orMImg);
		
		
		// c_no, s_no 설정
		dto.setC_no(c_no); // 점주번호
		dto.setS_no(s_no); // 가게번호
		System.out.println(" M : dto : "+dto);
		
		// dao - 수정메서드
		StoreDAO dao = new StoreDAO();
		dao.updateStore(dto);
		
		// request영역에 저장
		forward.setPath("./CeoMyPage_st.us");
		forward.setRedirect(true);
		// 페이지 이동
		return forward;
	}

}
