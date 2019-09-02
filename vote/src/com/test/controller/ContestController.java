package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.Contest;
import com.test.domain.Player;
import com.test.domain.User;
import com.test.service.UserService;
@Controller
public class ContestController {
	
	@Autowired
	UserService userservice; //spring注入
	
	
	@ResponseBody
	@RequestMapping(value="/contestListShow", produces = "application/json; charset=utf-8") 
	public String toContestListShow(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=utf-8");//处理中文乱码（页面显示中文）
		List<Contest> list =  userservice.SelectAll_Contest();
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
	
	
	
	@RequestMapping("/addContestContrllor") 
	public void toAddContestContrllor(Contest contest,String province,String city,String area,
		HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
		
		

		contest.setContest_site(province+","+city+","+area);
		System.out.println("getContest_name="+contest.getContest_name());
		System.out.println("getContest_site="+contest.getContest_site());
		System.out.println("getContest_des="+contest.getContest_des());
		
		System.out.println("getContest_time="+contest.getContest_time());
		
		
		
		int result = userservice.addContest(contest);
		System.out.println("RESULT--------"+result);
		
		if(result>0) {
			response.sendRedirect("contest");
		}else {
			response.sendRedirect("contest");
		
		}

	}
	

	@RequestMapping("/updateContestSubmit") 
	public void toUpdateContestSubmit(Contest contest,String province,String city,String area,
		HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
		
		

		contest.setContest_site(province+","+city+","+area);
		System.out.println("getContest_name="+contest.getContest_name());
		System.out.println("getContest_site="+contest.getContest_site());
		System.out.println("getContest_des="+contest.getContest_des());
		
		System.out.println("getContest_time="+contest.getContest_time());
		
		
		
		int result = userservice.updateContestSubmit(contest);
		System.out.println("RESULT--------"+result);
		
		if(result>0) {
			response.sendRedirect("contest");
		}else {
			response.sendRedirect("contest");
		
		}

	}
	
	
	
	@RequestMapping("/deleteContestById")
	public String deleteContestById( String battle_id,HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
		System.out.println("user_id="+battle_id);
		
		
		int result = userservice.deleteContestById(battle_id);
		System.out.println("RESULT--------"+result);
		
		if(result>=1) {
			map.put("result", result);
			//JOptionPane.showMessageDialog(null, "更改成功！", "提示", JOptionPane.ERROR_MESSAGE);
			return "contest";
		}else {	
			//JOptionPane.showMessageDialog(null, "更改失败！", "提示", JOptionPane.ERROR_MESSAGE);
			return "contest";
		}
		

	}
	


	
	@RequestMapping("/updateContestController") 
	public String toUpdateUser(int contest_id,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		System.out.println("battle_id="+contest_id);
		
		
		Contest contest = userservice.selectContestById(contest_id);
		System.out.println("RESULT--------"+contest.getContest_name());
		
		map.put("contest", contest);
	
		return "updateContest";
	}

	
	/**
	 * 关键字查询信息 返回 list<user>
	 */
	@RequestMapping("/selectContestByKey") 
	public String selectContestByKey(String key,HttpServletRequest request,ModelMap map,HttpServletResponse response){
		System.out.println("KEY="+key);
		
		
		List<Contest>  contestlist = userservice.selectContestByKey(key);
		System.out.println("RESULT--------"+contestlist.size());
		

		HttpSession session = request.getSession();
		session.setAttribute("contestlist", contestlist);
	
		return "querycontest";
		
	}
	
	@RequestMapping("/updateContestStateById")
	public String updateContestStateById( String battle_id,HttpServletRequest request,ModelMap map,HttpServletResponse response) throws IOException{
		System.out.println("user_id="+battle_id);
		
		int result = userservice.updateContestStateById(battle_id);
		System.out.println("RESULT--------"+result);
		
		if(result>=1) {
			map.put("result", result);
			//JOptionPane.showMessageDialog(null, "更改成功！", "提示", JOptionPane.ERROR_MESSAGE);
			return "contest";
		}else {	
			//JOptionPane.showMessageDialog(null, "更改失败！", "提示", JOptionPane.ERROR_MESSAGE);
			return "contest";
		}
		

	}
	
	

}
