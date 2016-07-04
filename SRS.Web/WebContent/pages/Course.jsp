<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选课系统</title>
    <style type="text/css">
        .middle input {
            display: block;
            width: 30px;
            margin: 2px;
        }
    </style>
</head>
<body>
<form action="" method="post">
        <div class="fields">
            StudentName<input type="text" name="StudentName"   /><br>
            ID Number<input type="text" name="ID Number"   /><br>
            scheduleOfCourse<br>
            <label><input name="scheduleOfCourse" type="checkbox" value="" />Beginning Basketweaving</label> 
            <label><input name="scheduleOfCourse" type="checkbox" value="" />Beginning Computer Technology</label> 
            <label><input name="scheduleOfCourse" type="checkbox" value="" />Higher Level Languages</label> 
            <label><input name="scheduleOfCourse" type="checkbox" value="" />Living Brain Computers</label> 
            <label><input name="scheduleOfCourse" type="checkbox" value="" />Object Methods for Software Development</label><br>
            <input type="submit" name="save" value="save"> 
            


</body>
</html>