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
	<title>简历提交</title>
	
	<meta http-equiv="Content-Type"  content="multipart/form-data; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script type="text/javascript" src="ui/layui.js"></script>
	<script type="text/javascript" src="ui/jquery-1.11.1.min.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
		body{
			background-color: #F2F2F2;
		}
		.nav{
			position: fixed;
		    left: 0;
		    top: 0;
		    z-index: 1000;
		    width: 100%;
		    height: 60px;
		}
		.container{
			margin-top: 100px;
		
		}
		.sform{
			padding-right: 30px
		}
		.sub-btn{
			margin-left: 100px;
		}
		.item-2{
			margin-top: 700px;
			left: 100px
		}
		.vid,.can ,#imgTag{
			position:absolute;
			left:350px;
			top:-530px;
			float: left;
			border: black 3px solid;
		}
		.vid{
			z-index:1;
		}
		.can{
			z-index:2;
		}
		#imgTag{
			z-index:-1;
			
		}
		.btn-1{
			margin-left: 320px
		}
		.btn-2{
			left: 400px;
		}
		.btn-3{
			margin-left: 350px
		}		
		
		.layui-footer{
			left: 0px !important;
			position: static !important;
			margin-top: 80px;
			bottom:0px !important;
			background-color: #ffffff !important;
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
		
		
		
		<div class="layui-container container">
			<form class="layui-form sform" method="POST" enctype="multipart/form-data" lay-filter="example">
			
				<div class="layui-form-item">
					<video id="video" width="500px" height="500px" autoplay="autoplay" class="vid"></video>
					<canvas id="canvas" width="500px" height="500px" class="can"></canvas>
					<img id="imgTag" src="img/sub-bg.png" alt="imgTag" width="500px" height="500px">
					<input type="hidden" name="img" class="showimg"/>
				</div>
				
				<div class="layui-form-item item-2">
						<button class="layui-btn btn-1" id="" type="button" onclick="openMedia()">打开摄像头</button>
						<button class="layui-btn btn-2" id="" type="button" onclick="takePhoto()">拍照</button>
						<button class="layui-btn btn-3" id="" type="button" onclick="closeMedia()">关闭摄像头</button>
				</div>
				
			</form>
		</div>
		

		<!-- foot -->
		<div class="layui-footer">
			 <div class="layui-main">
			   <p>© 2020 <a href="/"></a></p>
			  </div>
		</div>	
	</div>
	
<script type="text/javascript">
let mediaStreamTrack=null; // 视频对象(全局)
let video ;
function openMedia() {
    let constraints = {
        video: { width: 500, height: 500 },
        audio: false
    };
    //获得video摄像头
     video = document.getElementById('video');     
    let promise = navigator.mediaDevices.getUserMedia(constraints);
    promise.then((mediaStream) => {
       // mediaStreamTrack = typeof mediaStream.stop === 'function' ? mediaStream : mediaStream.getTracks()[1];
       mediaStreamTrack=mediaStream.getVideoTracks()
        video.srcObject = mediaStream;
        video.play();
    });
}

// 关闭摄像头
function closeMedia() {
      let stream = document.getElementById('video').srcObject;
      let tracks = stream.getTracks();

      tracks.forEach(function(track) {
        track.stop();
      });

     document.getElementById('video').srcObject = null;
}
// 拍照
function takePhoto() {
    //获得Canvas对象
    let video = document.getElementById('video');
    let canvas = document.getElementById('canvas');
    let ctx = canvas.getContext('2d');
    ctx.drawImage(video, 0, 0, 500, 500);

    // toDataURL  ---  可传入'image/png'---默认, 'image/jpeg'
    let img = document.getElementById('canvas').toDataURL("image/png");
    
    // 这里的img就是得到的图片
    console.log('img-----', img);
    document.getElementById('imgTag').src=img;
    
	//上传
	$.ajax({
		url:"getPicture.do"
		,type:"POST"
		,data:{"imgData":img}
		,success:function(data){
			if(data=="success"){
				alret("登录成功");
			}
		}
		,error:function(){
			console.log("服务端异常！");
		}
	});


}



layui.use(["form","jquery","element","upload","layer"],function(){
	var form=layui.form;
	var $=layui.jquery;
	var element=layui.element;
	var upload=layui.upload;
	var layer=layui.layer;
	
	
	
});
</script>	

</body>
</html>