//alert("nav.js");
var navs = [{
	"title" : "后台首页",
	"icon" : "icon-computer",
	"href" : "page/main.html",
	"spread" : false
},{
	"title" : "用户列表",
	"icon" : "icon-text",
	"href" : "userList",
	"spread" : false
},{
	"title" : "活动管理",
	"icon" : "&#xe61c;",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "选手列表",
			"icon" : "icon-text",
			"href" : "playerlist",
			"spread" : false
		},
		{
			"title" : "选手配对",
			"icon" : "icon-text",
			"href" : "playerContest",
			"spread" : false
		},
		{
			"title" : "比赛场次",
			"icon" : "icon-text",
			"href" : "contest",
			"spread" : false
		}
	]
},{
	"title" : "404页面",
	"icon" : "&#xe61c;",
	"href" : "404",
	"spread" : false
}]