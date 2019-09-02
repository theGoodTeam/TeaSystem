package com.test.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.domain.Battle;
import com.test.domain.Contest;
import com.test.domain.Player;
import com.test.domain.User;
import com.test.domain.Votedes;

public interface UserDao {
	/*用户登录验证*/
	public List<User> findUser(User user);
	/*添加用户*/
	public int addUser(User user);
	
	public List<User> findAllUser() ;
	/*根据用户id查询用户信息 返回user*/
	public User selectUserById(int userid) ;
	
	public User  findUserByUsername(User user) ;
	
	public int UpdatePaaword(User user);
	
	public int DeleteUserById(int userid) ;
	
	public int UpdatePasswordUserByIds(int[] chek_value);
	
	public int ChooseUserToDeleteByIds(int[] chek_value);
	
	public List<User> SereachUserByRole(String sereach_val) ;
	/*根据用户id删除用户*/
	public int DeleteUserById(String user_id);
	/*根据用户user 修改用户信息*/
	public int updateUserById(User user);
	/*根据关键字查询用户信息，显示用户列表*/
	public List<User> selectUserByKey(String key);
	/*查询所有选手信息*/
	public List<Player> selectPlayerAll();
	
	public int addBattlePair(Battle battle);
	
	public int addPlayer(Player player);
	
	public List<User> findPlayer(User user);
	
	public List<Player> findAllPlayer();
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
