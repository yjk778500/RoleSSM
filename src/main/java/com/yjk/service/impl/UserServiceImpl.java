package com.yjk.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjk.dao.UserDao;
import com.yjk.pojo.Menu;
import com.yjk.pojo.Role;
import com.yjk.pojo.User;
import com.yjk.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Override
	public User loginUser(String name, String password) {
		// TODO Auto-generated method stub
		return userDao.loginUser(name, password);
	}
	@Override
	public List<User> allUser() {
		// TODO Auto-generated method stub
		return userDao.allUser();
	}
	@Override
	public List<Menu> getidMenu(int id) {
		// TODO Auto-generated method stub
		return userDao.getidMenu(id);
	}
	@Override
	public List<Menu> getidButton(int user_id, int menu_parent) {
		// TODO Auto-generated method stub
		return userDao.getidButton(user_id, menu_parent);
	}
	@Override
	public List<Menu> getallmenu() {
		// TODO Auto-generated method stub
		return userDao.getallmenu();
	}
	@Override
	public int deleuserMenu(Integer id) {
		// TODO Auto-generated method stub
		return userDao.deleuserMenu(id);
	}
	@Override
	public int adduserMenu(int id, int ids) {
		// TODO Auto-generated method stub
		return userDao.adduserMenu(id, ids);
	}
	@Override
	public List<Role> getallrole() {
		// TODO Auto-generated method stub
		return userDao.getallrole();
	}
	@Override
	public List<Menu> MenuOne() {
		// TODO Auto-generated method stub
		return userDao.MenuOne();
	}
	@Override
	public List<Menu> MenuTwo() {
		// TODO Auto-generated method stub
		return userDao.MenuTwo();
	}
	@Override
	public List<Menu> MenuThree() {
		// TODO Auto-generated method stub
		return userDao.MenuThree();
	}
	@Override
	public int delUser(int ids) {
		// TODO Auto-generated method stub
		return userDao.delUser(ids);
	}
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user);
	}
	@Override
	public List<User> getUserid(int id) {
		// TODO Auto-generated method stub
		return userDao.getUserid(id);
	}
	@Override
	public List<User> mohuUser(Map<String, String> map) {
		// TODO Auto-generated method stub
		return userDao.mohuUser(map);
	}

}
