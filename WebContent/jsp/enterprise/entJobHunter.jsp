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
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		body{
			background-color: #F2F2F2;
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
			margin-top:60px;
		}
		.i-body{
			animation-duration: 1s !important;
		}
		.search{
			padding: 20px;
			/* margin-top: 100px; */
		}
		.search-left, .search-right{
			width: 100%;
			height: 50px;
		}
		.search-btn{
			width: 80px;
			height: 50px;			
		}
		.search-input{
			height: 50px;
			width: 600px
		}
		.btable{
			margin-top: 30px;
			margin-button: 50px;
		
		}
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header layui-bg-cyan">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisemanage.jsp" >企业</a>
		    	<li class="layui-nav-item"><a href="altEntInfor.do" >企业信息</a>
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
			<!-- <blockquote class="layui-elem-quote">应聘者</blockquote> -->
			<div class="alert alert-info">
			    <strong>应聘者</strong>
			</div>
			<hr class="layui-bg-green">
			<table id="jobhunterTable" lay-filter="jobhunterTable" class="layui-table" lay-data="{url:'findJobHunter.do',
																								page:true,
																								even:true,
																								limit:5,
																								limits:[5,10,20]}">
				<thead>
					<tr>
					<th lay-data="{field:'jbname',title:'姓名'}"></th>
					<th lay-data="{field:'jbsex',title:'性别'}"></th>
					<th lay-data="{field:'jbage',title:'年龄'}"></th>
					<th lay-data="{field:'jbid',title:'身份证号'}"></th>
					<th lay-data="{field:'jbjob',title:'应聘职位'}"></th>
					<th lay-data="{field:'interstatus',title:'应聘状态'}"></th>
					<th lay-data="{title:'操作',templet:function(cd){																
																return '<a class=\'layui-btn layui-btn-normal layui-btn-sm\' lay-event=\'check\'>查看详细信息</a>';
															}}"></th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div class="layui-container layui-anim-scale layui-anim i-body">
			<div class="alert alert-info top">
			    <strong>搜索应聘者</strong>
			</div>
			<div class="search">
				<div class="layui-row">
					<div class="layui-col-md2">
							<div class="search-left"> </div>
					</div>
					<div class="layui-col-md8">
						<div class="layui-form" action="">
							<table>
								<tr>
									<td><input type="text" name="jbablt" id="input" autocomplete="off" placeholder="请输入技能简介" class="layui-input search-input"></td>
									<td><button lay-submit type="submit" class="layui-btn layui-btn-normal search-btn" lay-filter="search">搜索</button></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="layui-col-md2">
						<div class="search-right"></div>
					</div>
				</div>
			</div> 
		</div>
		
		<div class="layui-container btable layui-anim-upbit layui-anim i-body">
			<table id="searchSolr" lay-filter="searchSolr" class="layui-table" lay-data="{url:'findAllJobHunter.do',
																						page:true,
																						even:true,
																						limit:5,
																						limits:[5,10,20]}">
				<thead>
					<tr>
				      <th lay-data="{field:'jbname'}">姓名</th>
				      <th lay-data="{field:'jbsex'}">性别</th>
				      <th lay-data="{field:'jbage'}">年龄</th>
				      <th lay-data="{field:'jbcompany'}">应聘企业</th>
				      <th lay-data="{field:'jbjob'}">应聘职位</th>
				      <th lay-data="{field:'jbablt', minWidth: 400}">能力简介</th>
					</tr>
				</thead>	
			</table>
			
		</div>
		
	</div>

<script type="text/javascript">
	layui.use(["table","element","layer","jquery","form"],function(){
		var table=layui.table;
		var $=layui.jquery;
		var layer=layui.layer;
		var form=layui.form;
		table.on('tool(jobhunterTable)', function(obj){
			var data = obj.data;
			//console.log(obj)
			if(obj.event === 'check'){
				$.ajax({
					url:"acquireId.do",
					data:{jbid:data.jbid,jbjob:data.jbjob,interstatus:data.interstatus},
					type:'POST',
					success:function(result){
						if(result == "success"){
							window.location.href="findInterviewStatus.do";
						}
					},
					error:function(){
						layer.msg("失败！");
					}
				});
			} 
		});
		form.on("submit(search)",function(data){
			var input=$("#input").val();
			layer.msg(input);
			table.reload('searchSolr', {
				  url: 'searchJobhunterSolr.do',
				  where: {
					  jbablt: input,
				  },
				  parseData:function(res){
					  return {
						  "code": 0,
						  "msg": "",
						  "count":res.length,
						  "data": res
					  }
				  }
			});
		}); 
	})
</script>

</body>
</html>