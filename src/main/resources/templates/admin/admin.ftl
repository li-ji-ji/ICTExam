<!-- 配置页面路径  -->
<#assign base=request.contextPath/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>ICT测试后台管理系统</title>
  <link rel="stylesheet" type="text/css" href="${base}/js/layui/css/layui.css">
  <script type="text/javascript" src="${base}/js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="${base}/js/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">ICT测试后台管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    
    
	<!--     头部横向导航栏
	<ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul> 
    -->
    
    
    
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          ${admin.adminName}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="${base}/login/toLogout">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
      	<#list menus as firstMenu>
	        <li class="layui-nav-item layui-nav-itemed">
	          <a class="" href="javascript:void(0);">${firstMenu.menuName}</a>
	          <#list firstMenu.menus as secondMenu>
		          <dl class="layui-nav-child">
		            <dd><a href="javascript:void(0);" onclick="goTo('${secondMenu.url}')">${secondMenu.menuName}</a></dd>
		          </dl>
	          </#list>
	        </li>
  		</#list>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe id="data-table" src="${base}/admin/toWelcome?name=WELCOME" width="100%" height="98%"></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © Evil-Scream - 底部固定区域
  </div>
</div>

<script type="text/javascript">
	<!--自定义js代码-->
	function goTo(path){
		route='/ICT'
		$("#data-table").attr("src",route+path);
	}	
</script>

<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
});
</script>
</body>
</html>