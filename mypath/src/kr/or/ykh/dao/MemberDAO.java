package kr.or.ykh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ykh.driverdb.DriverDB;
import kr.or.ykh.dto.MemberDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberDTO mdto = null;
	ArrayList<MemberDTO> list = null;
	
	// 회원검색처리
	public ArrayList<MemberDTO> mSelectSearch(String choice, String keyword, String startDate, String endDate) throws ClassNotFoundException, SQLException {
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDB();
		// 카테고리 선택이 날짜인 경우
		if(choice.equals("m_date")){
			if(startDate.equals("") & endDate.equals("")) {				
				pstmt = conn.prepareStatement(
						"SELECT * FROM tb_member WHER");
			}else{		
				pstmt = conn.prepareStatement(
						"SELECT * FROM tb_member WHERE m_date>='" + startDate + "' and m_date<='" + endDate + "'");
			}
		// 카테고리 선택이 널값인 경우
		}else if(choice.equals("")){			
			pstmt = conn.prepareStatement("SELECT * FROM tb_member");	 
		//카테고리가 날짜 이외인 경우
		}else{
			if(keyword != null) {				
				pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE " + choice + " = ?");
				pstmt.setString(1, keyword);	 				
			}else{			
				pstmt = conn.prepareStatement("SELECT * FROM tb_member");				 
			}
		}
		rs = pstmt.executeQuery();
		System.out.println(rs + "<---rs");
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			mdto = new MemberDTO();
			mdto.setM_id(rs.getString("m_id"));
			mdto.setM_level(rs.getString("m_level"));
			mdto.setM_name(rs.getString("m_name"));
			mdto.setM_gender(rs.getString("m_gender"));
			mdto.setM_phone(rs.getString("m_phone"));
			mdto.setM_email(rs.getString("m_email"));
			mdto.setM_date(rs.getString("m_date"));
			list.add(mdto);			
		}
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}	
	
	// 회원탈퇴처리
	public void mDelete(String id) throws ClassNotFoundException, SQLException {
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDB();
		pstmt = conn.prepareStatement("DELETE FROM tb_member WHERE m_id = ?");	
		pstmt.setString(1, id);
		pstmt.executeUpdate();		
		pstmt.close();
		conn.close();
	}
	
	// 내 회원정보 수정처리
	public MemberDTO mUpdate(MemberDTO mdto) throws ClassNotFoundException, SQLException {
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDB();
		pstmt = conn.prepareStatement("UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_gender=?,m_phone=?,m_email=?, m_date=? WHERE m_id = ?");	
		pstmt.setString(1, mdto.getM_pw());
		pstmt.setString(2, mdto.getM_level());
		pstmt.setString(3, mdto.getM_name());
		pstmt.setString(4, mdto.getM_gender());
		pstmt.setString(5, mdto.getM_phone());
		pstmt.setString(6, mdto.getM_email());
		pstmt.setString(7, mdto.getM_date());
		pstmt.setString(8, mdto.getM_id());
		pstmt.executeUpdate();		
		pstmt.close();
		conn.close(); 
		return mdto;
	}
	
	// 내 회원정보 수정화면
	public MemberDTO mUpdateSelect(String send_id) throws ClassNotFoundException, SQLException {
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDB();
		pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
		pstmt.setString(1, send_id);
		rs = pstmt.executeQuery();	
		if(rs.next()){
			mdto = new MemberDTO();
			mdto.setM_id(rs.getString("m_id"));
			mdto.setM_pw(rs.getString("m_pw"));
			mdto.setM_level(rs.getString("m_level"));
			mdto.setM_name(rs.getString("m_name"));
			mdto.setM_gender(rs.getString("m_gender"));
			mdto.setM_phone(rs.getString("m_phone"));
			mdto.setM_email(rs.getString("m_email"));
			mdto.setM_date(rs.getString("m_date"));
		}		
		rs.close();
		pstmt.close();
		conn.close();
		return mdto;
	}
	
	// 전체회원 리스트
	public ArrayList<MemberDTO> mSelectAll() throws ClassNotFoundException, SQLException {
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDB();
		pstmt = conn.prepareStatement("SELECT * FROM tb_member");
		rs = pstmt.executeQuery();
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			mdto = new MemberDTO();
			mdto.setM_id(rs.getString("m_id"));
			mdto.setM_level(rs.getString("m_level"));
			mdto.setM_name(rs.getString("m_name"));
			mdto.setM_gender(rs.getString("m_gender"));
			mdto.setM_phone(rs.getString("m_phone"));
			mdto.setM_email(rs.getString("m_email"));
			mdto.setM_date(rs.getString("m_date"));
			list.add(mdto);			
		}
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
	
	// 회원가입
	public void mInsert(MemberDTO mdto) throws ClassNotFoundException, SQLException {
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDB();
		pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES(?,?,?,?,?,?,?,now())");
		pstmt.setString(1, mdto.getM_id());
		pstmt.setString(2, mdto.getM_pw());
		pstmt.setString(3, mdto.getM_level());
		pstmt.setString(4, mdto.getM_name());
		pstmt.setString(5, mdto.getM_gender());
		pstmt.setString(6, mdto.getM_phone());
		pstmt.setString(7, mdto.getM_email());
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
}