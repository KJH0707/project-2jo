package com.fork.board.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.fork.board.db.BoardDAO;
import com.fork.board.db.BookDTO;
import com.fork.board.db.PaymentDTO;

public class paymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		int res_num = Integer.parseInt(request.getParameter("res_num"));
		int res_time = Integer.parseInt(request.getParameter("res_time"));
		String res_date = (String)(request.getParameter("res_date2"));
		String res_name = (String)(request.getParameter("res_name"));
		String res_msg = (String)(request.getParameter("res_msg"));
		
		System.out.println(res_date);
		BookDTO dto = new BookDTO();
		dto.setM_no(m_no);
		dto.setRes_date(res_date);
		dto.setRes_msg(res_msg);
		dto.setRes_name(res_name);
		dto.setS_no(s_no);
		dto.setRes_num(res_num);
		dto.setRes_time(res_time);
		dto.setRes_tel((String)request.getParameter("res_tel"));
		
		BoardDAO dao = new BoardDAO();
//		int res_no = dao.insertReserv(dto);
		
		
		PaymentDTO dto2 = new PaymentDTO();
		dto2.setM_no(m_no);
		dto2.setP_info((String)request.getParameter("m_id")+"님의 "+(String)request.getParameter("s_name")+" 예약");
		dto2.setP_price(Integer.parseInt(request.getParameter("s_price")));
//		dto2.setRes_no(res_no);
		dto2.setP_no((String)request.getParameter("p_no"));
//		dao.insertPayment(dto2);
		
		
		return null;
	}

}
