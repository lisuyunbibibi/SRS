<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选课</title>
<link href="../script/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" />
    <script src="../script/jquery/jquery-1.7.1.min.js"></script>
    <script src="../script/ligerUI/js/ligerui.min.js"></script>

    <script src="../script/jquery-validation/jquery.validate.min.js"></script>
    <script src="../script/jquery-validation/jquery.metadata.js"></script>
    <script src="../script/jquery-validation/messages_cn.js"></script>
    <script src="../script/json2.js"></script>
    <style type="text/css">
        .middle input {
            display: block;
            width: 30px;
            margin: 2px;
        }
    </style>
</head>
<body>
    <form id="form1" class="liger-form" data-validate="{}">
        <div class="fields">
            <input data-type="text" data-label="StudentName" data-name="StudentName" validate="{required:true,minlength:5}" />
            <input data-type="text" data-label="ID Number" data-name="ID" validate="{required:true}" />
            
        </div>
        <div>
            <div style="margin: 4px; float: left;">
                <p>Schedule Of Classes</p>
                <div id="listbox1"></div>
            </div>
           
          
    </form>
    <div class="liger-button" data-click="f_validate" data-width="150">Save</div>
</body>

<script type="text/javascript">
    $(function () {
        $("#listbox1").ligerListBox({
            isShowCheckBox: true,
            isMultiSelect: false,
            width: 450,
            height: 140
        });

        loadSchedule();
        loadResigistion();
    });
    //从服务器加载选课列表
    function loadSchedule() {
    	$.post(
                "../scheduleOfClassServlet",
                function (result) {
                	if(result.success){
                		liger.get("listbox1").setData(result.data);     
                	}                	                 	 
                }
            );         
    }
    //从服务器加载当前登陆学生已选课程
    function loadResigistion() {

    }
    
        $.post(
                "../enrollCourseServlet",
                function (result) {
                     //var json = JSON2.parse(result);
                     //如果选课成果才移动列表框项目，否则应弹出选课失败的原因
                     if(result.success){
                    	 box1.removeItems(selecteds);
                         box2.addItems(selecteds);
                     }else{
                    	 alert(result.message);
                     }                                    	 
                }
            );         
    
    
    function f_validate(){
    	alert('已保存');
    }
</script>
</html>
