<%@ page import="cn.saymagic.weixin.server.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!!!!</h2>
<%
    String host = request.getParameter("host");
    if(host != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String port = request.getParameter("port");

        String result = DBUtil.connect(host, Integer.valueOf(port), username, password);
        request.setAttribute("result", result);
    }
%>

Result: <%= request.getAttribute("result")%>

<form action="/index.jsp" method="post">
    <table>
        <tr>
            <th>名称</th>
            <th>值</th>
            <th></th>
        </tr>
        <tr>
            <td>数据库地址</td>
            <td><input type="text" name="host" value="<%=request.getParameter("host")%>"/></td>
            <td></td>
        </tr>
        <tr>
            <td>端口</td>
            <td><input type="text" name="port" value="<%=request.getParameter("port")%>"/></td>
            <td></td>
        </tr>
        <tr>
            <td>登录名</td>
            <td><input type="text" name="username" value="<%=request.getParameter("username")%>"/></td>
            <td></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="text" name="password" value="<%=request.getParameter("password")%>"/></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交"/></td>
            <td></td>
        </tr>
    </table>
</form>
</body>
</html>
