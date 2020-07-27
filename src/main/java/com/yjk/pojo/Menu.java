package com.yjk.pojo;
/**
 * 菜单表
 * 
 *
 */
public class Menu {
		public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(int menu_type) {
		this.menu_type = menu_type;
	}
	public int getMenu_parent() {
		return menu_parent;
	}
	public void setMenu_parent(int menu_parent) {
		this.menu_parent = menu_parent;
	}
	public String getMenu_uri() {
		return menu_uri;
	}
	public void setMenu_uri(String menu_uri) {
		this.menu_uri = menu_uri;
	}
	public String getMenu_describe() {
		return menu_describe;
	}
	public void setMenu_describe(String menu_describe) {
		this.menu_describe = menu_describe;
	}
		private int id;		//id
		private String menu_name;	//权限名称
		private int menu_type;		//菜单类型
		private int menu_parent;	//菜单父级
		private String menu_uri;	//菜单路径
		private String menu_describe;//描述
		
}
