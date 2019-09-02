package com.test.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import com.test.domain.Player;
import com.test.domain.User;
import com.test.service.UserService;

import net.sf.json.JSON;

@Controller
public class UserController {
	@Autowired
	UserService userservice; //spring注入
	
	
	    //登录验证
		@RequestMapping("/login")
		public String login( User user,HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
			System.out.println("user_name="+user.getUser_name());
			System.out.println("user_passwod="+user.getUser_passwod());
			
			boolean result = userservice.login(user);
			System.out.println("RESULT--------"+result);
			
			if(result) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("main");
				return "index";
			}else {	
				map.put("message",result);//第2种传值
				//response.sendRedirect("index?result="+result);
				return "index";
			}

		}
		
		
		@RequestMapping("/addUser_controller")
		public String addUser( User user,HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
			System.out.println("user_name="+user.getUser_name());
			System.out.println("user_passwod="+user.getUser_passwod());
			System.out.println("user_sex="+user.getUser_sex());
			System.out.println("user_phone="+user.getUser_phone());
			System.out.println("user_rank="+user.getUser_rank());
			System.out.println("user_info="+user.getUser_info());
			
			int result = userservice.AddUser(user);
			System.out.println("RESULT--------"+result);
			
			if(result>=1) {
				map.put("result", result);
//				JOptionPane.showMessageDialog(null, "更改成功！", "提示", JOptionPane.ERROR_MESSAGE);
				return "addUser";
			}else {	
//				JOptionPane.showMessageDialog(null, "更改失败！", "提示", JOptionPane.ERROR_MESSAGE);
				return "addUser";
			}
			

		}
		
		
		@ResponseBody
		@RequestMapping("/userListShow") 
		public String toUserList(HttpServletRequest request,HttpServletResponse response) throws IOException{
			response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
			List<User> list =  userservice.SelectAll_User();
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
		
		
		@ResponseBody
		@RequestMapping(value="/playerListShow", produces = "application/json; charset=utf-8") 
		public String toPlayerListShow(HttpServletRequest request,HttpServletResponse response) throws IOException{
			
			List<Player> list =  userservice.SelectAll_Player();
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
		
		
		@RequestMapping("/deleteUserById")
		public String deleteUserById( String user_id,HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
			System.out.println("user_id="+user_id);
			
			
			int result = userservice.deleteUserById(user_id);
			System.out.println("RESULT--------"+result);
			
			if(result>=1) {
				map.put("result", result);
				//JOptionPane.showMessageDialog(null, "更改成功！", "提示", JOptionPane.ERROR_MESSAGE);
				return "userList";
			}else {	
				//JOptionPane.showMessageDialog(null, "更改失败！", "提示", JOptionPane.ERROR_MESSAGE);
				return "userList";
			}
			

		}
		

	
		
		@RequestMapping("/updateUser") 
		public User toUpdateUser(int user_id,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			System.out.println("user_id="+user_id);
			
			
			User user_result = userservice.selectUserById(user_id);
			System.out.println("RESULT--------"+user_result.getUser_name());
			
			HttpSession session = request.getSession();
			session.setAttribute("user_result", user_result);
		
			return user_result;
		}

		
		
		@RequestMapping("/userUpdateById") 
		public String toUpdateUserById(User user,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			System.out.println("user_name="+user.getUser_name());
			System.out.println("user_passwod="+user.getUser_passwod());
			System.out.println("user_sex="+user.getUser_sex());
			System.out.println("user_phone="+user.getUser_phone());
			System.out.println("user_rank="+user.getUser_rank());
			System.out.println("user_info="+user.getUser_info());
			System.out.println("user_id="+user.getUser_id());
			
			int result = userservice.updateUserById(user);
			System.out.println("RESULT--------"+result);
		
			return "userList";
		}

		
		/**
		 * 关键字查询信息 返回 list<user>
		 */
		@RequestMapping("/selectUserByKey") 
		public String toSelectUserByKey(String key,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			System.out.println("KEY="+key);
			
			
			List<User>  userlist = userservice.selectUserByKey(key);
			System.out.println("RESULT--------"+userlist.size());
			

			HttpSession session = request.getSession();
			session.setAttribute("userlist", userlist);
		
			return "queryUser";
			
		}

		
		@ResponseBody
		@RequestMapping("/addPlayerinfo") 
		public void toAddPlayerinfo(Player player,String province,String city,String area,
			HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
			response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
			response.setCharacterEncoding("utf-8"); // 显示页面输出动态
			request.setCharacterEncoding("utf-8");//处理客户端传来的信息 ：get到的数据
			
			String[] favourite = request.getParameterValues("player_favorite");
			//处理爱好  
			String favourite_s="";//存到数据库中的爱好
			
			for(int i = 0;i<favourite.length;i++){
				favourite_s += favourite[i]+" ";
				
			}
			
			System.out.println("player_num="+player.getPlayer_num());
			System.out.println("player_name="+player.getPlayer_name());
			System.out.println("player_img="+player.getPlayer_img());
			System.out.println("player_title="+player.getPlayer_title());
			//System.out.println("player_type="+player.getPlayer_type());
			System.out.println("player_favorite="+favourite_s);
			System.out.println("player_sex="+player.getPlayer_sex());
			System.out.println("player_phone="+player.getPlayer_phone());
			System.out.println("player_birthday="+player.getPlayer_birthday());
			System.out.println("player_address="+province+city+area);
			System.out.println("player_email="+player.getPlayer_email());
			System.out.println("player_info="+player.getPlayer_info());
			
			int result = userservice.addPlayer(player);
			System.out.println("RESULT--------"+result);
			
			if(result>0) {
				response.sendRedirect("playerlist");
			}else {
				response.sendRedirect("playerlist");
			
			}
	
		}
		

		@ResponseBody
	    @RequestMapping("img")
	    public Map<String,Object> addlunbo(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
	        Assert.notNull(file, "上传文件不能为空");
	        String filepath = request.getServletContext().getRealPath("/lunbotu");
	        String filename = System.currentTimeMillis()+file.getOriginalFilename();
	        //确保路径存在
	        File file2 = new File(filepath);
	        if (!file2.exists()) {
	            file2.mkdirs();
	        }
	        String savepath = filepath+"\\"+filename;
	        System.out.println("轮播图保存路径:"+savepath);
	        Map map = new HashMap<String,Object>();
	        try {
	            //保存文件到服务器
	            file.transferTo(new File(savepath));
	            //保存到数据库

	            //返回json
	            map.put("msg","ok");
	            map.put("code",200);
	            /*加不加这个都行
	            map.put("data",new HashMap<String,Object>(){
	                {
	                    put("src",savepath);
	                }
	            });*/
	          
	        } catch (Exception e) {
	            map.put("msg","error");
	            map.put("code",0);
	            e.printStackTrace();
	        }

	        return map;
	    }

		
	
		
}
