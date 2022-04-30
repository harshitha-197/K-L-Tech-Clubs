<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.sql.*, java.util.Date, java.sql.*, java.io.*" %>
<%      //Date d = new Date();
        //int year = 1900+d.getYear();
        String name = request.getParameter("name");
        try {
          String Classname = "oracle.jdbc.driver.OracleDriver";
	      String url = "jdbc:oracle:thin:@localhost:1521:XE";
	      String username = "ep";
	      String password = "ep";
        	Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement techdetails = con.prepareStatement("select img,id from hobbyclubs where name=?");
            techdetails.setString(1, name);
            ResultSet techSet = techdetails.executeQuery();
            Blob image = null;
            byte[] imgData = null;
            String n,t;
            if(techSet.next()) {
              image = techSet.getBlob(1);
              imgData = image.getBytes(1,(int)image.length());
                response.setContentType("image/jpg");
                OutputStream o = response.getOutputStream();
                o.write(imgData);
                o.flush();
                o.close();
              }
              else 
	        {
            	  con.close();
	        return;
	        }
           }
           catch(Exception e) {
           }
%>