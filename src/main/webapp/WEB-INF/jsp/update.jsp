<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>update</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">

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
<form action="updateContent" method="post" enctype="multipart/form-data" id="myForm">
    <table border="1" cellspacing="0" cellpadding="0" align="center"
           id="mytable">
        <tr > <td colspan="2" style="background-color: #8c8c8c"><h1 style="text-align: center;">修改人才信息</h1></td></tr>
        <tr hidden="hidden"><input type="text" name="id" required="required" value="${list.id}" hidden="hidden"/></tr>
        <tr>
            <td>人才姓名<span style="color: #b92c28">（*）</span></td>
            <td><input type="text" name="name" required="required" id="name" value="${list.name}"/></td>
        </tr>
        <tr>
            <td>工作年限</td>
            <td><input type="text" name="workingLife" value="${list.workingLife}"/></td>
        </tr>
        <tr>
            <td>所属部门<span style="color: #b92c28">（*）</span></td>
            <td>
                <select name="departmentId" id="departmentId1">
                    <option selected="selected" value="123">全部</option>
                    <option value="3">人力资源管理</option>
                    <option value="1">测试部门</option>
                    <option value="2">开发部门</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>毕业学校</td>
            <td><input type="text" name="graduateSchool" value="${list.graduateSchool}"/></td>
        </tr>
        <tr>
            <td>个人简介</td>
            <td><input type="text" name="personalProfile" value="${list.personalProfile}"/></td>
        </tr>
        <tr>
            <td>工作经历</td>
            <td><input type="text" name="workExperience" value="${list.workExperience}"/></td>
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
    /*函数中传递的第一个参数是元素的id值，第二个参数是获取到的后台数据值*/
    firstVisit('departmentId1', '${list.departmentId}');

    function firstVisit(rId, rValue) {
        /!*通过元素id值获取元素对象*!/
        var rObj = document.getElementById(rId);
        /!*遍历元素中的子对象，查找值等于获取到值的子对象*!/
        for (var i = 0; i < rObj.options.length; i++) {
            if (rObj.options[i].value == rValue) {
                /!*做如下操作就可以实现后台数据值显示到网页select中*!/
                rObj.options[i].selected = 'selected';
                break;
            }
        }
    }
    $(document).ready(function () {
        var name = $("#name");
        var departmentId1 = $("#departmentId1");
        var btn = $("#btn");
        name.bind("blur", function () {
            if ($("#name").val() == "" || $.trim($("#name").val()).length == 0) {
                alert("人才姓名不能为空!");
                $("#name").focus();
                $("#name").attr("result", "fail");
            } else {
                $("#name").attr("result", "succ");
            }
        });
        departmentId1.bind("blur", function () {
            if ($("#departmentId1").val() == "123") {
                alert("部门不能选全部！请重新选择！");
                $("#departmentId1").focus();
                $("#departmentId1").attr("result", "fail");
            } else {
                $("#departmentId1").attr("result", "succ");
            }
        });
        btn.bind("click", function () {
            if (name.attr("result") != "succ") {
                name.blur();
            } else if (departmentId1.attr("result") != "succ") {
                departmentId1.blur();
            } else {
                if (confirm("是否确认提交数据?")) {
                    $("#myForm").submit();
                }
            }
        });
    });

</script>

</body>
</html>