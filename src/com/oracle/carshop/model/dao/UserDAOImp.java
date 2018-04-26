package com.oracle.carshop.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.oracle.carshop.model.bean.User;

public class UserDAOImp extends BaseDAOImp implements UserDAO {

	@Override
	public boolean add(Object o) {
		User user=(User)o;
		boolean result=false;
		Statement  sta=null;
		try {
			sta=getSta();
			int count=sta.executeUpdate("insert into  user(userid,username,password)   values(null,'"+user.getUsername()+"','"+user.getPassword()+"')");
			result=(count>0)?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User login(String username, String password) {
		User  user=null;
		PreparedStatement  sta=null;
		ResultSet rs=null;
		try {
			  sta=getPreSta("select *  from user where username=? and password=?");
			sta.setString(1, username);
			sta.setString(2, password);
			rs=sta.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setAge(rs.getInt("age"));
				user.setImage(rs.getString("image"));
				user.setNickname(rs.getString("nickname"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
