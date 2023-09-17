<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>

<%@ include file = "layout/db_connect.jsp" %>

<%
    String sql = "select max(custno)+1 from member_tbl_02";
   
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
     rs.next();
     int num = rs.getInt(1);
 %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쇼핑몰 회원관리</title>
    <link rel = "stylesheet" href = "./css/style.css?ver1.1.6">
    <script type="text/javascript">
        function checkValue(){
            var cv = document.data;
            if(!cv.custname.value){
                alert("회원성명을 입력하세요.");
                document.data.custname.focus();
                return false;
            }
            if(!document.data.phone.value){
                alert("전화번호를 입력하세요.");dbconnect.jsp
                document.data.phone.focus();
                return false;
            }
            if(!cv.address.value){
                alert("주소를 입력하세요.");
                document.data.address.focus();
                return false;
            }
            if(!cv.joindate.value){
                alert("가입일자를 입력하세요.");
                document.data.joindate.focus();
                return false;
            }
            if(!cv.grade.value){
                alert("고객등급을 입력하세요.");
                document.data.grade.focus();
                return false;
            }
            if(!cv.city.value){
                alert("도시코드를 입력하세요.");
                document.data.city.focus();
                return false;
            }
           
        }
    </script>
</head>
<body>
    <header>
        <jsp:include page="layout/header.jsp"></jsp:include>
    </header>
   
    <nav>
        <jsp:include page="layout/nav.jsp"></jsp:include>    
    </nav>
    <main id = "section">
        <h2 class = "title">회원등록</h2>
        <form name = "data" action = "join_p.jsp" method = "post" onsubmit = "return checkValue()">
        <table class = "table_line" border = "1">
            <tr>
                <th>회원번호</th>
                <td><input type = "text" name = "custno" value = "<%= num %>" readonly></td>    
            </tr>
       
            <tr>
                <th>회원성명</th>
                <td><input type = "text" name = "custname" autofocus></td>    
            </tr>
       
            <tr>
                <th>회원전화</th>
                <td><input type = "text" name = "phone"></td>    
            </tr>
       
            <tr>
                <th>회원주소</th>
                <td><input type = "text" name = "address"></td>    
            </tr>
       
            <tr>
                <th>가일입자</th>
                <td><input type = "text" name = "joindate"></td>    
            </tr>
       
            <tr>
                <th>고객등급</th>
                <td><input type = "text" name = "grade"></td>    
            </tr>
       
            <tr>
                <th>도시코드</th>
                <td><input type = "text" name = "city"></td>    
            </tr>
            <tr>
                <td colspan = "2" align = "center">
                    <input type = "submit" value = "등록" onclick = "location.href = 'join.jsp'">
                    <input type = "button" value = "취소" onclick = "location.href = 'join.jsp'">
                    <input type = "button" value = "조회">
            </tr>
           
        </table>
       
        </form>
       
</main>
    <footer>
        <jsp:include page="layout/footer.jsp"></jsp:include>    
    </footer>
   
       
   
</body>
</html>