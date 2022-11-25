package com.fork.bookmark.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.bookmark.db.BookMarkDAO;
import com.fork.bookmark.db.BookMarkDTO;
import com.fork.store.db.StoreDAO;
import com.fork.store.db.StoreDTO;

public class BookMarkCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : BasketAddAction_execute() 호출 ");
		
		// 세션제어(id)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		
		
      if(id == null) {
      forward.setPath("./loginAction.us");
      forward.setRedirect(true);
      
      return forward;
   }
   int s_no = Integer.parseInt(request.getParameter("s_no"));
   System.out.println("!!!!!!!!"+s_no);
   
   int result = Integer.parseInt(request.getParameter("result"));
   System.out.println("!!!!!!!!"+result);
   
   //전달 정보 저장
//   StoreDTO dto = new StoreDTO();
//   dto.setS_name(request.getParameter("s_name"));
//   dto.setS_addr(request.getParameter("s_addr"));
   BookMarkDAO bdao = new BookMarkDAO();
   
   if(result==0) {
      bdao.insertBookMark(id, s_no);
   } else if(result==1){
      bdao.deleteBookMark(id, s_no);
   }
//   dto.setS_star(Double.parseDouble(request.getParameter("s_star")));
   
//   System.out.println(" M : DTO : "+dto);
   // dto.setB_num(0);  B_num 은 bno, gno 처럼 계산해서 적용
   // 그러려고 정보 보내지도 않았음
   
   // 2) DB에 저장
   //   - 기존에 동일옵션의 정보가 있는지 판별
   //   - O : update   X : 정보 insert
//   BookMarkDAO dao = new BookMarkDAO();
//      int result = dao.checkBookMark(id);
//   if(!isUpdate) {
//      // 정보 insert
//      dao.checkBookMark(dto);
//      System.out.println(" M : 북마크 추가 완료");
//   }
   //11.11
   //사용자의 선택에 따라서 장바구니 페이지로 이동 할건지 아니면 원래 상품 리스트로 이동할건지 결정을 해줌 
//   String isMove = request.getParameter("isMove");
   
//   System.out.println("@@@@@@@@@"+dto);
      
   		forward.setPath("./storeDetails.st?s_no="+s_no);
      forward.setRedirect(true);
   
   
   return forward;
}

}