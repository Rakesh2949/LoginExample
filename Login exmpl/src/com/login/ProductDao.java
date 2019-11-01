package com.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

public class ProductDao {

	public static Connection connect() throws ClassNotFoundException, SQLException, IOException {
		Connection obj = null;
		Class.forName("com.mysql.jdbc.Driver");
		String dataUrl = "jdbc:mysql://localhost:3306/login";

		return obj = DriverManager.getConnection(dataUrl, "root", "password@123");
	}

	public static int insert(Product p)
			throws ClassNotFoundException, SQLException, NumberFormatException, IOException {

		Connection con = connect();

		String s = "insert into tvr values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(s);
		ps.setInt(1, p.getHsn_code());
		ps.setString(2, p.getName());
		ps.setDouble(3, p.getStock_left());
		ps.setDouble(4, p.getStock_sold());
		ps.setDouble(5, p.getPrice());

		int i = ps.executeUpdate();
		return i;

	}

	public static int delete(Product p)
			throws ClassNotFoundException, SQLException, NumberFormatException, IOException {
		Connection con = connect();

		PreparedStatement ps = con.prepareStatement("delete from tvr where hsn_code=?");
		ps.setInt(1, p.getHsn_code());
		int i = ps.executeUpdate();
		return i;
	}

	public static List<Product> display() throws ClassNotFoundException, SQLException, IOException {
		Connection con = connect();
		List<Product> list = new ArrayList<Product>();

		PreparedStatement ps = con.prepareStatement("Select *from tvr ");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product p = new Product();
			p.setHsn_code(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setStock_left(rs.getDouble(3));
			p.setStock_sold(rs.getDouble(4));
			p.setPrice(rs.getDouble(5));
			list.add(p);
		}
		ps.close();
		con.close();

		return list;
	}

	public static int update(Product p)
			throws ClassNotFoundException, SQLException, NumberFormatException, IOException {
		int rt=0;
		try {
		Connection con = connect();

		
		PreparedStatement ps = con.prepareStatement("update tvr set name=?,stock_left=?,stock_sold=?,price=? where hsn_code=?");
		ps.setString(1, p.getName());
		ps.setDouble(2, p.getStock_left());
		ps.setDouble(3, p.getStock_sold());
		ps.setDouble(4, p.getPrice());
		ps.setInt(5, p.getHsn_code());

		 rt = ps.executeUpdate();

		
		}catch(Exception e) {
			System.out.println(e);
		}
		return rt;	
	}

	public static Product getProductById(int id) throws SQLException, ClassNotFoundException, IOException
	{
		Connection con = connect();
		Product p = new Product();
		PreparedStatement ps=con.prepareStatement("select * from tvr where hsn_code=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		
			p.setHsn_code(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setStock_left(rs.getDouble(3));
			p.setStock_sold(rs.getDouble(4));
			p.setPrice(rs.getDouble(5));
		}
		return p;
		
		
	}
}
