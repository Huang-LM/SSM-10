<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>企业信息</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.top{
			margin-top:50px;
		}
	</style>
</head>

<body>
	<div>
		<table id="bsTable" lay-filter="bsTable" class="layui-table" lay-data="{url:'showBusiness.do',
																					page:true,
																					even:true,
																					limit:5,
																					limits:[5,10,20]}">
			<thead>
				<tr>
				<th lay-data="{field:'bsname',title:'企业名称'}"></th>
				<th lay-data="{field:'bspname',title:'企业法人'}"></th>
				<th lay-data="{field:'bsid',title:'企业ID'}"></th>
				<th lay-data="{field:'bsclass',title:'企业类别'}"></th>
				<th lay-data="{field:'bsculture',title:'企业文化'}"></th>
				<th lay-data="{field:'bsintr',title:'企业简介'}"></th>
				<th lay-data="{field:'bsablt',title:'招聘职位'}"></th>
				<th lay-data="{title:'删除',templet:function(cd){																
															return '<a class=\'layui-btn layui-btn-danger layui-btn-sm\' lay-event=\'del\'>删除</a>';
														}}"></th>
				<th lay-data="{title:'修改',templet:function(cd){																
															return '<a class=\'layui-btn  layui-btn-sm\' lay-event=\'edit\'>修改</a>';
														}}"></th>
				</tr>
			</thead>
		</table>
	</div>
		

<script type="text/javascript">
	layui.use(["table","element","layer","jquery"],function(){
		var table=layui.table;
		var $=layui.jquery;
		var layer=layui.layer;
		//监听行工具事件
		table.on('tool(bsTable)', function(obj){
			var data = obj.data;
			//console.log(obj)
			if(obj.event === 'del'){
				$.ajax({
					url:"delBusiness.do",
					data:{bsid:data.bsid},
					type:'POST',
					success:function(result){
						if(result == "success"){
							window.location.href="jsp/manager/businessMessage.jsp";//jsp/enterprise/
						}
						else if(result == "fail") {
							layer.msg("删除！");
						}
					},
					error:function(){
						layer.msg("失败！");
					}
				});
			}
			else if(obj.event === 'edit'){
				$.ajax({
					url:"updateBusiness.do",
					data:{bsid:data.bsid},
					type:'POST',
					success:function(result){
						if(result == "success"){
							window.location.href="businessMessage.jsp";//jsp/enterprise/
						}
						else if(result == "fail") {
							layer.msg("删除！");
						}
					},
					error:function(){
						layer.msg("失败！");
					}
				});
			}
		});
	});
</script>

</body>
</html>