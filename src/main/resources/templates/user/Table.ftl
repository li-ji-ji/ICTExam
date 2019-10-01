<!-- 配置页面路径  -->
<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <link rel="stylesheet" href="${base}/js/layui/css/layui.css">
  <script type="text/javascript" src="${base}/js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="${base}/js/layui/layui.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>  
<div style="margin-bottom: 5px;">
 
<table class="layui-table" id="userTable" lay-filter="userTable">

</table>
<script type="text/html" id="assistTool">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>
<script type="text/html" id="editTool">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="statusCheck">
  <input lay-skin="switch" lay-text="ON|OFF" type="checkbox" id="{{d.stuId}}" value="{{d.status}}" title="启用"  lay-filter="statusCheck" {{ d.status == 1 ? 'checked' : '' }}>
</script>          
          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['table','laypage','layer'], function(){
  var form = layui.form;
  var table = layui.table;
  var laypage = layui.laypage;
  var $ = layui.jquery, layer = layui.layer;
  var tableObj = table.render({
	    elem: '#userTable'
	    ,height: 'full-80'
	    ,url: '${base}/userAPI/getAll' //数据接口
	    ,page: true //开启分页
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	    ,cols: [[ //表头
	    	{type:'checkbox', fixed: 'left'}
	        ,{field: 'stuId', title: '用户ID',align:'center', width:120, sort: true, fixed: 'left'}
	        ,{field: 'username', title: '用户名',edit: 'text', align:'center',width:120}
	        ,{field: 'password', title: '用户密码',edit: 'text',align:'center', width:120, sort: true}
	        ,{field: 'salt', title: '用户盐',edit: 'text',align:'center', width:160} 
	        ,{field: 'status', title: '用户状态',align:'center', width:120,templet: '#statusCheck', unresize: true}
	        ,{field: 'url', title: '操作栏',align:'center', width: 220, sort: true,toolbar: '#editTool', fixed: 'right'}
	      ]]
	  });
  //监听表格复选框选择
  table.on('toolbar(assistTool)', function(obj){
    	var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){
	      case 'getCheckData':
	        var data = checkStatus.data;
	        layer.alert(JSON.stringify(data));
	      break;
	      case 'getCheckLength':
	        var data = checkStatus.data;
	        layer.msg('选中了：'+ data.length + ' 个');
	      break;
	      case 'isAll':
	        layer.msg(checkStatus.isAll ? '全选': '未全选');
	      break;
	      
	      //自定义头工具栏右侧图标 - 提示
	      case 'LAYTABLE_TIPS':
	        layer.alert('这是工具栏右侧自定义的一个图标按钮');
	      break;
	    };
  });
  //监听菜单状态选择
  form.on('switch(statusCheck)', function(obj){
	    //layer.tips(this.value + ' ' + this.id + '：'+ obj.elem.checked, obj.othis);
	    //console.log(this.id)
	    //console.log("打印选中状态")
	    //console.log(obj.elem.checked)
	    var status=0
	    if(obj.elem.checked==true){
	    	status=1
	    }
	    //console.log("打印菜单数据")
	    //console.log(menu)
	    //console.log(json)
	    $.ajax({
	    	"url" : "${base}/userAPI/setStatusById",
	    	"data":{
	    		stuId : this.id,
	    		status : status
	    		},
	    		"type" : "get",
	    		"dataType" : "json",
	    	    "success"	: function (resultMsg) {
	    	    	layer.open({
	    	    		type: 1 //不显示标题栏   title : false/标题
	    	    		,title: resultMsg.msg+"，返回菜单"
	    	    		,btn: ['好的']
	    	    		,btnAlign: 'c'
	    	    		,success: function(layero){
	    	    			tableObj.reload()
	    	    			}
	    	    		});
	    	    	}
	    		});
	    });
	    //监听工具条
	    table.on('tool(userTable)', function(obj){
	      var data = obj.data;
	      if(obj.event === 'detail'){
	        layer.msg('ID：'+ data.id + ' 的查看操作');
	      } else if(obj.event === 'del'){
	        layer.confirm('真的删除行么', function(index){
	        	console.log(obj)
	  	    $.ajax({
		    	"url" : "${base}/userAPI/delByStuId",
		    	"data":{
		    		stuId : obj.data.stuId
		    		},
		    		"type" : "get",
		    		"dataType" : "json",
		    	    "success"	: function (resultMsg) {
		    	    	obj.del();
		    	    	layer.close(index);
		    	    	}
		    		});
	        });
	      } else if(obj.event === 'edit'){
	    	  var user=JSON.stringify(data)
	    	  console.log(user)
	    	  $.ajax({
			    	"url" : "${base}/userAPI/setOne",
			    	"data":user,
			    		"type" : "post",
			    		"contentType": 'application/json',
			    		"dataType" : "json",
			    	    "success"	: function (resultMsg) {
			    	    	layer.open({
			    	    		type: 1 //不显示标题栏   title : false/标题
			    	    		,title: resultMsg.msg+"，返回菜单"
			    	    		,btn: ['好的']
			    	    		,btnAlign: 'c'
			    	    		,success: function(layero){
			    	    			tableObj.reload()
			    	    			}
			    	    		});
			    	    }
			 });
	      }
	    });
	    
	  
	    $('.demoTable .layui-btn').on('click', function(){
	      var type = $(this).data('type');
	      active[type] ? active[type].call(this) : '';
	    });
});
</script>

</body>
</html>