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
<style>
	.img-box{
		position:relative;
		width: 92px;
    	height: 92px;
    	padding:5px;
    	display:inline-block;
    	margin: 0 10px 10px 0;
    	border:1px solid #c5c5c5;
    	border-radius: 5px;
	}
	.layui-upload-img{
		width: 92px;
    	height: 92px;
    	margin: 0 10px 10px 0;
	}
	.remove-btn{
		display: none;
		position:absolute;
		width: 92px;
    	height: 92px;
    	top:0;
		background-image: url(${base}/images/img-delete.png);
		background-size:48px 48px;
		opacity: 0.6;
		background-repeat:no-repeat;
		background-position:center center;
	}
	/* .img-box:hover .remove-btn{
		display: block;
	} */
</style>

<body style="padding-top:20px;">  
<form class="layui-form"  style="width:60%;">
	
  <div class="layui-form-item">
    <label class="layui-form-label">题目种类</label>
    <div class="layui-input-block">
      <select name="exerciseType" id="exerciseType" lay-filter="exerciseType">
        <option value="0">单选题</option>
        <option value="1">多选题</option>
        <option value="2">判断题</option>
        <option value="3">填空题</option>
      </select>
    </div>
  </div>
	
  <div class="layui-form-item">
    <label class="layui-form-label">最大分值</label>
    <div class="layui-input-block">
      <input type="number" name="maxIntegral" autocomplete="off" placeholder="请输入最大分值" class="layui-input">
    </div>
  </div>
  

  <div class="layui-form-item" id="decType-box">
    <label class="layui-form-label">减分种类</label>
    <div class="layui-input-block">
      <select name="decType" id="decType" lay-filter="decType">
        <option value="0">不减分</option>
        <!-- <option value="1">比例递减</option> -->
        <option value="1">分值递减</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item" id='minIntegral'>
    <label class="layui-form-label">最小分值</label>
    <div class="layui-input-block">
      <input type="number" name="minIntegral" autocomplete="off" placeholder="请输入最小分值" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item" id="decPercent">
    <label class="layui-form-label">递减比例</label>
    <div class="layui-input-block">
      <input type="number" name="decPercent" autocomplete="off" placeholder="请输入递减比例" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item" id="integerDec">
    <label class="layui-form-label">递减分值</label>
    <div class="layui-input-block">
      <input type="number" name="integerDec" autocomplete="off" placeholder="请输入递减分值" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item" id="decNum">
    <label class="layui-form-label">递减次数</label>
    <div class="layui-input-block">
      <input type="number" name="decNum" autocomplete="off" placeholder="请输入递减次数" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">题目内容</label>
    <div class="layui-input-block">
      <textarea name="content" placeholder="请输入题目内容" class="layui-textarea"></textarea>
    </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">题目图片</label>
    <div class="layui-input-block">
	  <div class="layui-upload">
	    <button type="button" class="layui-btn" id="imgBtn">图片上传</button> 
	    <button type="button" class="layui-btn layui-btn-danger" id="imgRemoveAllBtn">图片清空</button> 
     	<input type ="file" name="file" id="imgUploadBtn" onchange="getImg(this.files)" style="display:none;"/> 
	    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
		  <div class="layui-upload-list" id="demo2"></div>
		</blockquote>
	  </div>
    </div>
  </div>
  
  <div class="layui-form-item layui-form-text" style="display: none;"><!--  style="display: none;" -->
    <label class="layui-form-label">题目图片</label>
    <div class="layui-input-block">
      <input type="text" id="contentImg" name="contentImg" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item" id="answer-option">
    <label class="layui-form-label">题目选项</label>
    <div class="layui-input-block">
      <input type="text" name="answer-option" autocomplete="off" placeholder="请输入选项A" class="layui-input">
      <input type="text" name="answer-option" autocomplete="off" placeholder="请输入选项B" class="layui-input">
      <input type="text" name="answer-option" autocomplete="off" placeholder="请输入选项C" class="layui-input">
      <input type="text" name="answer-option" autocomplete="off" placeholder="请输入选项D" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item layui-form-text" id="answer-box">
    <label class="layui-form-label">题目答案</label>
    <div class="layui-input-block" id="answer">
    	<input type="radio" name="answer" value="A" title="A">
    	<input type="radio" name="answer" value="B" title="B">
    	<input type="radio" name="answer" value="C" title="C">
    	<input type="radio" name="answer" value="D" title="D">
    </div>
  </div>

  <!--<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">编辑器</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
    </div>
  </div>-->
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  
  


  
</form>

<script type="text/javascript">
	var imgArray=[]
	//图片转base64
	function blobToDataURL(blob,cb) {
	    let reader = new FileReader();
	    reader.onload = function (evt) {
	      var base64 = evt.target.result
	      cb(base64)
	    };
	    reader.readAsDataURL(blob);
	}
	if($("#decType option:selected").val()==0){
		$("#minIntegral").hide()
		$("#decPercent").hide()
		$("#integerDec").hide()
		$("#decNum").hide()
	} 
	if($("#exerciseType option:selected").val()==0||$("#exerciseType option:selected").val()==1||$("#exerciseType option:selected").val()==2){
		$("#decType-box").hide()
	}
	function imgRemove(obj) {
        $(obj).parent().remove() 
    }
	$("#imgBtn").click(()=>{
		$("#imgUploadBtn").click()
	})
	$("#imgRemoveAllBtn").click(()=>{
		imgArray.length = 0
		$("#demo2").empty()
		//console.log(imgArray)
	})
	function getImg(data){
		var img=data[0]
		if(img){
	      var url = URL.createObjectURL(img);
	      var base64 = blobToDataURL(img,function(base64Url) {
	        //console.log(base64Url)
	        imgArray.push(base64Url)
	        $('#demo2').append(
        		'<div class="img-box">'+
        		'<img src="'+ base64Url +'"  class="layui-upload-img">'+
        		'<div class="remove-btn" onclick="imgRemove(this)"></div>'+
        		'</div>'
        		)
	      })
		}
	}
</script>

<script>
layui.use(['upload','form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,$ = layui.jquery
  ,upload = layui.upload;
  
  
  //日期
  laydate.render({
    elem: '#date'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  //监听select变化
  form.on('select(decType)', function(data){
	  if(data.value==0){
			$("#minIntegral").hide()
			$("#decPercent").hide()
			$("#integerDec").hide()
			$("#decNum").hide()
	  }else if(data.value==1){
			$("#integerDec").hide()
			$("#minIntegral").show()
			$("#decPercent").show()
			$("#decNum").show()
	  }else if(data.value==2){
			$("#decPercent").hide()
			$("#minIntegral").show()
			$("#integerDec").show()
			$("#decNum").show()
	  }
	});   
  	form.on('select(exerciseType)', function(data){
	  if(data.value==0){
			$("#answer").remove()
	        $('#answer-box').append(
	        		'<div class="layui-input-block" id="answer">'+
	        		'<input type="radio" name="answer" value="A" title="A">'+
	        		'<input type="radio" name="answer" value="B" title="B">'+
	        		'<input type="radio" name="answer" value="C" title="C">'+
	        		'<input type="radio" name="answer" value="D" title="D">'+
	        		'</div>'
	        		)
			$("#decType").val("0")
	    	$("#decType-box").hide()
			$("#minIntegral").hide()
			$("#decPercent").hide()
			$("#integerDec").hide()
			$("#decNum").hide()
			$("#answer-option").show()
	        form.render();
	  }else if(data.value==1){
			$("#answer").remove()
	        $('#answer-box').append(
	        		'<div class="layui-input-block" id="answer">'+
	        		'<input type="checkbox" name="answerCheck" value="A" title="A"> '+
	        		'<input type="checkbox" name="answerCheck" value="B" title="B"> '+
	        		'<input type="checkbox" name="answerCheck" value="C" title="C"> '+
	        		'<input type="checkbox" name="answerCheck" value="D" title="D"> '+
	        		'</div>'
	        		)
	    	$("#decType").val("0")
	    	$("#decType-box").hide()
			$("#minIntegral").hide()
			$("#decPercent").hide()
			$("#integerDec").hide()
			$("#decNum").hide()
			$("#answer-option").show()
	        form.render();
	  }else if(data.value==2){
			$("#answer").remove()
	        $('#answer-box').append(
	        		'<div class="layui-input-block" id="answer">'+
	        		'<input type="radio" name="answer" value="1" title="正确">'+
	        		'<input type="radio" name="answer" value="0" title="错误">'+
	        		'</div>'
	        		)
	    	$("#decType").val("0")
	    	$("#decType-box").hide()
			$("#minIntegral").hide()
			$("#decPercent").hide()
			$("#integerDec").hide()
			$("#decNum").hide()
			$("#answer-option").hide()
	        form.render();
	  }else if(data.value==3){
			$("#answer").remove()
	        $('#answer-box').append(
	        		'<div class="layui-input-block" id="answer">'+
	        		'<input type="text"  name="answer" autocomplete="off" class="layui-input">'+
	        		'</div>'
	        		)
			$("#decType-box").show()
			$("#answer-option").hide()
	        form.render();
	  }
	});   
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    data.field.contentImg=encodeURIComponent(JSON.stringify(imgArray))
    if(data.field.maxIntegral == ''){  
        layer.msg('最大分值不能为空',function() {time:2000}); 
        return false;  
    }
    if($("#decType").val()!=0&&data.field.minIntegral == ''){
        layer.msg('最小分值不能为空',function() {time:2000}); 
        return false;  
    }
    if(data.field.content == ''){
        layer.msg('题目内容不能为空',function() {time:2000}); 
        return false;  
    }
    if(data.field.minIntegral >data.field.maxIntegral){
        layer.msg('最小分值不能大于最大分值',function() {time:2000}); 
        return false;  
    }
    var answerArr=[] 
    var optionArr=[] 
    //取出答案数组
    $("input:checkbox[name='answerCheck']:checked").each(function(i){
        answerArr.push($(this).val())
    })
    //取出选项数组
    $("input:text[name='answer-option']").each(function(i){
    	optionArr.push($(this).val())
    })
    data.field.answerOption=encodeURIComponent(JSON.stringify(optionArr))
    //console.log(data.field.answerOption)
    if(answerArr.length>0){
    	data.field.answer=''
    	for (var value of answerArr) {
    		//console.log(value);
    		data.field.answer+=value
    	}
    }
/*     layer.alert(JSON.stringify(data.field), {
        title: '最终的提交信息'
    }) 
    return false; */
  	  $.ajax({
		  "url": "${base}/exerAPI/addOne",
		  "data":JSON.stringify(data.field),
		  "type":"post",
  		  "contentType": 'application/json',
    	  "dataType" : "json",
    	  "async" :false,
    	  "success" : function (resultMsg) {
    			  layer.open({
    				    type: 1 //不显示标题栏   title : false/标题
    				    ,title: resultMsg.msg+"，返回菜单"
    				    ,closeBtn: false
    				    ,area: '300px;'
    				    ,shade: 0.8
    				    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
    				    ,resize: false
    				    ,btn: ['好的']
    				    ,btnAlign: 'c'
    				    ,moveType: 1 //拖拽模式，0或者1
    				    ,success: function(layero){
    				    	//console.log(resultMsg)
    				         var btn = layero.find('.layui-layer-btn');
    				            btn.find('.layui-layer-btn0').attr({
    				                 href: '${base}/exer/toTable'
    				            ,target: '_self'
    				        });
    				    }
    				});
			}
	  });  
  	return false;
  });
 
  //表单赋值
  layui.$('#LAY-component-form-setval').on('click', function(){
    form.val('example', {
      "username": "贤心" // "name": "value"
      ,"password": "123456"
      ,"interest": 1
      ,"like[write]": true //复选框选中状态
      ,"close": true //开关状态
      ,"sex": "女"
      ,"desc": "我爱 layui"
    });
  });
  
  //表单取值
  layui.$('#LAY-component-form-getval').on('click', function(){
    var data = form.val('example');
    alert(JSON.stringify(data));

  });
  
});
</script>

</body>
</html>