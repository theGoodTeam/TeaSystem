package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import com.test.domain.Battle;
import com.test.domain.Player;
import com.test.domain.User;
import com.test.service.UserService;

@Controller
public class PlayerContrller {
	@Autowired
	UserService userservice; //spring注入
	
	@ResponseBody
	@RequestMapping(value="/selectPlayerAll", produces = "application/json; charset=utf-8") 
	public String toSelectPlayerAll(HttpServletRequest request,ModelMap map,HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
		response.setCharacterEncoding("utf-8"); // 显示页面输出动态

		
		List<Player>  userlist = userservice.selectPlayerAll();
		System.out.println("RESULT--------"+userlist.size());
		
		
		//生成返回数据
		JSONObject obj = new JSONObject();
	
			try {			
				obj.put("Userlist", userlist);
				System.out.println("json data:"+obj.toString());
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("数据返回对象obj："+obj); 
			 
			return ""+obj;
	
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/playerNaTi", produces = "application/json; charset=utf-8") 
	public String toPlayerNaTi(HttpServletRequest request,ModelMap map,HttpServletResponse response){
		
		
		List<Battle>  userlist = userservice.selectBattleAll();
		System.out.println("RESULT--------"+userlist.size());
		
		ArrayList<JSONObject> userlist1 = new ArrayList<JSONObject>();
		/*for(Player player:userlist) {
		System.out.println("username:"+player.getPlayer_name());
	    }*/
		
		
		//生成返回数据
		JSONObject obj = new JSONObject();
	
			try {			
				obj.put("Userlist", userlist);
				System.out.println("json data:"+obj.toString());
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("数据返回对象obj："+obj); 
			 
			return ""+obj;
	
		
	}

	
	
	@ResponseBody
	@RequestMapping(value="/selectPlayerTiteByName", produces = "application/json; charset=utf-8") 
	public String toSelectPlayerTiteByName(Player player,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
		response.setCharacterEncoding("utf-8"); // 显示页面输出动态

		System.out.println(player.getPlayer_name());
		
		List<Player>  playerresult = userservice.selectPlayerTiteByName(player.getPlayer_name());
		System.out.println("RESULT--------"+playerresult.size());
		
		
		//生成返回数据
		JSONObject obj = new JSONObject();
	
			try {			
				obj.put("Userlist", playerresult);
				System.out.println("json data:"+obj.toString());
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("数据返回对象obj："+obj); 
			 
			return ""+obj;
	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/playerPair") 
	public String toUpdateUserById(Battle battle,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		
		System.out.println("player1="+battle.getPlayer1());
		System.out.println("player1title="+battle.getPlayer1_title());
		System.out.println("player2="+battle.getPlayer2());
		System.out.println("player2title="+battle.getPlayer2_title());
		
		
		int result = userservice.addBattlePair(battle);
		System.out.println("RESULT--------"+result);
	
		return "playerPair";
	}
	
	
	@RequestMapping("/register_player") 
	public String toRegister_player(Player player,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		
		System.out.println("player_name="+player.getPlayer_name());
		System.out.println("player_password="+player.getPlayer_password());
		
		
		
		int result = userservice.addPlayer(player);
		System.out.println("RESULT--------"+result);

		if(result>=1) {
			map.put("result", result);
//			JOptionPane.showMessageDialog(null, "更改成功！", "提示", JOptionPane.ERROR_MESSAGE);
			return "player_login";
		}else {	
//			JOptionPane.showMessageDialog(null, "更改失败！", "提示", JOptionPane.ERROR_MESSAGE);
			return "player_login";
		}
	}

		@RequestMapping("/login_player") 
		public String toLogin_player(User user,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			
			System.out.println("player_name="+user.getUser_name());
			System.out.println("player_password="+user.getUser_passwod());
			
			
			
			List<User> playerresult  = userservice.selectPlayerByPlayer(user);
			System.out.println("RESULT--------"+playerresult.size());

			if(playerresult.size()>0) {
				
				User userresult = userservice.SelectUserByUsername(user);
				System.out.println(userresult.getUser_name());
				map.put("userresult", userresult);
				
				return "PK";
			}else {	

				return "PK";
			}
			
		
	}
		
		@RequestMapping("/updatePlayer") 
		public String toUpdatePlayer(Player player,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			
			System.out.println("player_name="+player.getPlayer_id());
			
	
			Player playerresult = userservice.selectPlayerById(player.getPlayer_id());
			System.out.println("RESULT--------"+playerresult.getPlayer_name());

			if(playerresult !=null) {
				request.setAttribute("playerresult", playerresult);

				return "updatePlayerApply";
			}else {	
				return "updatePlayerApply";
			}
			
			
	 }
		
		
		
		@RequestMapping("/updatePlayerById") 
		public String toUpdatePlayerById(Player player,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			
			System.out.println("player_id="+player.getPlayer_id());
			
			
			int result = userservice.updatePlayerById(player);
			

			if(result >=1) {
				
				return "playerlist";
			}else {	
				return "playerlist";
			}
			
			
	 }
		@RequestMapping("/deletePlayerById") 
		public String toDeletePlayerById(Player player,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			
			System.out.println("player_id="+player.getPlayer_id());
			
			
			int result = userservice.deletePlayerById(player.getPlayer_id());
			

			if(result >=1) {
				
				return "playerlist";
			}else {	
				return "playerlist";
			}
			
			
	 }
		

		/**
		 * 关键字查询信息 返回 list<user>
		 */
		@RequestMapping("/selectPlayerByKey") 
		public String selectPlayerByKey(String key,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			System.out.println("KEY="+key);
			
			
			List<Player>  playerlist = userservice.selectPlayerByKey(key);
			System.out.println("RESULT--------"+playerlist.size());
			
			

			HttpSession session = request.getSession();
			session.setAttribute("playerlist", playerlist);
		
			return "queryPlayer";
			
		}
		
		@ResponseBody
		@RequestMapping(value="/selectPlayer1ByName", produces = "application/json; charset=utf-8") 
		public String toselectPlayer1ByName(HttpServletRequest request,ModelMap map,HttpServletResponse response) throws ServletException, IOException{
			response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
			response.setCharacterEncoding("utf-8"); // 显示页面输出动态
			request.setCharacterEncoding("utf-8");//处理客户端传来的信息 ：get到的数据
			System.out.println("getPlayer_name="+request.getParameter("player1"));
			

			List<Player> player1 = userservice.selectPlayer1ByName(request.getParameter("player1"));

			//生成返回数据
			JSONObject obj = new JSONObject();
		
				try {			
					obj.put("Userlist", player1);
					System.out.println("json data:"+obj.toString());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("数据返回对象obj："+obj); 
				 
				return ""+obj;
		
		
		}
		
		@ResponseBody
		@RequestMapping(value="/selectPlayer2ByName", produces = "application/json; charset=utf-8") 
		public String toselectPlayer2ByName(HttpServletRequest request,ModelMap map,HttpServletResponse response) throws ServletException, IOException{
			response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
			response.setCharacterEncoding("utf-8"); // 显示页面输出动态
			request.setCharacterEncoding("utf-8");//处理客户端传来的信息 ：get到的数据
			System.out.println("getPlayer_name="+request.getParameter("player2"));
			

			List<Player> player2 = userservice.selectPlayer2ByName(request.getParameter("player2"));

			//生成返回数据
			JSONObject obj = new JSONObject();
		
				try {			
					obj.put("Userlist", player2);
					System.out.println("json data:"+obj.toString());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("数据返回对象obj："+obj); 
				 
				return ""+obj;
		
		
		}
		
		
		@RequestMapping("/Imgtest2") 
		public void toImgtest2(Player player,HttpServletRequest request,ModelMap map,HttpServletResponse response){
			
			System.out.println("player_num="+player.getPlayer_num());
			System.out.println("player_name="+player.getPlayer_name());
			System.out.println("player_img="+player.getPlayer_img());
			System.out.println("player_title="+player.getPlayer_title());
			//System.out.println("player_type="+player.getPlayer_type());
			
			System.out.println("player_sex="+player.getPlayer_sex());
			System.out.println("player_phone="+player.getPlayer_phone());
			System.out.println("player_birthday="+player.getPlayer_birthday());
			
			System.out.println("player_email="+player.getPlayer_email());
			System.out.println("player_info="+player.getPlayer_info());
			
			
			
	 }
		
		


}
