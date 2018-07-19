<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>add</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        /* $(document).ready(function(){
            $("#mytable tr").each(function(){
                $(this).find("td:first").css("textAlign","center");

            })
        }); */
    </script>
    <style type="text/css">
        tr {
            height: 40px;
        }

        td {
            text-align: center;
        }

        table {
            width: 600px;
        }
    </style>
</head>
<body>

<form action="addContent" method="post" enctype="multipart/form-data" id="myForm">
    <table border="1" cellspacing="0" cellpadding="0" align="center"
           id="mytable">
        <tr > <td colspan="2" style="background-color: #8c8c8c"><h1 style="text-align: center;">添加人才信息</h1></td></tr>
        <tr>
            <td>人才姓名<span style="color: #b92c28">（*）</span></td>
            <td><input type="text" name="name" id="name" required="required"/></td>
        </tr>
        <tr>
            <td>工作年限</td>
            <td><input type="text" name="workingLife"/></td>
        </tr>
        <tr>
            <td>所属部门<span style="color: #b92c28">（*）</span></td>
            <td>
                <select name="departmentId" id="departmentId">
                    <option selected="selected" value="123">全部</option>
                    <option value="3">人力资源管理</option>
                    <option value="1">测试部门</option>
                    <option value="2">开发部门</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>毕业学校</td>
            <td><input type="text" name="graduateSchool"/></td>
        </tr>
        <tr>
            <td>个人简介</td>
            <td><input type="text" name="personalProfile"/></td>
        </tr>
        <tr>
            <td>工作经历</td>
            <td><input type="text" name="workExperience"/></td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="button" id="btn" value="提交">
                <a type="button" href="/ETs">返回</a>
            </td>
        </tr>

    </table>
</form>
<script type="text/javascript">

    $(document).ready(function() {
        var name = $("#name");
        var departmentId = $("#departmentId");
        var btn = $("#btn");
        name.bind("blur",function(){
            if($("#name").val() == "" || $.trim($("#name").val()).length == 0){
                alert("人才姓名不能为空!");
                $("#name").focus();
                $("#name").attr("result", "fail");
            }else{
                $("#name").attr("result", "succ");
            }
        });
        departmentId.bind("blur",function(){
            if($("#departmentId").val() == "123"){
                alert("请选择部门！");
                $("#departmentId").focus();
                $("#departmentId").attr("result", "fail");
            }else{
                $("#departmentId").attr("result", "succ");
            }
        });
        btn.bind("click",function(){
            if (name.attr("result") != "succ") {
                name.blur();
            } else if (departmentId.attr("result") != "succ") {
                departmentId.blur();
            }  else {
                if (confirm("是否确认提交数据?")) {
                    $("#myForm").submit();
                }
            }
        });
    });



</script>

</body>
</html>