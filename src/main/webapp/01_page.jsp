<%@page import="com.example.MallMember.DAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	request.setCharacterEncoding("UTF-8");
	int custno = 0;
	try{
		Connection con = DAO.getConnection();
		String sql = "select max(custno) from member_tbl_02";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			custno =  rs.getInt(1);
		}
		con.close();
		ps.close();
		rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<jsp:include page="top.jsp"></jsp:include>
<section>
	<h2>회원등록</h2>
	<div>
	<form action="01_pagePro.jsp" method="post" name="frm">
	<table>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="custno" value="<%=custno+1 %>" readonly></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate"></td>
		</tr>
		<tr>
			<th>고객등급[A:VIP, B:일반, C:직원]</th>
			<td>
				<select name="grade">
					<option value=""></option>
					<option value="A">A:VIP</option>
					<option value="B">B:일반</option>
					<option value="C">C:직원</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td>
				<input type="radio" name="city" value="01">01
				<input type="radio" name="city" value="30">30
				<input type="radio" name="city" value="60">60
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<button type="submit" onclick="return ch()">등 록</button>
				<button type="button" onclick="window.location.href='02_page.jsp'">조 회</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
