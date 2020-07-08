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
<table id="bsTable"></table>
</div>
<script type="text/javascript">
	layui.use("table",function(){
		var table=layui.table;
		table.render({
			elem:"#bsTable",
			url:"showBusiness.do",
			cols:[[
				{field:"bsname",title:"企业名称",width:125},
				{field:"bspname",title:"企业法人",width:75},
				{field:"bsid",title:"企业编号",width:150},
				{field:"bsclass",title:"企业类型",width:100},
				{field:"bsculture",title:"企业文化",width:125},
				{field:"bsintr",title:"企业简介",width:125},
				{field:"bsablt",title:"企业需求",width:125},
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