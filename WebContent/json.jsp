<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var  user={"username":"tengsir","password":"123","sex":"male","age":12}

var  names='[{"brand":"BMW","price":55,"gonglishu":24},{"brand":"BMW","price":77,"gonglishu":24},{"brand":"BMW","price":88,"gonglishu":24}]';

var  objs=eval('('+names+')');
alert(objs.length)
alert(objs[1].price)

</script>
</body>
</html>