package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DBConnection;
import dto.TransDTO;

public class TransDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String SELECT_TRANSACTIONS = "select S.register_id as register_id, category, item_name, user_id, buy_id, price, sale_price, inDate, trans_date, isSale "
												+ "from trans_tbl as T inner join sale_tbl as S on T.register_id = S.register_id "
												+ "inner join gifticon_tbl G inner join on S.item_id = G.item_id;";
	private final String SELECT_SALES = "select register_id, user_id, item_name, brand, category, price, sale_price, avail_date, inDate from sale_tbl as S inner join gifticon_tbl as G on S.item_id = G.item_id;";
	private final String SELECT_SOLDOUT = "select S.register_id as register_id, category, item_name, user_id, buy_id, price, sale_price, inDate, trans_date, isSale "
			+ "from trans_tbl as T inner join sale_tbl as S on T.register_id = S.register_id "
			+ "inner join gifticon_tbl G inner join on S.item_id = G.item_id where isSale = true;";
	private final String SELECT_SALE_ITEM = "select register_id, user_id, price, sale_price, avail_date, inDate from gifticon_tbl as G inner join Sale_tbl as S on G.item_id = S.item_id where isSale = false and item_id = ?";
	private final String DELETE_TRANSACTIONS = "delete from trans_tbl where register_id = ?";
	private final String DELETE_SALE = "delete from sale_tbl where register_id = ?";
	
	//전체 거래 내역에서는 거래번호 대신 등록번호 받아오기
	public List<TransDTO> findAll(){
		List<TransDTO> transactions = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_TRANSACTIONS);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TransDTO dto = new TransDTO();
				dto.setRegisterId(rs.getInt("register_id"));
				dto.setCategory(rs.getString("category"));
				dto.setItemName(rs.getString("item_name"));
				dto.setSellId(rs.getString("user_id"));
				dto.setBuyId(rs.getString("buy_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setSalePrice(rs.getInt("sale_price"));
				dto.setInDate(rs.getDate("inDate"));
				dto.setTransDate(rs.getDate("trans_date"));
				dto.setSale(rs.getBoolean("isSale"));
				
				transactions.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		
		return transactions;
	}
	
	public List<TransDTO> findForSale(){
		List<TransDTO> transactions = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_SALES);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TransDTO dto = new TransDTO();
				dto.setRegisterId(rs.getInt("register_id"));
				dto.setSellId(rs.getString("user_id"));
				dto.setItemName(rs.getString("item_name"));
				dto.setBrand(rs.getString("brand"));
				dto.setCategory(rs.getString("category"));
				int price = rs.getInt("price");
				int salePrice = rs.getInt("sale_price");
				dto.setPrice(price);
				dto.setSalePrice(salePrice);
				dto.setAvailDate(rs.getDate("avail_date"));
				dto.setInDate(rs.getDate("inDate"));
				double discount = Math.round((double)salePrice/price * 10000) / 100.0;
				dto.setDiscount(discount);
				
				transactions.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		
		return transactions;
	}
	public List<TransDTO> findSoldOut(){
		List<TransDTO> transactions = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_SOLDOUT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TransDTO dto = new TransDTO();
				dto.setRegisterId(rs.getInt("register_id"));
				dto.setCategory(rs.getString("category"));
				dto.setItemName(rs.getString("item_name"));
				dto.setSellId(rs.getString("user_id"));
				dto.setBuyId(rs.getString("buy_id"));
				dto.setPrice(rs.getInt("price"));
				dto.setSalePrice(rs.getInt("sale_price"));
				dto.setInDate(rs.getDate("inDate"));
				dto.setTransDate(rs.getDate("trans_date"));
				dto.setSale(rs.getBoolean("isSale"));
				
				transactions.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		
		return transactions;
	}
	public List<TransDTO> findSaleItem(int itemId){
		List<TransDTO> transactions = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_SALE_ITEM);
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TransDTO dto = new TransDTO();
				dto.setRegisterId(rs.getInt("register_id"));
				dto.setSellId(rs.getString("user_id"));
				int price = rs.getInt("price");
				int salePrice = rs.getInt("sale_price");
				dto.setPrice(price);
				dto.setSalePrice(salePrice);
				dto.setAvailDate(rs.getDate("avail_date"));
				dto.setInDate(rs.getDate("inDate"));
				double discount = Math.round((double)salePrice/price * 10000) / 100.0;
				dto.setDiscount(discount);
				
				transactions.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		
		return transactions;
	}
	
	//거래내역부터 지우고 판매내역 지워야 함
	public void deleteSale(int registerId) {
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(DELETE_SALE);
			pstmt.setInt(1, registerId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	
	public void deleteTrans(int registerId) {
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(DELETE_TRANSACTIONS);
			pstmt.setInt(1, registerId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	
}
