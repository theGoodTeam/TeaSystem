package com.test.domain;

import java.sql.Timestamp;

public class Contest {
	private int battle_id;
	private String contest_name;
	private String contest_site;
	private String contest_time;
	private String contest_des;
	private String contest_state;
	
	public String getContest_state() {
		return contest_state;
	}
	public void setContest_state(String contest_state) {
		this.contest_state = contest_state;
	}
	public int getBattle_id() {
		return battle_id;
	}
	public void setBattle_id(int battle_id) {
		this.battle_id = battle_id;
	}
	public String getContest_name() {
		return contest_name;
	}
	public void setContest_name(String contest_name) {
		this.contest_name = contest_name;
	}
	public String getContest_site() {
		return contest_site;
	}
	public void setContest_site(String contest_site) {
		this.contest_site = contest_site;
	}
	public String getContest_time() {
		return contest_time;
	}
	public void setContest_time(String contest_time) {
		this.contest_time = contest_time;
	}
	public String getContest_des() {
		return contest_des;
	}
	public void setContest_des(String contest_des) {
		this.contest_des = contest_des;
	}
	
	
	
	
	

}
