package com.fork.store.action;

import java.io.PrintWriter;
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

public class StoreJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : StoreJoinAction_execute() 호출");
		
		// 아이디 제어 (점주)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("c_id");
		ActionForward forward = new ActionForward();
		StoreDAO sdao = new StoreDAO();
		
		if(id!=null) {
			if(sdao.isCeo(id)==0) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();		
				out.print("<script>");
				out.print("alert('잘못된 접근입니다');");
				out.print("history.back()';");
				out.print("</script>");
				out.close();
				return null;
			}	
		}
		// 아이디 제어 (점주)
		

		forward.setPath("./ceo/storeJoin.jsp"); // 점주 마이페이지 또는 가게 등록 페이지로 연결할 것
		forward.setRedirect(false); 
		return forward;
	}
}
