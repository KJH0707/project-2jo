package com.fork.store.action;

import java.util.ArrayList;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.store.db.StoreDAO;


public class StoreListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		StoreDAO dao = new StoreDAO();
		
		int cnt=0;
		System.out.println(cnt);		
		int pageSize = 9;
		
		if (request.getParameter("per_page")!=null) {
			pageSize = Integer.parseInt(request.getParameter("per_page"));
		}
		
		// 	http://localhost:8088/JSP/board/boardList.jsp?pageNum=3 
		
		
		
		// 현 페이지가 몇 페이지 인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		String price=null;
		String[] category= {};
		ArrayList boardListAll = null;
		String kw = null;
		String gu = null;
		StringBuffer sb = null;
		if (request.getParameter("prnon")==null) {
			price = (String)request.getParameter("pr"); // price
			request.setAttribute("pr1" , price);
		}
		
		if (request.getParameter("kw")!=null) {
			kw = (String)request.getParameter("kw"); // price
			request.setAttribute("kw2", kw);
			
			sb = new StringBuffer();
			kw = kw.trim();
			sb.append(kw);
			sb.insert(0, "%");
			sb.insert(kw.length()+1, "%");
			
		}
		
		if (request.getParameter("nemsnon")==null) {
			request.setAttribute("nums", request.getParameter("nums"));
		}
		
		if (request.getParameter("gu")!=null) {
			gu = (String)request.getParameter("gu"); 
			if (gu.equals("no")) {
				gu = null;
			}
			else if (gu.equals("강서구")) {
				request.setAttribute("gang", gu);
			}
			else if (gu.equals("금정구")) {
				request.setAttribute("gold", gu);
			}
			else if (gu.equals("남구")) {
				request.setAttribute("nam", gu);
			}
			else if (gu.equals("동래구")) {
				request.setAttribute("dong", gu);
			}
			else if (gu.equals("부산진구")) {
				request.setAttribute("jin", gu);
			}
			else if (gu.equals("북구")) {
				request.setAttribute("buk", gu);
			}
			else if (gu.equals("사상구")) {
				request.setAttribute("sang", gu);
			}
			else if (gu.equals("사하구")) {
				request.setAttribute("saha", gu);
			}
			else if (gu.equals("서구")) {
				request.setAttribute("seo", gu);
			}
			else if (gu.equals("수영구")) {
				request.setAttribute("swim", gu);
			}
			else if (gu.equals("연제구")) {
				request.setAttribute("yeon", gu);
			}
			else if (gu.equals("영도구")) {
				request.setAttribute("zero", gu);
			}
			else if (gu.equals("중구")) {
				request.setAttribute("middle", gu);
			}
			else {
				request.setAttribute("sun", gu);
			}
		} // 검색 후 구 셀렉트를 위한 부분
		
		if (request.getParameter("cg")!=null) {
			category = request.getParameterValues("cg");
			for (int i=0;i<category.length;i++) {
				if (category[i].equals("한식")) {
					request.setAttribute("ko", category[i]);
				}
				else if (category[i].equals("양식")) {
					request.setAttribute("am", category[i]);
				}
				else if (category[i].equals("중식")) {
					request.setAttribute("ch", category[i]);
				}
				else if (category[i].equals("일식")) {
					request.setAttribute("ja", category[i]);
				}
				else {
					request.setAttribute("om", category[i]);
				}
			}
		} // 검색 후 체크박스 체크를 위한 부분
		
		
		if (request.getParameter("city")!=null) {
			String city = (String)request.getParameter("city");
			request.setAttribute(city, city);
		}
		
		// 시작행 번호 계산하기 1   11   21   31   41   .....
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1)*pageSize + 1;
		
		// 끝행 번호 계산하기 10   20   30   40   .....
		int endRow = currentPage * pageSize;
		//////////////////////////////////////////////////////////////////////////////////////////////
		// 가격대, 카테고리, 키워드, 구
//		0 0 0 1
//		0 0 1 0
//		0 1 0 0
//		1 0 0 0
//		0 0 1 1
//		0 1 0 1
//		1 0 0 1
//		0 1 1 0
//		1 0 1 0
//		1 1 0 0
		
		
//		0 1 1 1
//		1 1 1 0
//		1 1 0 1
//		1 0 1 1
//		1 1 1 1
		
		// sb = keyword
	
		if(price!=null&category.length==0&kw==null&gu==null) {
			boardListAll = dao.getBoardList(startRow, pageSize, price);
			cnt = dao.getCntPrBoardList(startRow, pageSize, price);
		}
		else if (price==null & category.length>0&kw==null&gu==null) {
			boardListAll = dao.getBoardList(startRow, pageSize, category);
			cnt = dao.getCntCtBoardList(startRow, pageSize, category);
		}
		else if (price==null & category.length==0&kw!=null&gu==null) {
			boardListAll = dao.getKwBoardList(startRow, pageSize, sb.toString());
			cnt = dao.getCntKwBoardList(startRow, pageSize, sb.toString());
		}
		else if (price==null & category.length==0&kw==null&gu!=null) {
			boardListAll = dao.getGuBoardList(startRow, pageSize, gu);
			cnt = dao.getCntGuBoardList(startRow, pageSize, gu);
		}
		// 1
		
		else if (price!=null&category.length>0&kw==null&gu==null) {
			boardListAll = dao.getBoardList(startRow, pageSize, category, price);
			cnt = dao.getCtPrCnt(startRow, pageSize, category, price);
		}// 1 1 0 0 
		else if (price!=null&category.length==0&kw!=null&gu==null) {
			boardListAll = dao.getKwPrBoardList(startRow, pageSize, sb.toString(), price);
			cnt = dao.getKwPrCnt(startRow, pageSize, sb.toString(), price);
		}// 1 0 1 0
		else if (price!=null&category.length==0&kw==null&gu!=null) {
			boardListAll = dao.getGuPrBoardList(startRow, pageSize, gu, price);
			cnt = dao.getGuPrCnt(startRow, pageSize, gu, price);
		}// 1 0 0 1
		else if (price==null&category.length>0&kw!=null&gu==null) {
			boardListAll = dao.getCtKwBoardList(startRow, pageSize, category, sb.toString());
			cnt = dao.getCtKwCnt(startRow, pageSize, category, sb.toString());
		}// 0 1 1 0
		else if (price==null&category.length>0&kw==null&gu!=null) {
			boardListAll = dao.getCtGuBoardList(startRow, pageSize, category, gu);
			cnt = dao.getCtGuCnt(startRow, pageSize, category, gu);
		}// 0 1 0 1
		else if (price==null&category.length==0&kw!=null&gu!=null) {
			boardListAll = dao.getKwGuBoardList(startRow, pageSize, sb.toString(), gu);
			cnt = dao.getKwGuCnt(startRow, pageSize, sb.toString(), gu);
		}// 0 0 1 1
		// 2
		
		else if (price!=null&category.length>0&kw!=null&gu==null) {
			boardListAll = dao.getKwCtPrBoardList(startRow, pageSize, sb.toString(), category, price);
			cnt = dao.getKwCtPrCnt(startRow, pageSize, sb.toString(), category, price);
		}// 1 1 1 0
		else if (price!=null&category.length==0&kw!=null&gu!=null) {
			boardListAll = dao.getKwGuPrBoardList(startRow, pageSize, sb.toString(), gu, price);
			cnt = dao.getKwGuPrCnt(startRow, pageSize, sb.toString(), gu, price);
		}// 1 0 1 1
		else if (price!=null&category.length>0&kw==null&gu!=null) {
			boardListAll = dao.getPrGuCtBoardList(startRow, pageSize, price, gu, category);
			cnt = dao.getPrGuCtCnt(startRow, pageSize, price, gu, category);
		}// 1 1 0 1
		else if (price==null&category.length>0&kw!=null&gu!=null) {
			boardListAll = dao.getKwGuCtBoardList(startRow, pageSize, sb.toString(), gu, category);
			cnt = dao.getKwGuCtCnt(startRow, pageSize, sb.toString(), gu, category);
		}// 0 1 1 1
		// 3
		
		else if (price!=null&category.length>0&kw!=null&gu!=null) {
			boardListAll = dao.getPrGuCtKwBoardList(startRow, pageSize, price, gu, category, sb.toString());
			cnt = dao.getPrGuCtKwCnt(startRow, pageSize, price, gu, category, sb.toString());
		}// 1 1 0 1
		// 4
		
		else if (price==null&category.length==0&kw==null&gu==null){   
			boardListAll = dao.getBoardList(startRow, pageSize);
			cnt = dao.getBoardCount();
		}
		
		if (request.getParameter("dto")!=null) {
			String a = (String)request.getParameter("dto");
			System.out.println(a);
		}
		
		// 디비에 전체 글 리스트 가져오기
//		ArrayList boardListAll =  dao.getBoardList();
		
		ArrayList recStore = dao.getRecStoreList();
		   /////////////////////////////////////////////////////////////////////////////////////////////////
			// 페이징 처리 (2)
			
			// 컨트롤 + h => 검색기능
		
//			if(cnt != 0){ // 글이 있을 때
				
				// 총 페이지 = 글 개수(총량) / 페이지 당 출력
				// 		=> 만약에 나머지가 있을 때 페이지 1개 추가
				
				// 전체 페이지 수
				int pageCount = (cnt/pageSize)+(cnt%pageSize==0? 0:1); // 삼항연산자
				
				// 한 화면에 보여줄 페이지 수
				int pageBlock = 3;
				
				// 페이지블럭의 시작번호		1~10 => 1, 11~20 => 11, 21~30 => 21
				int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
				
				// 페이지블럭의 끝번호
				int endPage = startPage+pageBlock-1;
				
				if(endPage > pageCount){
					endPage = pageCount;
//				}
			}
		
//		System.out.println(" M : "+boardListAll); // 확인하고 주석처리해야 덜느려짐 보드에 모든 글이 다 나타나기 때문
		
		// 직접 출력 -> 위임(대신 출력) view .jsp페이지에서 출력
		
		// Action -> jsp 페이지 정보 전달(request 영역객체 저장)
		request.setAttribute("boardListAll", boardListAll); // +a를 넣을경우, 추가적인 정보를 담을경우
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("recStore", recStore);
		
		// 페이징처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
//		request.setAttribute("boardListAll", dao.getBoardList()); // 디비에 있는 정보를 그대로 출력만 할 경우
		
		System.out.println("dddddddddddddddddddddddddd 수지바보");
		// 페이지 이동준비(티켓 생성)
		ActionForward forward = new ActionForward();
		forward.setPath("./board/storeList.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
