package com.oracle.carshop.util;

import java.security.MessageDigest;

import com.oracle.carshop.model.dao.CarDAOImp;

public class Test {

	public static void main(String[] args) {
		CarDAOImp dao=new CarDAOImp();
		dao.updateCarVideo();
	}

}
