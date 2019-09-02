package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.Battle;
import com.test.domain.Player;
import com.test.domain.User;
import com.test.domain.Votedes;
import com.test.service.UserService;

@Controller
public class BattleController {
	@Autowired
	UserService userservice; //spring注入
	
	
	@RequestMapping("/addBattle") 
	public String toAddBattle(Battle battle,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		
		System.out.println("player1="+battle.getPlayer1());
		System.out.println("player2="+battle.getPlayer2());
		System.out.println("player1_title="+battle.getPlayer1_title());
		System.out.println("player2_title="+battle.getPlayer2_title());
		
		int result = userservice.addBattle(battle);
		
		if(result >=1) {
			
			return "000";
		}else {	
			return "000";
		}
		
		
 }
	
	@RequestMapping("/selectBattleById") 
	public String toSelectBattleById(Battle battle,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		
		System.out.println("contest_id="+battle.getContest_id());
		
		
		Battle battleresult = userservice.selectBattleById(battle.getContest_id());
		
		if(battleresult!= null) {
			request.setAttribute("battleresult", battleresult);
			return "updateBattle";
		}else {	
			return "updateBattle";
		}
		
		
   }
	
	@RequestMapping("/updateBattleByContestId") 
	public String toUpdateBattle(Battle battle,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		
		
		System.out.println("Player1_ticket="+battle.getPlayer1_judge());
		System.out.println("Player2_ticket="+battle.getPlayer2_judge());
	
		
		//int getPlayer1_totalscore = ((battle.getPlayer1_ticket()/(battle.getPlayer1_ticket()+battle.getPlayer2_ticket())*200)+battle.getPlayer1_judge());
		//System.out.println(battle.getPlayer1_totalscore());
		Battle newbattle =new Battle() ;
		
		
		String num = ""+(battle.getPlayer1_ticket()+battle.getPlayer2_ticket());
		System.out.println(num);
		if( num.equals("0")){
			
			newbattle.setPlayer1_totalscore(battle.getPlayer1_judge());
			newbattle.setPlayer2_totalscore(battle.getPlayer2_judge());
		}else{
			newbattle.setPlayer1_totalscore(battle.getPlayer1_judge()+battle.getPlayer1_ticket());
			newbattle.setPlayer2_totalscore(battle.getPlayer2_judge()+battle.getPlayer2_ticket());
		}
		newbattle.setContest_id(battle.getContest_id());
		newbattle.setPlayer1(battle.getPlayer1());
		newbattle.setPlayer2(battle.getPlayer2());
		newbattle.setPlayer1_title(battle.getPlayer1_title());
		newbattle.setPlayer2_title(battle.getPlayer2_title());
		newbattle.setPlayer1_ticket(battle.getPlayer1_ticket());
		newbattle.setPlayer2_ticket(battle.getPlayer2_ticket());
		newbattle.setPlayer1_judge(battle.getPlayer1_judge());
		newbattle.setPlayer2_judge(battle.getPlayer2_judge());
		
		
		System.out.println("Contest_id="+newbattle.getContest_id());
		System.out.println("player1="+newbattle.getPlayer1());
		System.out.println("player2="+newbattle.getPlayer2());
		System.out.println("player1_title="+newbattle.getPlayer1_title());
		System.out.println("player2_title="+newbattle.getPlayer2_title());
		
		
		System.out.println("getPlayer1_ticket="+newbattle.getPlayer1_ticket());
		System.out.println("getPlayer2_ticket="+newbattle.getPlayer2_ticket());
		System.out.println("getPlayer1_judge="+newbattle.getPlayer1_judge());
		System.out.println("getPlayer2_judge="+newbattle.getPlayer2_judge());
		System.out.println("getPlayer1_totalscore="+newbattle.getPlayer1_totalscore());
		System.out.println("getPlayer2_totalscore="+newbattle.getPlayer2_totalscore());
		
		int result = userservice.updateBattle(newbattle);
		
		if(result>=1) {
			
			return "playerContest";
		}else {	
			return "playerContest";
		}
		
		
   }
	

	
	@RequestMapping("/deleteBattleById") 
	public String todeleteBattleById(String user_id,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		
		
		System.out.println("Contest_id="+user_id);
	
		
		int result = userservice.deleteBattleById(user_id);
		
		if(result>=1) {
			
			return "playerContest";
		}else {	
			return "playerContest";
		}
		
		
   }
	
	
	@ResponseBody
	@RequestMapping(value="/battleListShow", produces = "application/json; charset=utf-8") 
	public String toBattleListShow(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
		
		List<Battle> list =  userservice.SelectAll_Battle();
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
	
	
	@RequestMapping("/player1_vate") 
	public String toPlayer1_vate(Battle battle,String user_id,String battle_id,String palyer1_id, HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException, ServletException {
		
		System.out.println("Contest_id="+battle.getContest_id());
		System.out.println("User_id="+user_id);
		System.out.println("battle_id="+battle_id);
		System.out.println("palyer1_id="+palyer1_id);
		Votedes vote = new Votedes();
		
		vote.setContest_id(battle.getContest_id());
		vote.setUser_id(Integer.parseInt(user_id));
		vote.setBattle_id(Integer.parseInt(battle_id));
		vote.setPlayer_id(Integer.parseInt(palyer1_id));
		vote.setTicket(1);
		
		int resultvote = userservice.addVoteIntoDB(vote);
		
		int result = userservice.updatePlayer1_ticket(battle);
		System.out.println("RESULT--------"+result);

		if(resultvote>=1 && result>=1) {
			map.put("result", result);
			//JOptionPane.showMessageDialog(null, "更改成功！", "提示", JOptionPane.ERROR_MESSAGE);
			return "PK";
			
		}else {	
			//JOptionPane.showMessageDialog(null, "更改失败！", "提示", JOptionPane.ERROR_MESSAGE);
			return "PK";
			
		}
		
	
	}
	
	
	@RequestMapping("/player2_vate") 
	public String toPlayer2_vate(Battle battle,String user_id,String battle_id,String palyer2_id,HttpServletRequest request,ModelMap map,HttpServletResponse response) throws ServletException, IOException{
		
		System.out.println("Contest_id="+battle.getContest_id());
		System.out.println("Contest_id="+battle.getContest_id());
		System.out.println("User_id="+user_id);
		System.out.println("battle_id="+battle_id);
		System.out.println("palyer2_id="+palyer2_id);

		Votedes vote = new Votedes();
		
		vote.setContest_id(battle.getContest_id());
		vote.setUser_id(Integer.parseInt(user_id));
		vote.setBattle_id(Integer.parseInt(battle_id));
		vote.setPlayer_id(Integer.parseInt(palyer2_id));
		vote.setTicket(1);
		
		int resultvote = userservice.addVoteIntoDB(vote);
		
		
		int result = userservice.updatePlayer2_ticket(battle);
		System.out.println("RESULT--------"+result);

		if(resultvote >=1 && result>=1) {
			map.put("result", result);
			//JOptionPane.showMessageDialog(null, "更改成功！", "提示", JOptionPane.ERROR_MESSAGE);
			return "PK";
		}else {	
			//JOptionPane.showMessageDialog(null, "更改失败！", "提示", JOptionPane.ERROR_MESSAGE);
			return "PK";
		}
		
	
	}
	

	
}
