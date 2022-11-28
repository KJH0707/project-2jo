package com.fork.coupon.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.fork.user.db.CeoDTO;

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
	public void makeCoupon(CouponDTO dto) {
		int result = 0;
		try {
			con = getConnection();
			//sql = "insert into mem_coupon(c_code=?,isUse=?,c_name=?,c_issue_date=?,c_issue_end=?,c_startDate=?,c_endDate=?,c_quantity=?) values()";
			sql = "insert into mem_coupon(c_code,isUse,c_name,c_sdate,c_edate,c_quantity,c_place,c_message) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getC_code());
			pstmt.setInt(2, dto.getIsUse());
			pstmt.setString(3, dto.getC_name());
			pstmt.setString(4, dto.getC_sdate());
			pstmt.setString(5, dto.getC_edate());
			pstmt.setInt(6, dto.getC_quantity());
			pstmt.setString(7, dto.getC_place());
			pstmt.setString(8, dto.getMessage());
			
			result = pstmt.executeUpdate();
			
			System.out.println(" DAO : 쿠폰 발행 완료 "+ result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	 //makeCoupon - 쿠폰발행하기

	// getIssueCoupon - 발행한 쿠폰 조회
	public List getIssueCoupon(String id, int c_no){
		List couponList = new ArrayList();
		//List ceodetail = new ArrayList();
		
		try {
			con = getConnection();
			sql = "select * from mem_coupon m, ceo c where c.c_id=? and substr(c.c_code,15,1)=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, c_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//CeoDTO cdto = new CeoDTO();
				CouponDTO couDTO = new CouponDTO();
				
				couDTO.setC_code(rs.getString("c_code"));
				couDTO.setC_name(rs.getString("c_name"));
				couDTO.setC_place(rs.getString("c_place"));
				couDTO.setC_quantity(rs.getInt("c_quantity"));
				couDTO.setC_sdate(rs.getString("c_sdate"));
				couDTO.setC_edate(rs.getString("c_edate"));
				
				couponList.add(couDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return couponList;
	}
	// getIssueCoupon - 발행한 쿠폰 조회
	
	// 쿠폰 전체 개수 확인 - getCouponCount()	
	public int getCouponCount(String id, int c_no) {
		int cnt = 0;
		
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3.  sql
			sql = "select count(*) from mem_coupon m, ceo c where c.c_id=? and substr(c.c_code,15,1)=?  ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, c_no);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				//cnt = rs.getInt(1);
				cnt = rs.getInt("count(*)");
			}
			System.out.println(" DAO : 전체 쿠폰 개수 : " +cnt+ "개");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return cnt;
	}
	// 쿠폰 전체 개수 확인 - getCouponCount()	
	
	// 사용가능한 쿠폰 조회 - getAllCoupon()
	public List getAllCoupon(String id, int c_no) {
		List couponList = new ArrayList();
		
		try {   // c.c_deleted   " where c.c_edate > now() and c_deleted = 'N' "
			con = getConnection();
			sql = 
				"select c.c_code, c.c_quantity, c.c_sdate, c.c_edate, c.c_place, c.c_name, c_deleted, s.c_id "
				+ "from (select row_number() over(order by c_edate) sort, c_code "
				+ "	  from mem_coupon "
				+ "	  where c_edate > now() "
				+ "	  and c_deleted = 'N' "
				+ "	  )r, mem_coupon c , ceo s "
				+ "where r.c_code = c.c_code and s.c_id=? and substr(c.c_code,15,1)=? "
				+ "order by c.c_edate";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, c_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CouponDTO dto = new CouponDTO();
				
				dto.setC_code(rs.getString("c_code"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_sdate(rs.getString("c_sdate"));
				dto.setC_edate(rs.getString("c_edate"));
				dto.setC_quantity(rs.getInt("c_quantity"));
				dto.setC_place(rs.getString("c_place"));
				dto.setDeleted(rs.getString("c_deleted"));
				
				//dto.setIsUse(rs.getString("c_isUse"));
				//dto.setM_no(rs.getInt("m_no"));
				
				couponList.add(dto);
			}
			System.out.println(" DAO : 쿠폰 종류수 : "+couponList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return couponList;
	}
	// 사용가능한 쿠폰 조회 - getAllCoupon()
	
	// 사용가능한 쿠폰 조회 - getAllCoupon(id, c_no, startRow, pageSize)
	public ArrayList getAllCoupon(String id, int c_no, int startRow, int pageSize) {
		ArrayList couponList = new ArrayList();
		
		try {   // c.c_deleted   " where c.c_edate > now() and c_deleted = 'N' "
			con = getConnection();
			sql = 
					"select c.c_code, c.c_quantity, c.c_sdate, c.c_edate, c.c_place, c.c_name, c_deleted, s.c_id "
							+ "from (select row_number() over(order by c_code desc) sort, c_code "
							+ "	  from mem_coupon "
							+ "	  where c_edate > now() "
							+ "	  and c_deleted = 'N' "
							+ "	  )r, mem_coupon c , ceo s "
							+ "where r.c_code = c.c_code and s.c_id=? and substr(c.c_code,15,1)=? "
							+ "order by c.c_edate "
							+ "limit ?, ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, c_no);
			pstmt.setInt(3, startRow-1); // 시작행 - 1
			pstmt.setInt(4, pageSize); // 개수
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CouponDTO dto = new CouponDTO();
				
				dto.setC_code(rs.getString("c_code"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_sdate(rs.getString("c_sdate"));
				dto.setC_edate(rs.getString("c_edate"));
				dto.setC_quantity(rs.getInt("c_quantity"));
				dto.setC_place(rs.getString("c_place"));
				dto.setDeleted(rs.getString("c_deleted"));
				
				//dto.setIsUse(rs.getString("c_isUse"));
				//dto.setM_no(rs.getInt("m_no"));
				
				couponList.add(dto);
			}
			System.out.println(" DAO : 쿠폰 종류수 : "+couponList.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return couponList;
	}
	// 사용가능한 쿠폰 조회 - getAllCoupon()
	
	// 만료된 쿠폰 조회 - getInvaildCoupon()
	public List getInvaildCoupon(String id, int c_no) {
		List InvaildCoupon = new ArrayList();
		
		try {                      // c.c_deleted   " where c.c_edate > now() and c_deleted = 'N' "
			con = getConnection();
			sql = 
				"SELECT c.c_code, c.c_quantity, c.c_sdate, c.c_edate, c.c_deleted, c.c_place, c.c_name, s.c_id "
				+ "FROM (SELECT row_number() over(order by c_code desc) sort, c_code "
				+ "		FROM mem_coupon "
				+ "		WHERE c_edate < now() "
				+ "		OR c_quantity = 0 "
				+ "		OR c_deleted = 'Y' "
				+ "		) r, mem_coupon c, ceo s "
				+ "WHERE r.c_code = c.c_code and s.c_id=? and substr(c.c_code,15,1)=? "
				+ "ORDER BY c_code desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, c_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CouponDTO dto = new CouponDTO();
				
				dto.setC_code(rs.getString("c_code"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_sdate(rs.getString("c_sdate"));
				dto.setC_edate(rs.getString("c_edate"));
				dto.setC_quantity(rs.getInt("c_quantity"));
				dto.setC_place(rs.getString("c_place"));
				dto.setDeleted(rs.getString("c_deleted"));
				
				//dto.setIsUse(rs.getString("c_isUse"));
				//dto.setM_no(rs.getInt("m_no"));
				
				InvaildCoupon.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return InvaildCoupon;
	}
	// 만료된 쿠폰 조회 - getInvaildCoupon()
	
	// 수정할 쿠폰 정보 가져오기 - getCouponDetail()
	public CouponDTO getCouponDetail(String c_code) {
		CouponDTO coupon = null;
		
		try {  
			con = getConnection();
			sql = "select * from mem_coupon where c_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				coupon = new CouponDTO();
				
				coupon.setC_code(rs.getString("c_code"));
				coupon.setC_name(rs.getString("c_name"));
				coupon.setC_sdate(rs.getString("c_sdate"));
				coupon.setC_edate(rs.getString("c_edate"));
				coupon.setC_quantity(rs.getInt("c_quantity"));
				coupon.setC_place(rs.getString("c_place"));
				coupon.setDeleted(rs.getString("c_deleted"));
				coupon.setMessage(rs.getString("c_message"));
				coupon.setM_no(rs.getInt("m_no"));
				
			}
			System.out.println(" DAO : 수정 작업 메서드 호출");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return coupon;
	}
	// 수정할 쿠폰 정보 가져오기 - getCouponDetail()
	
	// 쿠폰 정보 수정하기 - modifyCoupon()
	public void modifyCoupon(CouponDTO dto, String c_code) {
		
		try {
			con = getConnection();
			sql = "UPDATE mem_coupon SET c_sdate=?,c_edate=?,c_quantity=?,c_message=?,c_name=?,c_place=?,m_no=?,isUse=? "
				+ " WHERE c_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,dto.getC_sdate());
			pstmt.setString(2, dto.getC_edate());
			pstmt.setInt(3, dto.getC_quantity());
			pstmt.setString(4, dto.getMessage());
			pstmt.setString(5, dto.getC_name());
			pstmt.setString(6, dto.getC_place());
			pstmt.setInt(7, dto.getM_no());
			pstmt.setInt(8, dto.getIsUse());
			pstmt.setString(9, c_code);
			
			int result = pstmt.executeUpdate();
			
			System.out.println(" DAO : 수정 완료 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	// 쿠폰 정보 수정하기 - modifyCoupon()
	
	// 쿠폰 삭제하기 - deleteCoupon(c_code)
	public void deleteCoupon(String c_code) {
		
		try {
			con = getConnection();
			sql = "UPDATE mem_coupon SET c_deleted=? WHERE c_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "Y");
			pstmt.setString(2, c_code);
			int result = pstmt.executeUpdate();
			
			System.out.println(" DAO : 삭제 완료 : " + result );
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	// 쿠폰 삭제하기 - deleteCoupon(c_code)
	
	// 받은 쿠폰 조회 - getCouponList()
	public List getCouponList(int m_no) {
		List membercoupon = new ArrayList();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM mem_coupon WHERE m_no=? AND c_edate > now() AND c_deleted = 'N' AND isUse = 1 ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_no);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				CouponDTO dto = new CouponDTO();
				
				dto.setC_code(rs.getString("c_code"));
				dto.setC_edate(rs.getString("c_edate"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_place(rs.getString("c_place"));
				dto.setC_sdate(rs.getString("c_sdate"));
				dto.setIsUse(0);
				dto.setM_no(rs.getInt("m_no"));
				dto.setMessage(rs.getString("c_message"));
				
				membercoupon.add(dto);
				System.out.println(" DAO : 발급받은 쿠폰 수 :"+membercoupon.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return membercoupon;
	}
	// 받은 쿠폰 조회 - getCouponList()
	
	// 만료된 쿠폰 조회 - getMemInvaildCoupon()
		public List getMemInvaildCoupon(int m_no, String c_no) {
			List InvaildCoupon = new ArrayList();
			
			try {                      // c.c_deleted   " where c.c_edate > now() and c_deleted = 'N' "
				con = getConnection();
				sql = 
					"SELECT c.c_code, c.c_quantity, c.c_sdate, c.c_edate, c.c_deleted, c.c_place, c.c_name, c.m_no, c.isUse "
					+ "FROM (SELECT row_number() over(order by c_edate desc) sort, c_code "
					+ "		FROM mem_coupon "
					+ "		WHERE c_edate < now() "
					+ "		OR isUse = 1 "
					+ "		OR c_deleted = 'Y' "
					+ "		) r, mem_coupon c "
					+ "WHERE r.c_code = c.c_code and c.m_no=? " //and c.c_code=? 
					+ "ORDER BY c_code desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, m_no);
				//pstmt.setString(2, c_no);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					CouponDTO dto = new CouponDTO();
					
					dto.setC_code(rs.getString("c_code"));
					dto.setC_name(rs.getString("c_name"));
					dto.setC_sdate(rs.getString("c_sdate"));
					dto.setC_edate(rs.getString("c_edate"));
					dto.setC_quantity(rs.getInt("c_quantity"));
					dto.setC_place(rs.getString("c_place"));
					dto.setDeleted(rs.getString("c_deleted"));
					
					//dto.setIsUse(rs.getString("c_isUse"));
					//dto.setM_no(rs.getInt("m_no"));
					
					InvaildCoupon.add(dto);
				}
				System.out.println(" DAO : 만료된 쿠폰 조회 :"+InvaildCoupon);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return InvaildCoupon;
		}
		// 만료된 쿠폰 조회 - getInvaildCoupon()
	
	// 쿠폰 발급하기 - getCoupon(m_no, c_code)
	public int getCoupon(int m_no, CouponDTO dto, String c_code) {
		int quantity = 0;
		int result = -1;
		String code = "N";
		try {
			con = getConnection();
			sql = "select c_quantity from mem_coupon where c_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				quantity = rs.getInt(1)-1; // 발급가능한 쿠폰 갯수 -1
				code = c_code+quantity;
				
			}
			
				sql = "insert into mem_coupon(c_code,isUse,m_no,c_name,c_sdate,c_edate,c_quantity,c_place,c_message) values(?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, code);
				pstmt.setInt(2, 0);
				pstmt.setInt(3, m_no);
				pstmt.setString(4, dto.getC_name());
				pstmt.setString(5, dto.getC_sdate());
				pstmt.setString(6, dto.getC_edate());
				pstmt.setInt(7, 1);
				pstmt.setString(8, dto.getC_place());
				pstmt.setString(9, dto.getMessage());

				result = pstmt.executeUpdate();
				
				System.out.println(" DAO : 회원 쿠폰발급 완료 : "+result );
				
				sql = "UPDATE mem_coupon SET c_quantity=? WHERE c_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, quantity);
				pstmt.setString(2, dto.getC_code());

				result = pstmt.executeUpdate();
				
				System.out.println(" DAO : 쿠폰 갯수 업데이트 완료 : "+result );
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// 쿠폰 발급하기 - getCoupon(m_no, c_code)
	
	// 쿠폰 발급 중복 체크 - duplCoupon()
	public int duplCoupon(int m_no) {
		int result = 0;
		try {
			con = getConnection();
			sql = "SELECT * FROM mem_coupon WHERE m_no IS NOT Null AND m_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
				System.out.println(" DAO : 이미 발급한 쿠폰 : "+result );
				
			}
			
			System.out.println(" DAO : 쿠폰 발급여부(중복-1/신규-0) : "+result );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	// 쿠폰 발급 중복 체크 - duplCoupon()

	
	
}
