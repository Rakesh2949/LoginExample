package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class loginDao {
	public static Connection connect() throws ClassNotFoundException, SQLException, IOException {
		Connection obj = null;
		Class.forName("com.mysql.jdbc.Driver");
		String dataUrl = "jdbc:mysql://localhost:3306/login";

		return obj = DriverManager.getConnection(dataUrl, "root", "password@123");
	}
	public static boolean  validate(String cust_name,String password) throws ClassNotFoundException, SQLException, IOException {
		
        boolean status=false;
		Connection con = connect();
		PreparedStatement ps = con.prepareStatement("Select *from customer where cust_name=? and password=?");
		ps.setString(1,cust_name );
		ps.setString(2, password);
		
		ResultSet rs=ps.executeQuery();
		status=rs.next();
		
		return status;
		
	}

}
