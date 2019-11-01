package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class cartDao {
	public static Connection connect() throws ClassNotFoundException, SQLException, IOException {
		Connection obj = null;
		Class.forName("com.mysql.jdbc.Driver");
		String dataUrl = "jdbc:mysql://localhost:3306/login";

		return obj = DriverManager.getConnection(dataUrl, "root", "password@123");
	}

	public static int insert(cart c) throws ClassNotFoundException, SQLException, IOException {
		Connection con = connect();
		String s="insert into cart values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(s);
		ps.setInt(1,c.getPro_id());
	    ps.setInt(2,c.getHsn_code());
	    ps.setInt(3, c.getCust_id());
	    ps.setString(4, c.getCust_name());
		ps.setString(5, c.getPro_name());
		ps.setDouble(6, c.getPrice());
		int i=ps.executeUpdate();
		return i;
		
	}
	public static List<cart> display() throws ClassNotFoundException, SQLException, IOException{
		Connection con = connect();
		List<cart> list = new ArrayList<cart>();
		PreparedStatement ps = con.prepareStatement("Select * from cart ");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			cart c=new cart();
			c.setHsn_code(rs.getInt(2));
			c.setCust_id(rs.getInt(3));
			c.setCust_name(rs.getString(4));
			c.setPro_name(rs.getString(5));
			c.setPrice(rs.getDouble(6));
			c.setPro_id(rs.getInt(1));
			list.add(c);
			
		}
		return list;
		
	}
	public static List<cart> displayCart() throws ClassNotFoundException, SQLException, IOException{
		Connection con = connect();
		List<cart> list = new ArrayList<cart>();
		PreparedStatement ps = con.prepareStatement("Select pro_id,pro_name,sum(price) from cart group by pro_id ");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			cart c=new cart();
			
			c.setPro_name(rs.getString(5));
			c.setPrice(rs.getDouble(6));
			c.setPro_id(rs.getInt(1));
			list.add(c);
			
		}
		return list;
		
	}
	public static int delete(cart c)
			throws ClassNotFoundException, SQLException, NumberFormatException, IOException {
		Connection con = connect();

		PreparedStatement ps = con.prepareStatement("delete from cart where pro_id=?");
		ps.setInt(1, c.getPro_id());
		int i = ps.executeUpdate();
		return i;
	}

}
