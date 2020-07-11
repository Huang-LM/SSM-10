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
	<title>修改企业信息</title>
	<script type="text/javascript" src="ui/layui.js"></script>
	<link href="ui/css/layui.css" rel="stylesheet"/>
	<style type="text/css">
	</style>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">招聘系统</div>
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp" >首页</a>
				<li class="layui-nav-item"><a href="jsp/enterprise/enterprisemanage.jsp" >企业</a>
		    	<li class="layui-nav-item layui-this"><a href="javascript:void(0);" >企业信息</a>
		    	<li class="layui-nav-item">
					<a href="javascript:void(0);">招聘信息</a>
					<dl class="layui-nav-child">
					<dd><a href="jsp/enterprise/jobPosting.jsp">发布招聘信息</a></dd>
					<hr>
					<dd><a href="jsp/enterprise/manaRecrInfor.jsp">管理招聘信息</a></dd>
					</dl>
				</li>
				<li class="layui-nav-item"><a href="jsp/enterprise/entJobHunter.jsp" >应聘者</a>
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
		
		<div class="layui-container" style="margin:100px auto;">
			<div style="text-align:center;">
				<form class="layui-form layui-form-pane" lay-filter="example" method="post">
					<div class="layui-form-item">
							<label class="layui-form-label">企业名称</label>
							<div class="layui-input-block">
								<input type="text" name="bsname" autocomplete="off" placeholder="请输入企业名称" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label">法人姓名</label>
							<div class="layui-input-block">
								<input type="text" name="bspname" autocomplete="off" placeholder="请输入企业法人姓名" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label">工商注册号</label>
							<div class="layui-input-block">
								<input type="text" name="bsid" autocomplete="off" placeholder="请输入工商注册号" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
							<label class="layui-form-label">行业类别</label>
							<div class="layui-input-block">
								<input type="text" name="bsclass" autocomplete="off" placeholder="请输入行业类别" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">简介</label>
							<div class="layui-input-block">
								<textarea name="bsintr" id="bsi" placeholder="请输入企业简介" class="layui-textarea"></textarea>
							</div>
					</div>
					<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">公司文化</label>
							<div class="layui-input-block">
								<textarea name="bsculture" id="bsc" placeholder="请输入公司文化" class="layui-textarea"></textarea>
							</div>
					</div>
					<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">应聘须知</label>
							<div class="layui-input-block">
								<textarea name="bsablt" id="bsa" placeholder="请输入应聘须知" class="layui-textarea"></textarea>
							</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-setval">快捷填写</button>
								<button lay-submit lay-filter="save" class="layui-btn layui-btn-normal">保存</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- <button lay-filter="autoFill" id="autoFill" class="layui-btn layui-btn-normal" url:"autoFill.do">快捷填写</button>
		<input value="标题" type="button" onclick="window.location='autoFill.do'"/> -->
		<!-- <button type="button" class="layui-btn" id="LAY-component-form-setval" onclick="window.location='autoFill.do'">快捷填写</button> -->
		
		<input type="hidden" id="hidbsi" value="${bus.bsintr}">
		<input type="hidden" id="hidbsc" value="${bus.bsculture}">
		<input type="hidden" id="hidbsa" value="${bus.bsablt}">
	
	</div>

<script type="text/javascript">
	layui.use(["form","jquery","layer","element"],function(){
		var form=layui.form;
		var layer=layui.layer;
		var $=layui.jquery;
		var bsintr= $("#hidbsi").val();
		var bsculture= $("#hidbsc").val();
		var bsablt= $("#hidbsa").val();
		
		form.on("submit(save)",function(data){
			$.ajax({
				url:"updEntInfor.do",
				data:data.field,
				type:'POST',
				success:function(result){
					if(result == "success"){
						window.location.href='jsp/enterprise/enterprisemanage.jsp';
					}
				},
				error:function(){
					layer.msg("信息修改失败！");
				}
			});
			return false;
		}); 
		
		$('#LAY-component-form-setval').on('click', function(){
			form.val('example', {
		        "bsname": "${bus.bsname}" 
		        ,"bspname": "${bus.bspname}"
		        ,"bsid": "${bus.bsid}"
		        ,"bsclass": "${bus.bsclass}"
		        /* ,"bsintr": "${bus.bsintr}" */
		        /* ,"bsculture": "${bus.bsculture}" */
		        /* ,"bsablt": "${bus.bsablt}" */
			});
			function add()
			{  
			  document.getElementById('bsi').value = bsintr;
			  document.getElementById('bsc').value = bsculture;
			  document.getElementById('bsa').value = bsablt;
			}
			add();
		});
	});
</script>

</body>
</html>