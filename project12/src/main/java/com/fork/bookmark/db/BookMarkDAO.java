package com.fork.bookmark.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.fork.store.db.StoreDTO;

public class BookMarkDAO {
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
	
	 
	//정보 조회 메서드 북마크 - checkBookMark()		
	public int checkBookMark(String id, int s_no) {
        int result = 0;
        
        try {
           con = getConnection();    //id랑, 북마크 멤버 조인 
           sql = "select b.* from bookmark b join store s on s.s_no = b.s_no "
                 +"join member m on b.m_no = m.m_no where m.m_id=? && s.s_no=?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1,id);
           pstmt.setInt(2,s_no);
           
           rs = pstmt.executeQuery();
           
           if(rs.next()) {
              BookMarkDTO dto = new BookMarkDTO();
              
              dto.setM_no(rs.getInt("m_no"));
              dto.setS_no(rs.getInt("s_no"));
              
              result =1;
           }
           
           
        } catch (Exception e) {
           e.printStackTrace();
        }finally {
           closeDB();
        }
        
        return result;
     }
        
     //정보 조회 메서드 북마크 - checkBookMark()
			
		
	//찜 생성 - insert 
    public void insertBookMark(String id, int s_no) {
       
       try {
          con = getConnection();
          sql = "insert into bookmark(m_no,s_no) values( "
                + "(select m_no from member where m_id=?),?)";
          
          pstmt = con.prepareStatement(sql);
          pstmt.setString(1, id);
          pstmt.setInt(2, s_no);
          
          pstmt.executeUpdate();
          
          System.out.println(" DAO : 찜 완료");
          
       } catch (Exception e) {
          e.printStackTrace();
       }finally {
          closeDB();
       }
       
       
       
    }
    //찜 생성 - insert
			
			
  //찜 해제 - delete
    public int deleteBookMark(String id, int s_no) {
       int result = -1;
       
       try {
          con = getConnection();
          sql = "select b.* from bookmark b join store s on s.s_no = b.s_no "
                +"join member m on b.m_no = m.m_no where m.m_id=? and s.s_no=?";
          pstmt = con.prepareStatement(sql);
          
          pstmt.setString(1,id);
          pstmt.setInt(2,s_no);
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
          sql = "delete from bookmark where (select m_no from member where m_id=?) && s_no=?";
          pstmt = con.prepareStatement(sql);
          
          pstmt.setString(1, id);
          pstmt.setInt(2, s_no);
          
          result = pstmt.executeUpdate();
          
          System.out.println(" DAO 찜 해제 완료 ");
          }else {
             result = -1;
             
          }
       } catch (Exception e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }finally {
          closeDB();
          
       }
       return result;
    }
//    찜 해제 - delete
			
    //찜 카운트 
    public int countBookMark() {
    	BookMarkDTO bkdto = new BookMarkDTO();
    	int count = 0;
    	
    	try {
			con = getConnection();
			sql = "select count(*) from bookmark where s_no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,bkdto.getS_no());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
   
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
    	
    		return count;
    }
    //찜 카운트 
			
}
