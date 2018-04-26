package com.oracle.carshop.model.dao;

import com.oracle.carshop.model.bean.User;

public interface UserDAO extends BaseDAO {
	public User  login(String username,String password);

}
