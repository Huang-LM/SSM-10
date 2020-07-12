<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>        
<!DOCTYPE html>
<html>
<head>
<head>
	<base href="<%=basePath %>" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>公司列表</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<script type="text/javascript" src="ui/jquery-1.11.1.min.js"></script>
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
		.i-body{
			animation-duration: 1s !important;
		}
		.search{
			padding: 20px;
			margin-top: 100px;
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
		
		.layui-footer{
			left: 0px !important;
			position: static !important;
			bottom:0px !important;
			margin-top: 50px
		}
				.quick_bar {
			position: fixed;
			left: 95%; 
			top:80%;
			
		}
		.bar-bg{
			height: 40px;
		    width: 40px;
		    border-radius: 50%;
		  	background-color: #ffffff;
		}
		.bar-icon{
			margin-left: 12px;
			padding-top: 10px;
		}
		.to_top{ 
			display: none;
			height: 50px;
		    width: 50px;
		    border-radius: 50%;
		  	background-color: #2F4056;
		}
		.to_top:hover{ 
			opacity:0.5
		}
		.to_reply {
			display: block
		}
		.to_reply:hover{
		 	opacity: 0.5
		}
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item layui-this"><a href="jsp/jobhunter/jobList.jsp" >公司列表</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLogin.jsp">登录</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobEnrol.jsp">注册</a>
			</ul>
		</div>
		
		<!-- 搜索栏 -->
		<div class="layui-container layui-anim-scale layui-anim i-body">
			<div class="search">
				<div class="layui-row">
					<div class="layui-col-md2">
							<div class="search-left"> </div>
					</div>
					<div class="layui-col-md8">
						<div class="layui-form" action="">
							<table>
								<tr>
									<td><input type="text" name="bsposition" autocomplete="off" placeholder="请输入职业名称" class="layui-input search-input"></td>
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
			
				<table 
					lay-data="{ id:'newTable', url:'showBsjson.do', even: true, limit: 15, height: 700, cellMinWidth: 30, page: true, limits: [10,15,20,150], toolbar: '#toolbar'}" 
					class="layui-table" 
					lay-filter="demo" >
				<thead>
					<tr>
				      <th lay-data="{field:'bsname', minWidth: 300}">企业名称</th>
				      <th lay-data="{field:'bsclass' , minWidth: 100}">行业类别</th>
				      <th lay-data="{field:'bsposition', minWidth: 280}">职位</th>
				      <th lay-data="{field:'bspay', minWidth: 100, sort: true}">薪资</th>
				      <th lay-data="{fixed: 'right', align:'center', toolbar: '#barDemo', minWidth: 100}"></th>
					</tr>
				</thead>	
			</table>
			
		</div>
		
		<!-- 头部工具栏 -->
		 <script type="text/html" id="toolbar">
			<a class="layui-btn layui-btn-sm" lay-event="refresh">刷新</a>
		</script>
		
		<!-- 行工具栏 -->
		<script type="text/html" id="barDemo">
       		<a layui-submit class="layui-btn layui-btn-xs" lay-event="view">查看</a>
		</script>

		<!-- foot -->
		<div class="layui-footer layui-anim-upbit layui-anim i-body">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div>	
		
		<!--返回顶部小组件-->
	    <div class="quick_bar" id="quick_bar">
	        <a id="to_top" class="to_top" title="返回顶部"  href="javascript:void(0)">
	        	<div class="bar-bg">
	        	 	<div class="layui-icon layui-icon-return bar-icon"></div>
	        	</div>
	        </a>
	    </div>
	</div>
	
	
<script type="text/javascript">
	layui.use(['form','jquery','table','layer'],function(){
		var table=layui.table;
		var form=layui.form;
		var $=layui.jquery;
		var layer=layui.layer;
				
		//行事件
		table.on('tool(demo)', function(obj){
			var data = obj.data;

		    switch(obj.event){
			    case 'view':
			    	var bsname=data.bsname;
			    	window.location.href='jobShow.do?bsname='+bsname;	
			    	break; 
		    };
		  });
		//头部事件
		table.on('toolbar(demo)', function(obj){
			var data = obj.data;
		    switch(obj.event){
			    case 'refresh':
					table.reload('newTable', {
						  url: 'showBsjson.do',
						});
					break;
		    	};
		  });
		//搜索事件
		form.on("submit(search)",function(data){
			var input=$("input").val();
			layer.msg(input);
			table.reload('newTable', {
				  url: 'findSearchSolr.do',
				  where: {
					  bsposition: input,
				  },
				  parseData:function(res){
					  return {
						  "code": 0,
						  "msg": "",
						  "count": 50,
						  "data": res
					  }
				  }
			});
		});  
		
		$(document).scroll(function(){
            var top=$(document).scrollTop();
            if(top<300){
                $('#to_top').hide();
            }
            else{
                $('#to_top').show();
            }
       	})
	    
		$('#to_top').click(function(){
            $('body,html').animate({scrollTop:0},300);
        })
		
		/* active = {
			    reload: function(){
			      var input = $('.search-input').val();
			      
			      //执行重载
			      table.reload('newtable', {
			        page: {
			          curr: 1 //重新从第 1 页开始
			        }
			        ,where: {
			          key: {
			            bspostion: input
			          }
			        }
			      }, 'data');
			    }
			  };
			  
			  $('.search .search-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			  }); */
			
		
		/* table.on('tool(demo)', function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			var bsposition = $('input[bsposition="bsposition"]').val();
			var layer=layui.layer;
			
			
			switch(obj.event){
				case 'add':
			      layer.msg('添加');
			    break;
			
				case 'search':
					layer.msg("aaa");
					table.reload('newTable', {
						  url: 'findSearch.do'
						  ,where: {
							  bsposition: bsposition,
						  } 
						});
				break;	
			};
		}); */
		
		/* function getVaule(){
			var input= document.getElementById("pos");
			var value=input.value();
			alert(value);
			
		} */
		

	});
</script>	
</body>
</html>