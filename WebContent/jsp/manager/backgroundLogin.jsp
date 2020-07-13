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
	<title>后台管理系统</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">后台管理系统</div>
				<ul class="layui-nav layui-layout-left" lay-filter="nav1">
				</ul>
		</div>
		<div class="layui-side layui-bg-cyan">
			<ul class="layui-nav layui-nav-tree" lay-filter="menu">
				<li class="layui-nav-item" ><a href="jsp/manager/businessMessage.jsp" data-url="jsp/manager/businessMessage.jsp" data-id="1">企业信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/inquireRecords.jsp">招聘记录查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/inquireRecords.jsp">行业类别管理</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jobhunterMessage.jsp">求职者信息查询</a></li>
				<li class="layui-nav-item" ><a href="jsp/manager/jbhunterAdd.jsp">添加求职者信息</a></li>
			</ul>
		</div>
		<div class="layui-body">
			<!-- <div class="layui-tab" lay-filter="desktop" lay-allowClose="true">
				<ul class="layui-tab-title">
				</ul>
				<div class="layui-tab-content">
				</div>
			</div> -->
		</div>
		<div class="layui-footer footer footer-doc">
		  <div class="layui-main">
		    <p>© 2020-码农招聘管理系统 <a href="/"></a></p>
		   </div>
		 </div>
	</div>
	
<script type="text/javascript">
	function pageFilter(page){
		var start=page.indexOf("<body>")+6;
		var end=page.indexOf("</body>");
		return page.substring(start,end);
	}
	layui.use(["element","jquery","layer"],function(){
		var element=layui.element;
		var $=layui.jquery;
		var layer=layui.layer;
		/* element.on("nav(menu)",function(item){
			var url=item.attr("data-url");
			var did=item.attr("data-id");
			
			$.post(url,{},function(data){
				element.tabAdd("desktop",{
					title:item.text(),
					content:pageFilter(data),
					id:did
				});
				element.tabChange("desktop",did);
			});
		});	 */	
	});
</script>
</body>
</html>