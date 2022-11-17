package com.fork.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.fork.store.db.StoreDTO;
import com.fork.user.db.MemberDTO;
import com.fork.board.db.BookDTO;

public class BookDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 디비 연결해주는 메서드(커넥션풀)
	private Connection getConnection() throws Exception {
		// 1. 드라이버 로드 // 2. 디비연결

		// Context 객체 생성 (JNDI API)
		Context initCTX = new InitialContext();
		// 디비연동정보 불러오기 (context.xml 파일정보)
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/project12");
		// 디비정보(연결) 불러오기
		con = ds.getConnection();

		System.out.println(" DAO : 디비연결 성공(커넥션풀) ");
		System.out.println(" DAO : con : " + con);

		return con;
	}

	// 자원해제 메서드 - closeDB()
	public void closeDB() {
		System.out.println("DAO : 디비연결자원 해제");

		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 자원해제 메서드-closeDB()
	
	// 예약 정보 저장 - addBook(BookDTO)
	public void addBook(BookDTO boDTO) {
		int res_no = 0; // 
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		try {
			con = getConnection();
			// res_no 계산하기
			sql = "select max(res_no) from reservation";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				res_no = rs.getInt(1)+1;
			}
			
			res_no = res_no;

			// 예약번호 생성 
			// 예약정보 저장(최소 1개 이상)
							
				
				// insert
				sql ="insert into reservation "
						+ "values("
						+ "?,?,?,?,?,"
						+ "?,?,?,?,";
				
				pstmt = con.prepareStatement(sql);
				
				// ???
				pstmt.setInt(1, res_no); // 예약번호
				pstmt.setInt(2, boDTO.getS_no()); // 식당번호 
				pstmt.setInt(3, boDTO.getM_no()); // 회원번호
				pstmt.setInt(4, boDTO.getRes_num()); // 인원
				pstmt.setInt(5, boDTO.getRes_time());// 시간
				pstmt.setString(6, boDTO.getRes_date()); // 방문일자
				pstmt.setString(7, boDTO.getRes_name()); // 
				pstmt.setString(8, boDTO.getRes_msg()); // 
				pstmt.setInt(9, boDTO.getRes_status()); // 
				
				pstmt.executeUpdate();
				
				
			
			
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// 예약 정보 저장 - addBook(BookDTO)
	
	
	// 예약 목록 - getBookList(id)
	public List<BookDTO> getBookList(String id){
		List<BookDTO> orderList = new ArrayList<BookDTO>();
		
		try {
			con = getConnection();
	//		sql = "select "
	//				+ ;
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// DB(rs) -> OrderDTO 저장 -> OrderList저장
				BookDTO dto = new BookDTO();
				
//				dto.setO_trade_num(rs.getString(1));
//				dto.setO_g_name(rs.getString(2));
//				dto.setO_g_amount(rs.getInt(3));
//				dto.setO_g_color(rs.getString(4));
//				dto.setO_g_size(rs.getString(5));
//				dto.setO_sum_money(rs.getInt(6));
//				dto.setO_trans_num(rs.getString(7));
//				dto.setO_date(rs.getTimestamp(8));
//				dto.setO_status(rs.getInt(9));
//				dto.setO_trade_type(rs.getString(10));	
				
//				BookList.add(dto);				
			}// while
			
			
//			System.out.println(" DAO : "+BookList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return orderList;
	}
	// 예약 목록 - getBookList(id)

	
	
	
	
	
	
	
	
	
	
}
