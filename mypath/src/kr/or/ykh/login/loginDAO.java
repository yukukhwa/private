package kr.or.ykh.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.ykh.driverdb.DriverDB;
import kr.or.ykh.dto.MemberDTO;
import kr.or.ykh.dto.NoneMemberDTO;

public class loginDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 비회원 정보 세션에서 받기.
	public NoneMemberDTO nonemGetForSession(String name) throws ClassNotFoundException, SQLException {
	NoneMemberDTO nonemdto = null;
	DriverDB driver = new DriverDB();
	conn = driver.driverDB();
	pstmt = conn.prepareStatement("SELECT * FROM none_member WHERE name=?");
	pstmt.setString(1, name);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		nonemdto = new NoneMemberDTO();
		nonemdto.setName(rs.getString("name"));
		nonemdto.setPhone(rs.getString("phone"));
		nonemdto.setLevel(rs.getString("level"));
	}
	pstmt.close();
	conn.close(); 
	return nonemdto;
	}
	
	// 회원 정보 세션에서 받기
	public MemberDTO mGetForSession(String id) throws ClassNotFoundException, SQLException {
		MemberDTO mdto = null;
		DriverDB driver = new DriverDB();
		conn = driver.driverDB();
		pstmt = conn.prepareStatement("SELECT * FROM tb_member WHERE m_id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			mdto = new MemberDTO();
			mdto.setM_id(rs.getString("m_id"));
			mdto.setM_name(rs.getString("m_name"));
			mdto.setM_level(rs.getString("m_level"));
		}
		pstmt.close();
		conn.close(); 
		return mdto;
	}
	// 비회원 로그인 성공처리
	public int noneuserlogincheck(String name, String phone) throws ClassNotFoundException, SQLException {
		int re=0;
		DriverDB driver = new DriverDB();
		conn = driver.driverDB();
		pstmt = conn.prepareStatement("SELECT  `phone` FROM `dbdayyu`.`none_member` WHERE name=? ORDER BY `phone` ASC");
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		if(rs.next()){
			if(phone.equals(rs.getString("phone"))){
				re = 1;
			}else {
				re = 2;
			}
		}else {
			re = 3;
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}
	
	// 회원 로그인 성공처리 (1:성공,2:비번불일치,3:아이디불일치)
	public int logincheck(String id, String pw) throws ClassNotFoundException, SQLException {
		int re=0;
		DriverDB driver = new DriverDB();
		conn = driver.driverDB();
		pstmt = conn.prepareStatement("SELECT m_pw FROM tb_member WHERE m_id=?");
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			if(pw.equals(rs.getString("m_pw"))){
				re = 1;
			}else {
				re = 2;
			}
		}else {
			re = 3;
		}
		rs.close();
		pstmt.close();
		conn.close();
		return re;
	}

}