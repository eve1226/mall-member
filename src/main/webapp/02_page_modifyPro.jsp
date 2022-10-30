<%@page import="com.example.MallMember.DAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	request.setCharacterEncoding("UTF-8");
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	try{
		Connection con = DAO.getConnection();
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,custname);
		ps.setString(2,phone);
		ps.setString(3,address);
		ps.setString(4,joindate);
		ps.setString(5,grade);
		ps.setString(6,city);
		ps.setInt(7,custno);
		int rs = ps.executeUpdate();
		if(rs > 0){
			%>
			<script>
				alert("수정완료");
				window.location.href="02_page.jsp";
			</script>
			<%
		}
		con.close();
		ps.close();
	}catch(Exception e){
		%>
		<script>
			alert("실패");
			window.location.href="02_page.jsp";
		</script>
		<%	
	}
	
	/*response.sendRedirect("02_page.jsp");*/
%>