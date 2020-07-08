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
	<title>查看应聘者</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		.top{
			margin-top:50px;
		}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisemanage.jsp" >企业</a>
		    	<li class="layui-nav-item"><a href="jsp/enterprise/alterEnterpriseInfor.jsp" >企业信息</a>
		    	<li class="layui-nav-item">
					<a href="javascript:void(0);">招聘信息</a>
					<dl class="layui-nav-child">
					<dd><a href="jsp/enterprise/jobPosting.jsp">发布招聘信息</a></dd>
					<hr>
					<dd><a href="jsp/enterprise/manaRecrInfor.jsp">管理招聘信息</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >应聘者</a>
		    </ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item layui-this">
					<a href="javascript:void(0);" ></a>
				</li>
				<li class="layui-nav-item">
					<a href="jsp/enterprise/enterprisesignin.jsp">注销</a>
				</li>
		    </ul>
		</div>
		
		<div class="layui-container top">
			<blockquote class="layui-elem-quote">应聘者</blockquote>
			<hr class="layui-bg-green">
			<table id="jobhunterTable" lay-filter="jobhunterTable" class="layui-table" lay-data="{url:'findJobHunter.do',
																					parseData:function(res){
																						return {
																							code:0,
																							msg:'应聘者',
																							count:res.length,
																							data:res
																						};
																					}}">
				<thead>
					<tr>
					<th lay-data="{field:'jbname',title:'姓名'}"></th>
					<th lay-data="{field:'jbsex',title:'性别'}"></th>
					<th lay-data="{field:'jbage',title:'年龄'}"></th>
					<th lay-data="{field:'jbid',title:'身份证号'}"></th>
					<th lay-data="{field:'jbjob',title:'应聘职位'}"></th>
					<th lay-data="{title:'操作',templet:function(cd){																
																return '<a class=\'layui-btn layui-btn-normal layui-btn-sm\' lay-event=\'check\'>查看详细信息</a>';
															}}"></th>
					</tr>
				</thead>
			</table>
		
		</div>
		
		
		
	</div>

<script type="text/javascript">
	layui.use(["table","element","layer","jquery"],function(){
		var table=layui.table;
		var $=layui.jquery;
		var layer=layui.layer;
		table.on('tool(jobhunterTable)', function(obj){
			var data = obj.data;
			//console.log(obj)
			if(obj.event === 'check'){
				$.ajax({
					url:"findJobHunter.do",
					data:{bsposition:data.bsposition},
					type:'POST',
					success:function(result){
						if(result == "success"){
							window.location.href="jsp/enterprise/manaRecrInfor.jsp";//jsp/enterprise/
						}
						else if(result == "fail") {
							layer.msg("删除失败！");
						}
					},
					error:function(){
						layer.msg("失败！");
					}
				});
			} 
		});
	})
</script>

</body>
</html>