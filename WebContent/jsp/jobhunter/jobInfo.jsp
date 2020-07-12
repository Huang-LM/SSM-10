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
	<title>公司信息</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<!-- <script type="text/javascript" src="ui/jquery-1.11.1.min.js"></script> -->
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		body{
		}
		.nav{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 10000;
		    width: 100%;
		    height: 60px;
		}
		.top{
			margin-top: 100px;
		}
		.layui-footer{
			left: 0px !important;
			position: static !important; 
			bottom:0px !important;
			background-color: #F2F2F2;
			margin-top: 30px
		}
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginindex.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginList.jsp" >公司列表</a>
				<li class="layui-nav-item layui-this"><a href="jsp/jobhunter/jobLoginShow.jsp" >公司信息</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				
				<li class="layui-nav-item" lay-unselect="">
				    <a href="javascript:;">个人中心</a>
				    <dl class="layui-nav-child">
				      <dd><a href="jsp/jobhunter/jobInfo.jsp">查看进度</a></dd>
				      <dd><a href="index.jsp">注销</a></dd>
				    </dl>
				</li>
			</ul>
		</div>
		
		<div class="layui-container top">
			<form class="layui-form">
				<div class="layui-form-item item-1">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input type="text" name="jbname" class="layui-input" placeholder="请输入本人姓名">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-inline">
						<button lay-submit lay-filter="search" class="layui-btn">查看</button>
					</div>
				</div>
			</form>
			
			<div class="layui-progress">
				<div class="layui-progress-bar i-progress" lay-percent="10%"></div>
			</div>
			
		</div>
		

		<!-- foot -->
		<div class="layui-footer">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div>	
	</div>
	
<script type="text/javascript">
	layui.use(['table','element','layer','form','jquery'],function(){
		var table=layui.table;
		var element=layui.element; 
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		  
		form.on("submit(search)",function(data){
			layer.alert(data);
			$.ajax({
				url:"searchInfo.do",
				data:data.field,
				type:'POST',
				success:function(res){
					layer.msg("??")
				},
				error:function(){
					layer.msg("失败！");
				}
			});
			return false;
			
			
			/* $.post("searchInfo.do",data.field,function(txt){
				if(txt=="面试成功"){	
					layer.alert("恭喜您面试通过");
					$(".i-progress").attr("lay-percent","100%");
				}else if(txt=="面试失败"){
					layer.alert("很遗憾，您面试未通过");
					$(".i-progress").attr("lay-percent","100%");
				}else if(txt=="已预约面试"){
					layer.alert("已预约面试");
					$(".i-progress").attr("lay-percent","50%");
				}else if(txt==null){
					layer.alert("公司还未审核，请耐心等待");
					$(".i-progress").attr("lay-percent","10%");
				}
			});
			return false; */
		});
		
		
		//监听导航点击
		element.on('nav(demo)', function(elem){
			layer.msg(elem.text());
		});
	});
</script>	

</body>
</html>