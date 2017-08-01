<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--设置浏览器的布局视口，只在移动端浏览器起作用-->
	<meta name="viewport" content="width=width-device,initial-scale=1,user-scalable=no" />
	<!--引入bootstrap的核心css-->
	<link rel="stylesheet" href="js/bootstrap/css/bootstrap.css" />
	<title>查询部门数据</title>
	<!--判断如果是IE9以下，引入兼容h5标签的js文件，注意空格的位置-->		
	<!--[if lt IE 9]>
	
	<script src="js/bootstrap/js/respond.min.js"></script>
	<script src="js/bootstrap/js/html5shiv.min.js"></script>		
	<![end if] -->
</head>
<body>	
	<div class="container">
		
		<ol class="breadcrumb">
			<li><a href="#">人力资源管理系统</a></li>
			<li><a href="#">部门管理</a></li>			
			<li>查询部门数据</li>
		</ol>

		<h2 class="page-header">部门数据列表</h2>
		
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>部门编号</th>
					<th>部门名称</th>
					<th>部门地址</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dept">
				<tr>
					<td>${dept.deptId}</td>
					<td>${dept.deptName}</td>
					<td>${dept.deptLoc}</td>
					<td>
						<a href="GetDeptServlet?deptId=${dept.deptId}" class="btn btn-primary btn-sm">修改</a>
						<a href="javascript:del(${dept.deptId});" class="btn btn-danger btn-sm">删除</a>						
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="row">
			<div class="col-sm-offset-8 col-sm-4">
				<a href="AddDept.html" class="btn btn-success btn-block">增加新部门</a>
			</div>
		</div>
	</div>

	<!--引入jquery-->
	<script src="js/jquery.js"></script>
	<!--引入bootstrap的js功能-->
	<script src="js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
	
		/*删除确认*/
		function del(deptId) {
			var flag = window.confirm("你确定要删除此部门吗");
			
			if (flag) {
				location.href = 'DelDeptServlet?deptId=' + deptId;
			}
		}
		
		$(document).ready(function() {

			/*表单验证*/
			var deptName = $('#deptName');
			var deptLoc = $('#deptLoc');

			$('#form1').submit(function() {
				
				if (deptName.val() == "" || deptName.val().length > 10)  {
					alert("部门名称不能为空且最多10字符");
					return false;
				}

				if (deptLoc.val() == "" || deptLoc.val().length > 20)  {
					alert("部门地址不能为空且最多20字符");
					return false;
				}

			});

		});		

	</script>
</body>
</html>