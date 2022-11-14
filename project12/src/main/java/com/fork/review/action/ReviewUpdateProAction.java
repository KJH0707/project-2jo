package com.fork.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.review.db.ReviewDAO;
import com.fork.review.db.ReviewDTO;

public class ReviewUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : BoardUpdateProAction_execute() 호출 ");
		
		// 한글처리(생략)
		// 전달된 데이터 저장(파라미터)
		// DTO 객체 생성
		ReviewDTO dto = new ReviewDTO();
		dto.setS_no(Integer.parseInt(request.getParameter("s_no")));
		dto.setRev_subject(request.getParameter("rev_subject"));
		dto.setRev_content(request.getParameter("Rev_content"));
		
		String pageNum = request.getParameter("pageNum");
		
		// DB에 가서 수정
		ReviewDAO dao = new ReviewDAO();
		int result = dao.updateReview(dto);
		
		System.out.println(" M : 수정완료 "+result);
		
		// 페이지 이동 (컨트롤러 X => 티켓 생성x)	
		// JS 사용 페이지 이동
		
		response.setContentType("text/html; charset=UTF-8");
		// => 응답페이지의 형태를 html 형태로 사용
		PrintWriter out = response.getWriter();
		// => 응답페이지로 출력하는 통로를 준비
		//out.print("<h1>안녕 테스트</h1>");
		
		// 아이디 같으면 수정되게 해야함
		
		if(result == 1) {
			out.print("<script>");
			out.print(" alert('수정 완료!');");
			out.print(" location.href='./ReviewList.bo?pageNum="+pageNum+"'; ");
			out.print("</script>");
			out.close();
			
			return null;	// 더이상 실행없이 컨트롤러로 전달		
		}else if(result == 0) {
			out.print("<script>");
			out.print(" alert('로그인하셈'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}else { // result == -1
			out.print("<script>");
			out.print(" alert('게시판 글없음!! 수정 X '); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
			return null;
		}
		
	}

}
