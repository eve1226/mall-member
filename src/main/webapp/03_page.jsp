<%@page import="com.example.MallMember.DAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<jsp:include page="top.jsp"></jsp:include>
<section>
	<h2>회원매출조회</h2>
	<div>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
<%
	request.setCharacterEncoding("UTF-8");
	try{
		Connection con = DAO.getConnection();
		String sql = "select me.custno, me.custname, ";
			   sql +="case when me.grade='A' then 'VIP' when me.grade='B' then '일반' else '직원' end grade, ";
			   sql +=" sum(price) pr";
			   sql +=" from member_tbl_02 me, money_tbl_02 mo";
			   sql +=" where me.custno = mo.custno";
			   sql +=" group by me.custno, me.custname, me.grade";
			   sql +=" order by pr desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
%>
		<tr>
			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getInt(4) %></td>
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
