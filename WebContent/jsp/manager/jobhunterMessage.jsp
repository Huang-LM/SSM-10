<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业信息</title>
<link href="ui/css/layui.css" rel="stylesheet"/>
<script type="text/javascript" src="ui/layui.js"></script>
</head>
<body>
<div class="layui-container">
<table id="jbTable"></table>
</div>
<script type="text/javascript">
	layui.use("table",function(){
		var table=layui.table;
		table.render({
			elem:"#jbTable",
			url:"showJobhunter.do",
			cols:[[
				{field:"jbname",title:"姓名",width:125},
				{field:"jbsex",title:"性别",width:75},
				{field:"jbage",title:"年龄",width:150},
				{field:"jbphoto",title:"简历照片",width:100},
				{field:"jbid",title:"身份证号码",width:125},
				{field:"jbusername",title:"用户名",width:125},
				{field:"jbpnmb",title:"手机号码",width:125},
				{field:"jbcompany",title:"企业名称",width:125},
				{field:"jbjob",title:"应聘岗位",width:125},
				{field:"jbablt",title:"能力简介",width:125},
				{title:"删除",width:75,templet:function(cd){
					                        return "<button class=\"layui-btn layui-btn-sm\">删除</button>"
				}},
				{title:"修改",width:75,templet:function(cd){
                                            return "<button class=\"layui-btn layui-btn-sm\">修改</button>"
                }},
			]],
			 page:true,
		      limit:5,
		      limits:[5,10,20]
		});
	});
	
</script>
	<script type="text/javascript">
	layui.use("table",function(){
	});

</script>
</body>
</html>