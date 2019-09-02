package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.User;
import com.test.domain.Votedes;
import com.test.service.UserService;
@Controller
public class VoteController {
	
	@Autowired
	UserService userservice; //spring注入
	
	
	@ResponseBody
	@RequestMapping("/selectAllVote") 
	public String toUserList(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		List<Votedes> list =  userservice.selectAllVote();
		System.out.println(list.size());
		
		ArrayList<JSONObject> userlist = new ArrayList<JSONObject>();
		//PrintWriter out = response.getWriter();
		//生成返回数据
		JSONObject obj = new JSONObject();
	
			try {			
				obj.put("Userlist", list);
				System.out.println("json data:"+obj.toString());
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("数据返回对象obj："+obj);
			
			return ""+obj;
	}
			

}
