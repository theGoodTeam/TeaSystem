package com.test.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.websocket.Session;

import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * 控制层
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.test.domain.User;

import com.test.service.UserService;

@Controller //@@Controller 用于注释类
//@RequestMapping("/home") //访问路径：http://localhost:8080/springmvc/home/index

public class IndexController {
	
	
	@Autowired
	UserService userservice; //spring注入
	
	
	@RequestMapping("/index") //@RequestMapping 用于注释类或者方法index为目标资源
	public String toIndex(){
		return "index";		
	}
	
	@RequestMapping("/right") 
	public String toUIMain(){
		return "right";		
	}
	
	@RequestMapping("/main") 
	public String toMain(){
		return "main";		
	}
	
	@RequestMapping("/userList") 
	public String toUserList(){
			return "userList";
	}
	
	@RequestMapping("/addUser") 
	public String toAddUser(){
		return "addUser";		
	}
	
	@RequestMapping("/404") 
	public String to404(){
		return "404";		
	}
	
	@RequestMapping("/queryUser") 
	public String toQueryUser(){
		return "queryUser";		
	}
	
	
	@RequestMapping("/playerApply") 
	public String toPlayerApply(){
		return "playerApply";		
	}
	
	@RequestMapping("/test1") 
	public String toTest1(){
		return "test1";		
	}
	@RequestMapping("/test2") 
	public String toTest2(){
		return "test2";		
	}
	
	
	@RequestMapping("/PK") 
	public String toPK(){
		return "PK";		
	}
	
	@RequestMapping("/PKtest") 
	public String toPKtest(){
		return "PKtest";		
	}
	
	
	@RequestMapping("/playerContest") 
	public String toPlayerContest(){
		return "playerContest";		
	}
	
	@RequestMapping("/Aulogin") 
	public String toAulogin(){
		return "Aulogin";		
	}
	
	@RequestMapping("/player_register") 
	public String toPlayer_register(){
		return "player_register";		
	}
	
	@RequestMapping("/playerlist") 
	public String toPlayerlist(){
		return "playerlist";		
	}
	
	@RequestMapping("/000") 
	public String to000(){
		return "000";		
	}
	
	@RequestMapping("/updatePlayerApply") 
	public String toupdatePlayerApply(){
		return "updatePlayerApply";		
	}
	
	@RequestMapping("/updateBattle") 
	public String toUpdateBattle(){
		return "updateBattle";		
	}
	
	@RequestMapping("/contest") 
	public String toContest(){
			return "contest";
	}
	

	@RequestMapping("/addContest") 
	public String toAddContest(){
			return "addContest";
	}
	

	@RequestMapping("/updateContest") 
	public String toUpdateContest(){
			return "updateContest";
	}
	
	@RequestMapping("/querycontest") 
	public String toQuerycontest(){
			return "querycontest";
	}
}




