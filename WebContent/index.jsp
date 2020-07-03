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
	<title>主页</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		body{
			background-color: #F2F2F2;
			height: 1500px;
		}
		.nav{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 10000;
		    width: 100%;
		    height: 60px;
		}
		.hot-nav{
			margin-top: 70px;
			height: 80px;
		}
		.hot-nav-list{
			padding: 20px; 
			font-size: 30px;
		}
		.search{
			padding: 20px;
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
		.card-promo{
			margin-top: 50px;
			padding: 15px; 
			background-color: #ffffff;
		}
		.carousel{
			top: 20px;
		}
		.office-tab{
			height: 580px;
			padding: 20px;
			margin-top: 80px;
			margin-bottom: 80px;
			background-color: #ffffff;
			
		}

		.office-card{
			height: 200px;
			padding: 15px;
			margin-top: 20px;
			background-color: #f9f9f9;
			transition: all 250ms cubic-bezier(.02, .01, .47, 1);
		    word-break: break-all;
		}
		
		.office-card:hover{
			box-shadow: 0px 1px 2px 0px rgba(48, 55, 66, 0.15);
	        transform: translate(0,-5px);
	        transition-delay: 0s !important;
		}
		.change-card {
		    animation-duration: 1s !important;
		}
		
		
		.layui-footer{
			left: 0px !important;
			position: static !important;
			bottom:0px !important;
			background-color: #ffffff !important;
		}
		
	</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="">
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobList.jsp" >公司列表</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item"><a href="javascript:void(0);">登录</a>
				<li class="layui-nav-item"><a href="javascript:void(0);">注册</a>
			</ul>
		</div>
		<!-- body -->
		<div class="layui-container">
			<!-- 热门导航 -->
			<div style="padding: 30px">
				<fieldset class="layui-elem-field hot-nav" >
				  <legend>热门职业</legend>
						<span class="layui-breadcrumb hot-nav-list" lay-separator="|" >
							  <a href="">Java</a>
							  <a href="">PHP</a>
							  <a href="">C++</a>
							  <a href="">Python</a>
							  <a href="">HTML</a>
							  <a href="">JavaScript</a>
							  <a href="">Android</a>
						</span>
				</fieldset>
			</div>
		
			<!-- 搜索栏 -->
			<div class="search">
				<div class="layui-row">
					<div class="layui-col-md2">
							<div class="search-left"> </div>
					</div>
					<div class="layui-col-md8">
						<div class="layui-form" action="">
							<table>
								<tr>
									<td><input type="text" name="search" autocomplete="off" placeholder="请输入职业名称" class="layui-input search-input"></td>
									<td><button lay-submit type="submit" class="layui-btn layui-btn-normal search-btn"	lay-filter="search">搜索</button></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="layui-col-md2">
						<div class="search-right"></div>
					</div>
					
					
				</div>
			</div>
			
			<!-- 卡片页 -->
			<div class="card-promo">
			  <div class="layui-row layui-col-space5">
			    <div class="layui-col-md3">
			      <div class="layui-card">
			        <div class="layui-card-header">
						<div class="showTime"></div>
					</div>
			     	<div class="site-demo-laydate ">
						<div class="layui-inline data-size" id="time-1"></div>
					</div>
			      </div>
			    </div>
			    <div class="layui-col-md9">
			      <div class="layui-card">
			        <div class="layui-carousel carousel" id="carousel">
					  <div carousel-item>
					    <div><img alt="" src="img/index-img-1.JPG"></div>
					    <div><img alt="" src="img/index-img-2.JPG"></div>
					    <div><img alt="" src="img/index-img-3.JPG"></div>
					  </div>
					</div>
			      </div>
			    </div>
			    
			  </div>
			</div> 
			
			<!-- office-tab -->
			<div>
				<div class="layui-tab layui-tab-brief office-tab" lay-filter="docDemoTabBrief">
				  	<ul class="layui-tab-title">
				    	<li class="layui-this">24Hour热门</li>
				    	<li>最新职位</li>
				  	</ul>
				 	<div class="layui-tab-content">
					    <div class="layui-tab-item layui-show office-tab-1 layui-anim layui-anim-fadein change-card">
					    
					    	<div class="layui-row layui-col-space15">
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
					    				<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
							</div><!-- 第一行 -->
							
							<div class="layui-row layui-col-space15">
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
							</div><!-- 第二行 -->
						</div><!-- office-tab-1 -->
						
					    <div class="layui-tab-item office-tab-2 layui-anim layui-anim-fadein change-card">
					    	<div class="layui-row layui-col-space15 ">
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card">
							    		<a href="" data-url="" >
											<div class="layui-card-header">
							    			<h1>呜呜呜公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a> 
						    		</div>
					    		</div>
							</div><!-- 第一行 -->
							
							<div class="layui-row layui-col-space15">
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
					    				<a href="" data-url="" >
								    		<div class="layui-card-header">
								    			<h1>跳跳糖公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a>	
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
					    				<a href="" data-url="" >
								    		<div class="layui-card-header">
								    			<h1>跳跳糖公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a>	
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
					    				<a href="" data-url="" >
								    		<div class="layui-card-header">
								    			<h1>跳跳糖公司</h1>
								    		</div>
									    	<div class="layui-card-body ">
											    <h3>所属行业类别：</h3>
							                    <p>清清浅浅</p>
							                    <p>清清浅浅</p>
							                    <p></p> 
							                    <p></p>
											</div>
										</a>	
						    		</div>
					    		</div>
							</div><!-- 第二行 -->
					    </div><!-- office-tab-2 -->
					</div>
				</div>   
			
			</div>
			
			<!-- 无 -->
			<div class="">
			
			</div>
			
		</div><!-- body -->
		
			
		
		<!-- foot -->
		<div class="layui-footer">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div>
	 </div> 
	
	
</body>

<script>
		var t = null;
	    t = setTimeout(time, 1000);
	    function time() {
	        clearTimeout(t);
	        dt = new Date();
	        var y = dt.getFullYear();
	        var mt = dt.getMonth() + 1;
	        var day = dt.getDate();
	        var h = dt.getHours();
	        var m = dt.getMinutes();
	        var s = dt.getSeconds();
	        document.querySelector(".showTime").innerHTML = ' 当前时间:' + y + "年" + mt + "月" + day + "日"+ "-" + h + "时" + m + "分" + s + "秒";
	        t = setTimeout(time, 1000);     
	    }
	    
		layui.use(['element','form','laydate','carousel','jquery','table','layer'], function(){
			var element = layui.element;
		  	var laydate = layui.laydate;
		  	var carousel = layui.carousel;
		  	var $=layui.jquery;
		  	var form=layui.form;
		  	var layer = layui.layer;
		  	
			laydate.render({
				elem: '#time-1'
				,position: 'static'
			});
			
			carousel.render({
				elem: '#carousel'
				,height: '355px'
				,width: '100%' //设置容器宽度
				,arrow: 'always' //始终显示箭头
				//,anim: 'updown' //切换动画方式
			});
			
			form.on("submit(search)",function(data){	
				alert("查找成功");
				console.log(data.field);
				$.post(".do",{},function(txt){
					if(txt=="ok"){
						alert("查找成功");
						form.render();
					} 
					else {
						alert("查找失败");
					}
				}); 
			});
			
			layer.open({
				
			});
		});
		
	
	
	</script>


</html>