package com.javaex.dao;
import java.util.List;

import com.javaex.vo.GuestbookVo;

public class Test {
	
	public static void main(String []args) {
		
		//dao test
		GuestbookDao guestbookDao = new GuestbookDao();
		List<GuestbookVo> gbList = guestbookDao.getList();
		//jdbc 있어야함
		System.out.println(gbList.toString());
	}

}
