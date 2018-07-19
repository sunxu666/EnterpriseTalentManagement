<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        //服务器路径（http://localhost:3306/项目名）
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <script type="text/javascript" src="statics/js/jquery.min.js"></script>
    <link rel="stylesheet" href="statics/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="statics/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <br>
    <br>
    <div class="row">
        <div>
            <form action="ETs1" class="col-md-6" style="text-align: right">
                部门名称：
                <select name="departmentId" id="departmentId1">
                    <option selected="selected" value="123">全部</option>
                    <option value="3">人力资源管理</option>
                    <option value="1">测试部门</option>
                    <option value="2">开发部门</option>
                </select>
                <button id="select" type="submit">查询</button>


            </form>
            <button id="add">新增员工</button>
        </div>
    </div>

    <div class="row"></div>
    <div class="col-md-12" style="background-color: #8c8c8c">
        <h1 style="text-align: center">人才信息列表</h1>
    </div>

    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" style="align-content: center">
                <tr>
                    <th>人才编号</th>
                    <th>人才姓名</th>
                    <th>工作年限</th>
                    <th>所属部门</th>
                    <th>毕业学校</th>
                    <th>操作</th>

                </tr>
                <c:forEach items="${pageInfo.list}" var="emp" varStatus="status">
                    <tr <c:if test="${status.count%2==0}">style="background-color: #2b669a" </c:if>>
                        <th>${emp.id}</th>
                        <th>${emp.name}</th>
                        <th>${emp.workingLife}年</th>
                        <th>
                            <%--${emp.department}--%>
                                ${emp.departmentId==1?"测试部门":""}
                                ${emp.departmentId==2?"开发部门":""}
                                ${emp.departmentId==3?"人力资源管理":""}

                        </th>
                        <th>${emp.graduateSchool}</th>
                        <th>
                            <button class="btn btn-primary btn-sm" onclick="goUpdate('${emp.id}');">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                修改
                            </button>
                            <button class="btn btn-danger btn-sm" onclick='deleteSubject("${emp.id}","${emp.name}")'>
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>

                </c:forEach>


            </table>
        </div>
        <div>
            <c:if test="${!empty param.msg }">
                <h4 style="text-align: center;color: #b92c28">${msg}
                </h4>
            </c:if>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">

        <div class="col-md-12" style="text-align: center">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/ETs1?pn=1&departmentId=${deptId}">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/ETs1?pn=${pageInfo.pageNum-1}&departmentId=${deptId}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/ETs1?pn=${page_Num}&departmentId=${deptId}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/ETs1?pn=${pageInfo.pageNum+1}&departmentId=${deptId}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <li><a href="${APP_PATH}/ETs1?pn=${pageInfo.pages}&departmentId=${deptId}">末页</a></li>
                    <li style="font-size:20px; align-content: center">第${pageInfo.pageNum}页/共${pageInfo.pages}页</li>
                </ul>
            </nav>
        </div>
    </div>

</div>
<script>

    $(function () {
        $("#add").click(function () {
            location.href = "/add";
        });
    });

    function deleteSubject(id, name) {
        if (confirm("确定要删除" + name + "课程吗？")) {
            location.href = "delete?id=" + id;
        }
    }

    function goUpdate(id) {
        location.href = "/update?id=" + id;
    }

    /*函数中传递的第一个参数是元素的id值，第二个参数是获取到的后台数据值*/
    firstVisit('departmentId1', '${deptId}');

    function firstVisit(rId, rValue) {
        /*通过元素id值获取元素对象*/
        var rObj = document.getElementById(rId);
        /*遍历元素中的子对象，查找值等于获取到值的子对象*/
        for (var i = 0; i < rObj.options.length; i++) {
            if (rObj.options[i].value == rValue) {
                /*做如下操作就可以实现后台数据值显示到网页select中*/
                rObj.options[i].selected = 'selected';
                break;
            }
        }
    }
</script>
</body>
</html>
