package com.fork.coupon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CouponDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비 연결해주는 메서드(커넥션풀)
	private Connection getConnection() throws Exception {
		// 1. 드라이버 로드 // 2. 디비연결
		
		// Context 객체 생성 (JNDI API)
		Context initCTX = new InitialContext();
		// 디비연동정보 불러오기
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/project12");
		// 디비정보(연결)불러오기
		con = ds.getConnection();
		
		System.out.println(" DAO : 디비연결 성공(커넥션풀)");
		System.out.println(" DAO : con : " +con);
		return con;
	}
		
	// 자원해제 메서드 - closeDB()
	public void closeDB() {
		System.out.println(" DAO : 디비연결자원 해제");
		
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	// 자원해제 메서드 - closeDB()
	
	// makeCoupon - 쿠폰발행하기
	public void makeCoupon() {
		
		try {
			con = getConnection();
			sql = "insert into mem_coupon() values()";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(0, sql);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
	}
	// makeCoupon - 쿠폰발행하기

	// 사용가능한 쿠폰 조회 - getAllCoupon()
	public void getAllCoupon(시작일, 만료일) {
		
		try {
			con = getConnection();
			sql = 
				"select c.c_no, c.quantity, c.c_discountRate, c.c_startDate, c.c_enddate, "
					  + "c.c_category, c.c_name, c.c_issue_date, c.c_deleated, c.c_issue_end "
			  + "from (select row_number() over(order by c_issue_end) number c_no "
			  		+ " from coupon "
			  		+ " where c_endDate > now() "
			  		+ " and c_deleted = 'N'"
			  		+ ") r, coupon c"
			  + "where r.c_no = c.c_no and rn between #{beginIndex} and #{endIndex} "
			  + "order by c_issue_end";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				CouponDTO dto = new CouponDTO();
				
				dto.setC_code(rs.getString("c_code"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_quantity(rs.getInt("c_quantity"));
				dto.setC_startDate(rs.getTimestamp("c_startDate"));
				dto.setC_endDate(rs.getTimestamp("endDate"));
				dto.setC_issue_date(rs.getTimestamp("c_issue_date"));
				dto.setC_issue_end(rs.getTimestamp("c_issue_end"));
				dto.setM_no(0);
				dto.setIsUse(rs.getString("c_isUse"));
				dto.setM_no(rs.getInt("m_no"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	// 사용가능한 쿠폰 조회 - getAllCoupon()
	
}
