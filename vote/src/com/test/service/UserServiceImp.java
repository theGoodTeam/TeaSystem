package com.test.service;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.test.dao.UserDao;
import com.test.domain.Battle;
import com.test.domain.Contest;
import com.test.domain.Player;
import com.test.domain.User;
import com.test.domain.Votedes;
@Service
public class UserServiceImp implements UserService {
	@Resource
	UserDao dao;

	@Override
	public boolean login(User user) {
		System.out.println("UserService-----login");
				
				List<User> list = dao.findUser(user); 
				
				if(list.size()>=1) {
					return true;
				}else{
					return false;
				}
			}

	@Override
	public List<User> SelectAll_User() {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SelectAll_User");
		List<User> list = dao.findAllUser();
		return list;

	}

	@Override
	public boolean Register(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User SelectUserById(int userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User SelectUserByUsername(User user) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SelectUserByUsername");
		User user_result  = dao.findUserByUsername(user);
		return user_result;
	}

	@Override
	public boolean UpdateUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean UpdatePassword(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteUserById(int userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean UpdatePasswordUserByIds(int[] chek_value) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int AddUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("--------------AddUser------------");
		int result = dao.addUser(user);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public boolean ChooseUserToDelete(int[] chek_value) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<User> SereachUserByRole(String sereach_val) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteUserById(String user_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----deleteUserById");
		 int result = dao.DeleteUserById(user_id);
		 if(result>=1) {
			 return result;
		 }else {
			 return result;
		 }
	}

	@Override
	public User selectUserById(int user_id) {
		// TODO Auto-generated method stub

		System.out.println("UserService-----selectUserById");
		User user = dao.selectUserById(user_id);		
		return user;

	}

	
	@Override
	public int updateUserById(User user) {
		// TODO Auto-generated method stub
		int  result = dao.updateUserById(user);
		
		if(result>=0) {
			return result;
		}else {
			return result;
		}
		
	}

	@Override
	public List<User> selectUserByKey(String key) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectUserByKey");
		List<User> list = dao.selectUserByKey(key);
		return list;
	}

	@Override
	public List<Player> selectPlayerAll() {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SelectAll_User");
		List<Player> list = dao.selectPlayerAll();
		return list;
	}

	@Override
	public int addBattlePair(Battle battle) {
		// TODO Auto-generated method stub
		int  result = dao.addBattlePair(battle);
		
		if(result>=0) {
			return result;
		}else {
			return result;
		}
		
	}

	@Override
	public int addPlayer(Player player) {
		// TODO Auto-generated method stub
		System.out.println("UserService--------------addPlayer------------");
		int result = dao.addPlayer(player);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public List<User> selectPlayerByPlayer(User user) {
		// TODO Auto-generated method stub
		List<User> list = dao.findPlayer(user); 
		
		if(list.size()>=1) {
			return list;
		}else{
			return list;
		}
	}

	@Override
	public List<Player> SelectAll_Player() {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SelectAll_Player");
		List<Player> list = dao.findAllPlayer();
		return list;
	}

	@Override
	public Player selectPlayerById(int player_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----deleteUserById");
		  Player  player= dao.selectPlayerById(player_id);
		 if(player!=null) {
			 return player;
		 }else {
			 return player;
		 }
	}

	@Override
	public int updatePlayerById(Player player) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----updatePlayerById");
		int result = dao.updatePlayerById(player);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public int deletePlayerById(int player_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----deletePlayerById");
		 int result = dao.deletePlayerById(player_id);
		 if(result>=1) {
			 return result;
		 }else {
			 return result;
		 }
	}

	@Override
	public List<Player> selectPlayerByKey(String key) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectPlayerByKey");
		List<Player> list = dao.selectPlayerByKey(key);
		return list;
	}

	@Override
	public List<Battle> selectBattleAll() {
		// TODO Auto-generated method stub
		System.out.println("--------------selectBattleAll------------");
		List<Battle> battle = dao.selectBattleAll();
		if(battle.size()>=1) {
			return battle;
		}else {
			return battle;
		}
	}

	@Override
	public List<Player> selectPlayerTiteByName(String player_name) {
		// TODO Auto-generated method stub
		System.out.println("--------------selectPlayerTiteByName------------");
		List<Player> player = dao.selectPlayerTiteByName(player_name);
		if(player != null) {
			return player;
		}else {
			return player;
		}
	}

	@Override
	public int addBattle(Battle battle) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----addBattle");
		int result = dao.addBattle(battle);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public Battle selectBattleById(int contest_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectBattleById");
		Battle  battle= dao.selectBattleById(contest_id);
		 if(battle!=null) {
			 return battle;
		 }else {
			 return battle;
		 }
	}

	@Override
	public int updateBattle(Battle battle) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----updateBattle");
		int result = dao.updateBattle(battle);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public List<Battle> SelectAll_Battle() {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SelectAll_Battle");
		List<Battle> list = dao.SelectAll_Battle();
		return list;
	}

	@Override
	public int updatePlayer1_ticket(Battle battle) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----updatePlayer1_ticket");
		int result = dao.updatePlayer1_ticket(battle);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public int updatePlayer2_ticket(Battle battle) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----updatePlayer2_ticket");
		int result = dao.updatePlayer2_ticket(battle);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public List<Player> selectPlayer1ByName(String parameter) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectPlayer1ByName");
		List<Player> Player1 = dao.selectPlayer1ByName(parameter);
		 if(Player1!=null) {
			 return Player1;
		 }else {
			 return Player1;
		 }
	}

	@Override
	public List<Player> selectPlayer2ByName(String parameter) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectPlayer2ByName");
		List<Player> Player2 = dao.selectPlayer2ByName(parameter);
		 if(Player2!=null) {
			 return Player2;
		 }else {
			 return Player2;
		 }
	}

	@Override
	public int deleteBattleById(String contest_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----deleteBattleById");
		 int result = dao.deleteBattleById(contest_id);
		 if(result>=1) {
			 return result;
		 }else {
			 return result;
		 }
	}

	@Override
	public List<Contest> SelectAll_Contest() {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SelectAll_Contest");
		List<Contest> list = dao.SelectAll_Contest();
		return list;
	}

	@Override
	public int addContest(Contest contest) {
		// TODO Auto-generated method stub
		System.out.println("--------------addContest------------");
		int result = dao.addContest(contest);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public Contest selectContestById(int contest_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectContestById");
		Contest contest = dao.selectContestById(contest_id);		
		return contest;

	}

	@Override
	public int updateContestSubmit(Contest contest) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----updateContestSubmit");
		int result = dao.updateContestSubmit(contest);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
	}

	@Override
	public int deleteContestById(String battle_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----deleteContestById");
		 int result = dao.deleteContestById(battle_id);
		 if(result>=1) {
			 return result;
		 }else {
			 return result;
		 }
	}

	@Override
	public List<Contest> selectContestByKey(String key) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectContestByKey");
		List<Contest> list = dao.selectContestByKey(key);
		return list;
	}

	@Override
	public int updateContestStateById(String battle_id) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----updateContestStateById");
		 int result = dao.updateContestStateById(battle_id);
		 if(result>=1) {
			 return result;
		 }else {
			 return result;
		 }
	}

	@Override
	public int addVoteIntoDB(Votedes vote) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----addVoteIntoDB");
		 int result = dao.addVoteIntoDB(vote);
		 if(result>=1) {
			 return result;
		 }else {
			 return result;
		 }
	}

	@Override
	public List<Votedes> selectAllVote() {
		// TODO Auto-generated method stub
		System.out.println("UserService-----selectAllVote");
		List<Votedes> list = dao.selectAllVote();
		return list;
	}

	
	
	/*@Override
	public List<User> SelectAll_User(){
		
		System.out.println("UserService-----SelectAll_User");
		List<User> list = dao.finfAllUser();
		return list;

		}



	@Override
	public boolean Register(User user) {
		// TODO Auto-generated method stub
		int result = dao.addUser(user); 
		
		if(result >= 1) {
			return true;
		}else{
			return false;
		}
	
	}



	@Override
	public User SelectUserById(int userid) {
		// TODO Auto-generated method stub

		System.out.println("UserService-----SelectUserById");
		User user = dao.findUserById(userid);		
		return user;

	}



	*//**
	 *根据用户名查询ID
	 *//*
	@Override
	public User SelectUserByUsername(User user) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SelectUserIdByUsername");
		User user_result  = dao.findUserByUsername(user);
		return user_result;
		
	}


	*//**
	 * 修改用户信息
	 *//*
	@Override
	public boolean UpdateUser(User user) {
		// TODO Auto-generated method stub
		int  result = dao.UpdateUser(user);
	
		if(result>=0) {
			return true;
		}else {
			return false;
		}
		
		
	}



	@Override
	public boolean UpdatePassword(User user) {
		// TODO Auto-generated method stub
		int result = dao.UpdatePaaword(user);
		if(result>=1) {
			return true;
		}else {
			return false;
		}
		
	}



	@Override
	public boolean  DeleteUserById(int userid) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----DeleteUserById");
		 int result = dao.DeleteUserById(userid);
		 if(result>=1) {
			 return true;
		 }else {
			 return false;
		 }
		
	}



	@Override
	public boolean UpdatePasswordUserByIds(int[] chek_value) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----DeleteUserByIds");
		int result = dao.UpdatePasswordUserByIds(chek_value);
		if(result>=1) {
			return true;
		}else {
			return false;
		}
		
	}



	@Override
	public int AddUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("--------------AddUser------------");
		int result = dao.addUser(user);
		if(result>=1) {
			return result;
		}else {
			return result;
		}
		
	}



	@Override
	public boolean ChooseUserToDelete(int[] chek_value) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----ChooseUserToDelete");
		int result = dao.ChooseUserToDeleteByIds(chek_value);
		if(result>=1) {
			return true;
		}else {
			return false;
		}
		
	}



	@Override
	public List<User> SereachUserByRole(String sereach_val) {
		// TODO Auto-generated method stub
		System.out.println("UserService-----SereachUserByRole");
		List<User> list = dao.SereachUserByRole(sereach_val);
		if(list.size()>=1) {
			return list;
		}else {
			return list;
		}
		
	}



	*/


}
