<%-- 
    Document   : empleadosoficio
    Created on : 23-oct-2015, 11:39:46
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Empleados por Oficio</title>
  </head>
  <body>
    <form action="empleadosoficio.jsp">
      <label for="oficio">Oficio:</label>
      <input type="text" name="oficio" value=<%= request.getParameter("oficio") %> 
          required autofocus/>
      <input type="submit" value="Ver"/>
    </form>
    <%
      DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
      Connection conexion = DriverManager.getConnection(
          "jdbc:oracle:thin:@localhost:1521:XE", "system", "javaoracle");
      
      String query ="SELECT APELLIDO, OFICIO FROM EMP WHERE OFICIO = ?";
      PreparedStatement sql = conexion.prepareStatement(query);
      sql.setString(1, request.getParameter("oficio").toUpperCase());
      
      ResultSet registros = sql.executeQuery();
    %>
    <table>
      <tr><th>APELLIDO</th><th>OFICIO</th></tr>
      <% while (registros.next()) { %>
        <tr>
          <td><%=registros.getString("APELLIDO")%></td>
          <td><%=registros.getString("OFICIO")%></td>
      <% } %>
    </table>
  </body>
</html>
