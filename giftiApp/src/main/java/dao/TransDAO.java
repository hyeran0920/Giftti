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
	
	private final String SELECT_TRANS = "select S.register_id, trans_num, category, item_name, user_id, buy_id, trans_date, S.item_id as item_id "
	         + " from trans_tbl as T join sale_tbl as S on S.register_id = T.register_id"
	         + " inner join gifticon_tbl as G on G.item_id =S.item_id order by trans_date desc";
	private final String SELECT_TRANS_FIVE = "select S.register_id, trans_num, category, item_name, user_id, buy_id, trans_date, S.item_id as item_id "
	         + " from trans_tbl as T join sale_tbl as S on S.register_id = T.register_id"
	         + " inner join gifticon_tbl as G on G.item_id =S.item_id ORDER BY register_id desc limit 5";
	
	private final String SELECT_SALES = "select register_id, user_id, item_name, brand, category, price, sale_price, avail_date, inDate, isSale, G.item_id from sale_tbl as S inner join gifticon_tbl as G on S.item_id = G.item_id;";
	private final String SELECT_SALES_AVAIL = "select register_id, user_id, item_name, brand, category, price, sale_price, avail_date, inDate, isSale, G.item_id from sale_tbl as S inner join gifticon_tbl as G on S.item_id = G.item_id where isSale='Available';";
	private final String SELECT_SALES_AVAIL_FIVE = "select register_id, user_id, item_name, brand, category, price, sale_price, avail_date, inDate, isSale, G.item_id from sale_tbl as S inner join gifticon_tbl as G on S.item_id = G.item_id where isSale='Available' LIMIT 5;";
	private final String SELECT_SALES_SOLD = "select register_id, user_id, item_name, brand, category, price, sale_price, avail_date, inDate, isSale, G.item_id from sale_tbl as S inner join gifticon_tbl as G on S.item_id = G.item_id where isSale='Sold';";
	
	private final String SELECT_SALE_ITEM = "select register_id, user_id, price, sale_price, avail_date, inDate from gifticon_tbl as G inner join Sale_tbl as S on G.item_id = S.item_id where isSale = 'Available' and S.item_id = ?";
	private final String SELECT_SALE_INFO = "select register_id, user_id, price, sale_price, avail_date, inDate from gifticon_tbl as G inner join Sale_tbl as S on G.item_id = S.item_id where register_id = ?";
	private final String DELETE_SALE = "delete from sale_tbl where register_id = ?";
	
	//전체 거래 내역에서는 거래번호 대신 등록번호 받아오기
	public List<TransDTO> findTrans(){
		List<TransDTO> allTransactions = new ArrayList<>();
	      
	    try {
	    	con = DBConnection.getConnection();
	        pstmt = con.prepareStatement(SELECT_TRANS);
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	            TransDTO dto = new TransDTO();
	            dto.setRegisterId(rs.getInt("register_id"));
	            dto.setTransNum(rs.getInt("trans_num"));
	            dto.setCategory(rs.getString("category"));
	            dto.setItemName(rs.getString("item_name"));
	            dto.setUserId(rs.getString("user_id"));
	            dto.setBuyId(rs.getString("buy_id"));
	            dto.setTransDate(rs.getDate("trans_date"));
	            dto.setItemId(rs.getInt("item_id"));
	            
	            //dto.setIsSale(rs.getString("issale"));
	            allTransactions.add(dto);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBConnection.close(rs, pstmt, con);
	      }
	      
	      return allTransactions;
	   }
	public List<TransDTO> findTransFive(){
		List<TransDTO> allTransactions = new ArrayList<>();
	      
	    try {
	    	con = DBConnection.getConnection();
	        pstmt = con.prepareStatement(SELECT_TRANS_FIVE);
	        rs = pstmt.executeQuery();
	         
	        while(rs.next()) {
	            TransDTO dto = new TransDTO();
	            dto.setRegisterId(rs.getInt("register_id"));
	            dto.setTransNum(rs.getInt("trans_num"));
	            dto.setCategory(rs.getString("category"));
	            dto.setItemName(rs.getString("item_name"));
	            dto.setUserId(rs.getString("user_id"));
	            dto.setBuyId(rs.getString("buy_id"));
	            dto.setTransDate(rs.getDate("trans_date"));
	            dto.setItemId(rs.getInt("item_id"));
	            
	            //dto.setIsSale(rs.getString("issale"));
	            allTransactions.add(dto);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBConnection.close(rs, pstmt, con);
	      }
	      
	      return allTransactions;
	   }
	   
	   //전체 판매 내역
	   public List<TransDTO> findSale(){
	      List<TransDTO> transactions = new ArrayList<>();
	      
	      try {
	         con = DBConnection.getConnection();
	         pstmt = con.prepareStatement(SELECT_SALES);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            TransDTO dto = new TransDTO();
	            dto.setRegisterId(rs.getInt("register_id"));
	            dto.setUserId(rs.getString("user_id"));
	            dto.setItemName(rs.getString("item_name"));
	            dto.setBrand(rs.getString("brand"));
	            dto.setCategory(rs.getString("category"));
	            int price = rs.getInt("price");
	            int salePrice = rs.getInt("sale_price");
	            dto.setSalePrice(salePrice);
	            dto.setAvailDate(rs.getDate("avail_date"));
	            dto.setInDate(rs.getDate("inDate"));
	            dto.setIsSale(rs.getString("isSale"));
	            dto.setItemId(rs.getInt("item_id"));
	            double discount = Math.round((double)(price-salePrice)/price * 10000) / 10000.0;
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
	   
	   public List<TransDTO> findSaleAvail(){
		      List<TransDTO> transactions = new ArrayList<>();
		      
		      try {
		         con = DBConnection.getConnection();
		         pstmt = con.prepareStatement(SELECT_SALES_AVAIL);
		         rs = pstmt.executeQuery();
		         while(rs.next()) {
		            TransDTO dto = new TransDTO();
		            dto.setRegisterId(rs.getInt("register_id"));
		            dto.setUserId(rs.getString("user_id"));
		            dto.setItemName(rs.getString("item_name"));
		            dto.setBrand(rs.getString("brand"));
		            dto.setCategory(rs.getString("category"));
		            int price = rs.getInt("price");
		            int salePrice = rs.getInt("sale_price");
		            dto.setSalePrice(salePrice);
		            dto.setAvailDate(rs.getDate("avail_date"));
		            dto.setInDate(rs.getDate("inDate"));
		            dto.setIsSale(rs.getString("isSale"));
		            dto.setItemId(rs.getInt("item_id"));
		            double discount = Math.round((double)(price-salePrice)/price * 10000) / 10000.0;
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
	   public List<TransDTO> findSaleAvailFive(){
		      List<TransDTO> transactions = new ArrayList<>();
		      
		      try {
		         con = DBConnection.getConnection();
		         pstmt = con.prepareStatement(SELECT_SALES_AVAIL_FIVE);
		         rs = pstmt.executeQuery();
		         while(rs.next()) {
		            TransDTO dto = new TransDTO();
		            dto.setRegisterId(rs.getInt("register_id"));
		            dto.setUserId(rs.getString("user_id"));
		            dto.setItemName(rs.getString("item_name"));
		            dto.setBrand(rs.getString("brand"));
		            dto.setCategory(rs.getString("category"));
		            int price = rs.getInt("price");
		            int salePrice = rs.getInt("sale_price");
		            dto.setSalePrice(salePrice);
		            dto.setAvailDate(rs.getDate("avail_date"));
		            dto.setInDate(rs.getDate("inDate"));
		            dto.setIsSale(rs.getString("isSale"));
		            dto.setItemId(rs.getInt("item_id"));
		            double discount = Math.round((double)(price-salePrice)/price * 10000) / 10000.0;
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
	   public List<TransDTO> findSaleSold(){
		      List<TransDTO> transactions = new ArrayList<>();
		      
		      try {
		         con = DBConnection.getConnection();
		         pstmt = con.prepareStatement(SELECT_SALES_SOLD);
		         rs = pstmt.executeQuery();
		         while(rs.next()) {
		            TransDTO dto = new TransDTO();
		            dto.setRegisterId(rs.getInt("register_id"));
		            dto.setUserId(rs.getString("user_id"));
		            dto.setItemName(rs.getString("item_name"));
		            dto.setBrand(rs.getString("brand"));
		            dto.setCategory(rs.getString("category"));
		            int price = rs.getInt("price");
		            int salePrice = rs.getInt("sale_price");
		            dto.setSalePrice(salePrice);
		            dto.setAvailDate(rs.getDate("avail_date"));
		            dto.setInDate(rs.getDate("inDate"));
		            dto.setIsSale(rs.getString("isSale"));
		            dto.setItemId(rs.getInt("item_id"));
		            double discount = Math.round((double)(price-salePrice)/price * 10000) / 10000.0;
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



	
	   //특정 상품 판매중 내역
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
					dto.setUserId(rs.getString("user_id"));
					int price = rs.getInt("price");
					int salePrice = rs.getInt("sale_price");
					dto.setSalePrice(salePrice);
					dto.setAvailDate(rs.getDate("avail_date"));
					dto.setInDate(rs.getDate("inDate"));
					double discount = Math.round((double)(price-salePrice)/price * 10000) / 10000.0;
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
		//특정 상품 판매중 상세 내역
		public TransDTO findSaleInfo(int registerId){
			TransDTO saleProduct = new TransDTO();
			
			try {
				con = DBConnection.getConnection();
				pstmt = con.prepareStatement(SELECT_SALE_INFO);
				pstmt.setInt(1, registerId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					saleProduct.setRegisterId(rs.getInt("register_id"));
					saleProduct.setUserId(rs.getString("user_id"));
					int price = rs.getInt("price");
					int salePrice = rs.getInt("sale_price");
					saleProduct.setSalePrice(salePrice);
					saleProduct.setAvailDate(rs.getDate("avail_date"));
					saleProduct.setInDate(rs.getDate("inDate"));
					double discount = Math.round((double)(price - salePrice)/price * 10000) / 10000.0;
					saleProduct.setDiscount(discount);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(rs, pstmt, con);
			}
			
			return saleProduct;
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
		
		public int getItemId(int registerId) {
			int itemId = 0;
			try {
				con = DBConnection.getConnection();
				pstmt = con.prepareStatement("select item_id from sale_tbl where register_id=?");
				pstmt.setInt(1, registerId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					itemId = rs.getInt("item_id");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(rs, pstmt, con);
			}
			
			return itemId;
		}

	
}
