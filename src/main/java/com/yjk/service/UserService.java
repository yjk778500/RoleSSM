package com.yjk.service;

import java.util.List;
import java.util.Map;

import com.yjk.pojo.Menu;
import com.yjk.pojo.Role;
import com.yjk.pojo.User;

public interface UserService {
	//登录
	public User loginUser(String name,String password);
	//查询所有用户信息
	public List<User> allUser();
	public List<Menu> getidMenu(int id);
	//显示当前登录的按钮
	public List<Menu> getidButton(int user_id,int menu_parent);
	public List<Menu> getallmenu();
	//分配权限---删除
	public int deleuserMenu(Integer id);
	//分配权限---添加
	public int adduserMenu(int id,int ids);
	//获取所有角色信息
	public List<Role> getallrole();
	//查询一级菜单信息
	public List<Menu> MenuOne();
	//查询二级菜单信息
	public List<Menu> MenuTwo();
	//查询三级菜单信息
	public List<Menu> MenuThree();
	//删除用户
	public int delUser(int ids);
	
	public int addUser(User user);
	
	public List<User> getUserid(int id);
	
	public List<User>mohuUser(Map<String, String>map);
}
