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
	<title>求职者信息</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
</head>

<body>
	<div>
		<table id="jbTable" lay-filter="jbTable" class="layui-table" lay-data="{url:'showjb.do',
																					page:true,
																					even:true,
																					limit:5,
																					limits:[5,10,20]}">
			<thead>
				<tr>
				<th lay-data="{field:'jbname',title:'姓名'}"></th>
				<th lay-data="{field:'jbsex',title:'性别'}"></th>
				<th lay-data="{field:'jbage',title:'年龄'}"></th>
				<th lay-data="{field:'jbphoto',title:'照片'}"></th>
				<th lay-data="{field:'jbid',title:'编号'}"></th>
				<th lay-data="{field:'jbusername',title:'用户名'}"></th>
				<th lay-data="{field:'jbpnmb',title:'联系方式'}"></th>
				<th lay-data="{field:'jbcompany',title:'应聘公司'}"></th>
				<th lay-data="{field:'jbjob',title:'应聘职位'}"></th>
				<th lay-data="{field:'jbablt',title:'个人能力'}"></th>
				<th lay-data="{field:'interstatus',title:'应聘状态'}"></th>
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
	layui.use(["table","layer","jquery"],function(){
		/* var table=layui.table;
		var $=layui.jquery;
		var layer=layui.layer; */
		//监听行工具事件
		table.on('tool(jbTable)', function(obj){
			var data = obj.data;
			if(obj.event === 'del'){
				$.ajax({
					url:"deljbhunter.do",
					data:{jbid:data.jbid},
					type:'POST',
					success:function(result){
						if(result == "success"){
							element.tabDelete("desktop", "3");
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