package com.oracle.carshop.model.dao;

import java.util.ArrayList;

import com.oracle.carshop.model.bean.New;

public interface NewDAO extends BaseDAO {
	
	public ArrayList<New>  listRecentNewsByCount(int count);
	
	public New getNewInfoById(int id);

}
