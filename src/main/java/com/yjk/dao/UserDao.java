package com.yjk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yjk.pojo.Menu;
import com.yjk.pojo.Role;
import com.yjk.pojo.User;

public interface UserDao {
	//登录
	public User loginUser(@Param("name")String name,@Param("password")String password);
	//查询所有用户信息
	public List<User> allUser();
	//显示用户所拥有的菜单
	public List<Menu> getidMenu(int id);
	//显示登录人的按钮
	public List<Menu> getidButton(@Param("user_id")int user_id,@Param("menu_parent")int menu_parent);
	//查询所有菜单信息
	public List<Menu> getallmenu();
	//分配权限---先删除
	public int deleuserMenu(Integer id);
	//分配权限---再添加
	public int adduserMenu(@Param("id") int id,@Param("ids") int ids);
	//查询所有角色
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
