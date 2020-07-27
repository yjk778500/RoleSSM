package com.yjk.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yjk.pojo.Menu;
import com.yjk.pojo.Role;
import com.yjk.pojo.User;
import com.yjk.service.UserService;
@SessionAttributes(value="user2",types={User.class})
@Controller
public class indexController {
	@Autowired
	private UserService us;
	//登录页面
	@RequestMapping({"/index",""})
	public String index() {
		return "index";
	}
	//主页面
	@RequestMapping("/menu")
	public String menu(HttpServletRequest request,Model model) {
		User user1 = (User) request.getSession().getAttribute("user1");
		int id = 0;
		if(user1 == null || user1== null) {
			id= 1;
		}else {
			id=user1.getId();
		}
		List<Menu> user2 = us.getidMenu(id);
		model.addAttribute("menu", user2);
		return "login";
	}
	//查询用户信息
	@RequestMapping("/allUser")
	public String allUser(Model model,String uri,int user_id,int menu_parent){
		Map<String, String>map=new HashMap<String, String>();
		List<User> list = us.allUser();
		List<Menu> button = us.getidButton(user_id, menu_parent);
		model.addAttribute("button", button);
		model.addAttribute("list", list);
			return "allUser";
	}
	@RequestMapping("/mohu")
	public String mohu(String name,String gender,Model model) {
		Map<String, String>map=new HashMap<String, String>();
		System.out.println("先进的");
		map.put("name", name);
		map.put("gender", gender);
		List<User> listA=us.mohuUser(map);
		model.addAttribute("name",name);
		model.addAttribute("gender",gender);
		model.addAttribute("listA",listA);
		return "redirect:allUser";
	}
	
	//查询显示所有权限
	@RequestMapping("/menuUser")
	
	public String menuUser(Model model,String uri,int user_id,int menu_parent) {
		ObjectMapper mapper=new ObjectMapper();
		List<Menu> lis = us.getallmenu();
		List<Menu> btn = us.getidButton(user_id, menu_parent);
		List<Menu> list1=us.MenuOne();
		List<Menu> list2=us.MenuTwo();
		List<Menu> list3=us.MenuThree();
			
			try {
				String button = mapper.writeValueAsString(btn);
				String list=mapper.writeValueAsString(lis);
				String listMenu1=mapper.writeValueAsString(list1);
				String listMenu2=mapper.writeValueAsString(list2);
				String listMenu3=mapper.writeValueAsString(list3);
			model.addAttribute("Dang", button);
			model.addAttribute("some", list);
			model.addAttribute("listMenu1",listMenu1);
			model.addAttribute("listMenu2",listMenu2);
			model.addAttribute("listMenu3",listMenu3);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("button", btn);
			model.addAttribute("listmenu", lis);
	
			return "userMenu";
	}
	
	@RequestMapping("/roleUser")
	public String roleUser(Model model,String uri,int user_id,int menu_parent) {
		List<Role> list = us.getallrole();
		List<Menu> button = us.getidButton(user_id, menu_parent);
		model.addAttribute("button", button);
		model.addAttribute("listmenu", list);
			return "roleUser";
	}
	@RequestMapping("/Liangzi")
	public String Liangzi(Model model,String uri,int user_id,int menu_parent) {
		List<Role> list = us.getallrole();
		List<Menu> button = us.getidButton(user_id, menu_parent);
		model.addAttribute("button", button);
		model.addAttribute("listmenu", list);
		return "Liangzi";
	}
	//跳转到分配权限页面
	@RequestMapping("/Quan")
	public String Quan(Model model,String uri,int id) {
		List<Menu> list = us.getallmenu();
		List<Menu> button = us.getidMenu(id);
		model.addAttribute("id",id);
		model.addAttribute("button", button);
		model.addAttribute("listmenu", list);
			return "Menu";
		
	}
	//分配权限
	@RequestMapping("/updatemenu")
	@ResponseBody
	public Map<String, String> updatemenu(int[] ids,Integer id,HttpServletRequest request){
		Map<String,String> map = new HashMap<String,String>();
		//先删除，再添加
		int row = us.deleuserMenu(id);
		int addmenu=0;
		for(int i=0;i<ids.length;i++) {
			addmenu = us.adduserMenu(id, ids[i]);
		}
		if(addmenu<=0) {
			map.put("type", "error");
			map.put("msg","分配失败");
			return map;
		}
		map.put("type", "success");
		map.put("msg","分配成功");
		return map;
	}
	//登录
		@RequestMapping("/login")
		@ResponseBody
		public Map<String, String> login(String name, String password,HttpServletRequest request) {
			Map<String, String> map = new HashMap<String, String>();
			User user = us.loginUser(name, password);
			if(user == null) {
				map.put("type", "error");
				map.put("msg", "用户名或密码输入错误!");
				return map;
			}
			request.getSession().setAttribute("user1",user);
			map.put("type","success");
			map.put("msg", "登录成功");
			return map;
		}
		
		
		@RequestMapping("/upRole")
		public String upRole(Model model){
		 return "upRole";
		}
		
		@RequestMapping("/delUser")
		@ResponseBody
		public Map<String, String> delUser(int[] ids){
			System.out.println("进来了");
			Map<String, String> map=new HashMap<String, String>();
			int a=0;
			for (int i = 0; i < ids.length; i++) {
					a =us.delUser(ids[i]);
			}
			if (a>0) {
				map.put("type", "error");
				map.put("msg", "删除成功!");
				return map;
			}else {
				map.put("type", "success");
				map.put("msg", "删除失败!");
				return map;
			}
			
		}
		@RequestMapping("/addUser")
		public String addUser(Model model) {
			model.addAttribute("a",1);
			return "addUser";
		}
		
		@RequestMapping("/upUser")
		public String upUser(Model model,int[] id) {
			List<User> userlist=new ArrayList<User>();
			for (int i = 0; i < id.length; i++) {
				userlist=us.getUserid(id[i]);
			}
			
			model.addAttribute("userList",userlist);
			model.addAttribute("a",2);
			return "addUser";
		}
		
		@RequestMapping("/addbaoc")
		@ResponseBody
		public Map<String, String> addbaoc(Model model,User user){
			Map<String, String>map=new HashMap<String, String>();
			System.out.println("进来了");
			int a=us.addUser(user);
			if (a>0) {
				map.put("type", "success");
				map.put("msg", "添加用户成功!");
				return map;
			}else {
				map.put("type", "error");
				map.put("msg", "添加用户失败!");
				return map;
			}
		
		}
}
