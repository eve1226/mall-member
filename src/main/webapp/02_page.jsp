<%@page import="com.example.MallMember.DAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="top.jsp"></jsp:include>
<section>
	<h2>회원목록조회/수정</h2>
	<div>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
<%	
	try{
		Connection con = DAO.getConnection();
		String sql = "select custno,custname,phone,address,date_format(joindate,'%Y-%m-%d'),";
			   sql += " case";
			   sql += " when grade='A' then 'VIP'";
			   sql += " when grade='B' then '일반'";
			   sql += " else '직원'";
			   sql += " end grade,";
			   sql += " city";
			   sql += " from member_tbl_02";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
%>
		<tr>
			<td><a href="02_page_modify.jsp?custno=<%=rs.getInt(1)%>"><%=rs.getInt(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
<%
		}
		con.close();
		ps.close();
		rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	</table>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>