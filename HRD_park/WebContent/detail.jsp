<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	//custno를 이용해서 데이터 찾아오기
	int custno = Integer.parseInt(
			request.getParameter("custno"));
	//데이터베이스 연결 코드
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection(
		"jdbc:oracle:thin:@192.168.0.100:1521/xe",
		"user20", "user20");
	//기본키를 가지고 데이터 찾아오기
	PreparedStatement pstmt = 
		con.prepareStatement(
			"select * from member_tbl_02 where custno=?");
	pstmt.setInt(1, custno);
	//SQL 실행
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	String custname = rs.getString("custname");
	String phone = rs.getString("phone");
	String address = rs.getString("address");
	String grade = rs.getString("grade");
	String city = rs.getString("city");
	Date joindate = rs.getDate("joindate");
	
	rs.close();
	pstmt.close();
	con.close();
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">홈쇼핑 회원 정보 수정</h2>
	<form  id="updateform">
		<table align="center" border="1">
			<tr>
				<td align="center" width="250">회원번호</td>
				<td width="300"> 
				<input type="text" value='<%=custno%>'
				name="custno" id="custno" 
				readonly='readonly'/>
				</td>
			</tr>
			<tr>
				<td align="center">회원성명</td>
				<td> 
				<input type="text" 
				name="custname" id="custname" value='<%=custname%>'/>
				</td>
			</tr>
			<tr>
				<td align="center">회원전화</td>
				<td> 
				<input type="text" name="phone" id="phone" size="30"
				value='<%=phone%>'/>
				</td>
			</tr>
			<tr>
				<td align="center">회원주소</td>
				<td> 
				<input type="text" name="address" 
				id="address" size="50" value='<%=address%>' />
				</td>
			</tr>
			<tr>
				<td align="center">가입일자</td>
				<td> 
				<input type="text" value="<%=joindate %>"
				name="joindate" id="joindate" />
				</td>
			</tr>
			<tr>
				<td align="center">고객등급[A:VIP,B:일반,C:직원]</td>
				<td> 
				<input type="text" name="grade" id="grade" 
				value='<%=grade%>'/>
				</td>
			</tr>
			<tr>
				<td align="center">도시코드</td>
				<td> 
				<input type="text" name="city" id="city"
				value='<%=city%>' />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="수정" id="updatebtn"/>
				<input type="button" value="조회" id="searchbtn"/>
				</td>
			</tr>	
		</table>
	</form>
</body>
</html>