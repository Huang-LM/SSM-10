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
	<script type="text/javascript" src="ui/jquery-1.11.1.min.js"></script>
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
		.i-body{
			animation-duration: 1s !important;
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
		    line-height: 130%;
		}
		
		.office-card:hover{
			box-shadow: 0px 1px 2px 0px rgba(48, 55, 66, 0.15);
	        transform: translate(0,-5px);
	        transition-delay: 0s !important;
		}
		.change-card {
		    animation-duration: 1s !important;
		}
		
		.psname{
			margin-left: -8px;
			font-size: 23px;
		}
		.psbadge{
			float: left;
			font-size: 15px;
		}
		.psposition{
			margin-top:15px;
			float: left;
			font-size: 17px;
		}
		.pspay{
			color: #FF6666 ;
			font-size: 17px;
			float: left;
			margin-top:15px;
			margin-left: 20px
			
		}
		
		.layui-footer{
			left: 0px !important;
			position: static !important;
			bottom:0px !important;
			background-color: #ffffff !important;
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
	<div class="layui-layout layui-layout-admin ">
		<!-- 顶部导航栏 -->
		<div class="layui-header layui-bg-cyan nav">
			<ul class="layui-nav" lay-filter="menu">
				<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >首页</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobLoginList.jsp" >公司列表</a>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisesignup.jsp">企业版</a>
				<li class="layui-nav-item"><a href="index.jsp" >注销</a>
				<!-- <li class="layui-nav-item"><a href="jsp/jobhunter/jobLogin.jsp">登录</a>
				<li class="layui-nav-item"><a href="jsp/jobhunter/jobEnrol.jsp">注册</a> -->
			</ul>
		</div>
		<!-- body -->
		<div class="layui-container layui-anim-upbit layui-anim i-body">
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
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海亦净网络科技有限公司" >
								    				<div class="psname">上海亦净网络科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">移动互联网</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">安卓开发工程师</p>
							                    <p class="pspay">20K-30K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">前端开发工程师</p>
							                    <p class="pspay">30K-50K</p>
											</div>
						    		</div>
					    		</div>
					    		
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海众意信息科技有限公司" >
								    				<div class="psname">上海众意信息科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">移动互联网</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">net软件开发工程师</p>
							                    <p class="pspay">15K-20K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">前端测试软件工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=快手" >
								    				<div class="psname">快手</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">移动互联网</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">web前端开发-AcFun</p>
							                    <p class="pspay">15K-20K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">前端数据开发工程师</p>
							                    <p class="pspay">15K-20K</p>
											</div>
						    		</div>
					    		</div>
							</div><!-- 第一行 -->
							
							<div class="layui-row layui-col-space15">
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海中科软科技有限公司" >
								    				<div class="psname">上海中科软科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">互联网金融</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">互联网java开发工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">React前端开发工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=亚创卓信（北京）科技有限公司" >
								    				<div class="psname">亚创卓信科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">企业服务</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">互联网Java开发</p>
							                    <p class="pspay">10K-15K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">FPGA工程师</p>
							                    <p class="pspay">15K-20K</p>
											</div>
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=陕西猿起信息科技有限公司" >
								    				<div class="psname">陕西猿起信息科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">教育培训</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">新媒体运营实习生</p>
							                    <p class="pspay">3K-5K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">高中数学辅导老师</p>
							                    <p class="pspay">8K-10K</p>
											</div>
						    		</div>
					    		</div>
							</div><!-- 第二行 -->
						</div><!-- office-tab-1 -->
						
					    <div class="layui-tab-item office-tab-2 layui-anim layui-anim-fadein change-card">
					    	<div class="layui-row layui-col-space15 ">
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海钢联物流股份有限公司" >
								    				<div class="psname">上海钢联物流股份有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">物流运输</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">风电运维工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">JAVA工程师</p>
							                    <p class="pspay">8K-10K</p>
											</div>
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海众调信息科技有限公司" >
								    				<div class="psname">上海众调信息科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">数据服务</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">Java大数据工程师</p>
							                    <p class="pspay">15K-20K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">产品经理</p>
							                    <p class="pspay">10K-15K</p>
											</div>
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海什码网络科技有限公司" >
								    				<div class="psname">上海什码网络科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">软件开发</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">测试工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">Web前端中级开发工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
						    		</div>
					    		</div>
							</div><!-- 第一行 -->
							
							<div class="layui-row layui-col-space15">
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海数慧系统技术有限公司" >
								    				<div class="psname">上海数慧系统技术有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">软件开发</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">GIS开发工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">webgis开发工程师</p>
							                    <p class="pspay">15K-20K</p>
											</div>
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=浙江掌尊信息科技有限公司" >
								    				<div class="psname">浙江掌尊信息科技有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">软件开发</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">Ruby中级开发工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">UI设计师</p>
							                    <p class="pspay">8K-10K</p>
											</div>
						    		</div>
					    		</div>
					    		<div class="layui-col-md4">
					    			<div class="layui-card office-card ">
											<div class="layui-card-header">
												<a href="jobLoginShow.do?bsname=上海软中信息技术有限公司" >
								    				<div class="psname">上海软中信息技术有限公司</div>
								    			</a> 
								    		</div>
								    		<hr class="layui-bg-gray">
									    	<div class="layui-card-body ">
									    		<span class="layui-badge layui-bg-gray psbadge">软件开发</span>
											</div>
											<div class="layui-card-body">
												<p class="psposition">java中级开发工程师</p>
							                    <p class="pspay">10K-15K</p>
											</div>
											<div class="layui-card-body">
												<p class="psposition">测试工程师</p>
							                    <p class="pspay">8K-10K</p>
											</div>
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
		
		<!--返回顶部小组件-->
	    <div class="quick_bar" id="quick_bar">
	        <a id="to_top" class="to_top" title="返回顶部"  href="javascript:void(0)">
	        	<div class="bar-bg">
	        	 	<div class="layui-icon layui-icon-return bar-icon"></div>
	        	</div>
	        </a>
	    </div>
		
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
				console.log(data.field);
				$.post("findSearch.do",data.field,function(txt){
					if(txt=="ok"){
						alert("查找成功");
						
					} 
					else {
						alert("查找失败");
					}
				}); 
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
	
	
	</script>


</html>