package com.test.service;

import java.util.List;

import com.test.domain.Contest;
import com.test.domain.Battle;
import com.test.domain.Player;
import com.test.domain.User;
import com.test.domain.Votedes;

public interface UserService {
	
	
	
	public boolean login(User user) ;

	public List<User> SelectAll_User();

	public boolean Register(User user);

	public User SelectUserById(int userid);

	public User SelectUserByUsername(User user);

	public boolean UpdateUser(User user);

	public boolean UpdatePassword(User user);

	public boolean DeleteUserById(int userid);

	public boolean UpdatePasswordUserByIds(int[] chek_value);

	public int AddUser(User user);

	public boolean ChooseUserToDelete(int[] chek_value);

	public List<User> SereachUserByRole(String sereach_val);

	public int deleteUserById(String user_id);

	public User selectUserById(int user_id);

	public int updateUserById(User user);

	public List<User> selectUserByKey(String key);

	public List<Player> selectPlayerAll();

	public int addBattlePair(Battle battle);

	public int addPlayer(Player player);

	public List<User> selectPlayerByPlayer(User user);

	public List<Player> SelectAll_Player();

	public Player selectPlayerById(int player_id);

	public int updatePlayerById(Player player);

	public int deletePlayerById(int player_id);

	public List<Player> selectPlayerByKey(String key);

	public List<Battle> selectBattleAll();

	public List<Player> selectPlayerTiteByName(String player_name);

	public int addBattle(Battle battle);

	public Battle selectBattleById(int contest_id);

	public int updateBattle(Battle battle);

	public List<Battle> SelectAll_Battle();

	public int updatePlayer1_ticket(Battle battle);

	public int updatePlayer2_ticket(Battle battle);

	public List<Player> selectPlayer1ByName(String parameter);

	public List<Player> selectPlayer2ByName(String parameter);

	public int deleteBattleById(String contest_id);

	public List<Contest> SelectAll_Contest();

	public int addContest(Contest contest);

	public Contest selectContestById(int contest_id);

	public int updateContestSubmit(Contest contest);

	public int deleteContestById(String battle_id);

	public List<Contest> selectContestByKey(String key);

	public int updateContestStateById(String battle_id);

	public int addVoteIntoDB(Votedes vote);

	public List<Votedes> selectAllVote();





	



	



	



	

	

}
