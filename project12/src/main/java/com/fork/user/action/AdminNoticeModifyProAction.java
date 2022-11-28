package com.fork.user.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.NoticeDTO;
import com.fork.user.db.UserDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminNoticeModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AdminNoticeModifyProAction_execute()");
		// 로그인 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
	
		ActionForward forward = new ActionForward();
		
		if(id!=null) {
			if (!(id.equals("admin"))) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
			}
		} else{
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		// 로그인 제어
		
		NoticeDTO dto = new NoticeDTO();
		UserDAO dao = new UserDAO();
		
		ServletContext CTX = request.getServletContext();
		String realPath = CTX.getRealPath("/upload");
		System.out.println(" M : realPath : " + realPath);
		int maxSize = 10 * 1024 * 1024; // 10MB
		
		// MultipartRequest 객체 생성(업로드)
		MultipartRequest multi 
					= new MultipartRequest(
							request, 
							realPath,
							maxSize,
							"UTF-8",
							new DefaultFileRenamePolicy()
							);
		
		System.out.println(" M : 첨부파일 업로드 완료!");
		
		String isEvent = (String)multi.getParameter("isEvent");
		
		if(isEvent.equals("notice")) {
			dto.setN_isevent(0);
		}
		if(isEvent.equals("event")) {
			dto.setN_isevent(1);
		}
		
		
		dto.setN_title(multi.getParameter("n_title"));
		
		String img = multi.getFilesystemName("file1")+","
				 + multi.getFilesystemName("file2")+","
				  + multi.getFilesystemName("file3")+","
				   + multi.getFilesystemName("file4");
		
		dto.setN_img(img);
		dto.setN_content(multi.getParameter("content"));
		
		System.out.println(isEvent);
		
		
		dto.setN_eventSdate(multi.getParameter("eventS"));
		dto.setN_eventEdate(multi.getParameter("eventE"));
		
		
		System.out.println(" M : 수정전");
		dao.modifyNotice(dto);
		System.out.println(" M : 수정완료");
		
		forward.setPath("./adminNoticeList.us");
		forward.setRedirect(true);
		return forward;
	}

}
