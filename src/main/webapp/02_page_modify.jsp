<%@page import="com.example.MallMember.DAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	request.setCharacterEncoding("UTF-8");
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = "";
	String phone = "";
	String address = "";
	String joindate = "";
	String grade = "";
	String city = "";
	
	try{
		Connection con = DAO.getConnection();
		String sql = "select custname,phone,address,date_format(joindate,'%Y-%m-%d'),grade,city from member_tbl_02 where custno = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,custno);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			custname = rs.getString(1);
			phone = rs.getString(2);
			address = rs.getString(3);
			joindate = rs.getString(4);
			grade = rs.getString(5);
			city = rs.getString(6);
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
	<form action="02_page_modifyPro.jsp" method="post" name="frm2">
	<table>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" value="<%=custname %>"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" value="<%=phone %>"></td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address" value="<%=address %>"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" value="<%=joindate %>"></td>
		</tr>
		<tr>
			<th>고객등급[A:VIP, B:일반, C:직원]</th>
			<td>
				<select name="grade">
					<option value=""></option>
					<option value="A" <% if(grade.equals("A")){%> selected<%} %>>A:VIP</option>
					<option value="B" <% if(grade.equals("B")){%> selected<%} %>>B:일반</option>
					<option value="C" <% if(grade.equals("C")){%> selected<%} %>>C:직원</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td>
				<input type="radio" name="city" value="01" <% if(city.equals("01")){%> checked<%} %>>01
				<input type="radio" name="city" value="30" <% if(city.equals("30")){%> checked<%} %>>30
				<input type="radio" name="city" value="60" <% if(city.equals("60")){%> checked<%} %>>60
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<button type="submit">수 정</button>
				<button type="button" onclick="window.location.href='02_page.jsp'">조 회</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>