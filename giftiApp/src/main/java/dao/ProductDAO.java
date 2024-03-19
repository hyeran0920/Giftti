package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DBConnection;
import dto.ProductDTO;

public class ProductDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String SELECT_PRODUCTS = "select item_id, item_name, price, brand, category, (select count(*) from sale_tbl as S where S.item_id = G.item_id and isSale ='Available') as count from gifticon_tbl as G order by item_id;";
	private final String INSERT_PRODUCT = "insert into gifticon_tbl(item_name, price,brand,category,image) values(?,?,?,?,?);";
	private final String SELECT_PRODUCT = "select item_id, item_name, price, category, brand, image from gifticon_tbl where item_id = ?;";
	private final String UPDATE_PRODUCT = "update gifticon_tbl set item_name=?, price =?, brand=?, category=?, image=? where item_id=?;";
	private final String GET_CATEGORY = "select distinct category from gifticon_tbl";
	private final String DELETE_PRODUCT = "delete from gifticon_tbl where item_id=?;";
	private final String GET_CURRENT_ITEMID = "select max(item_id)+1 as current_itemId from gifticon_tbl;";
	private final String SELECT_PRODUCT_TRANS = "select item_id, item_name, price,brand , category, image from gifticon_tbl where item_name = ?;";
	private final String SELECT_PRODUCTS_CATEGORY = "select item_id, item_name, price, brand, category, (select count(*) from sale_tbl as S where S.item_id = G.item_id and isSale ='Available') as count from gifticon_tbl as G where category= ? order by item_id;";

	
	public void insert(ProductDTO product) {
		try {
			con = DBConnection.getConnection();
			
			pstmt = con.prepareStatement(INSERT_PRODUCT);
			pstmt.setString(1, product.getItemName());
			pstmt.setInt(2, product.getPrice());
			pstmt.setString(3, product.getBrand());
			pstmt.setString(4, product.getCategory());
			pstmt.setString(5, product.getImage());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
	}
	
	public List<ProductDTO> findAll() {
		List<ProductDTO> products = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_PRODUCTS);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product = new ProductDTO();
				product.setItemId(rs.getInt("item_id"));
				product.setItemName(rs.getString("item_name"));
				product.setPrice(rs.getInt("price"));
				product.setBrand(rs.getString("brand"));
				product.setCategory(rs.getString("category"));
				product.setCount(rs.getInt("count"));
				products.add(product);
;			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		return products;
	}
	
	public ProductDTO find(int itemId) {
		ProductDTO product = null;
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(SELECT_PRODUCT);
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductDTO();
				product.setItemId(rs.getInt("item_id"));
				product.setItemName(rs.getString("item_name"));
				product.setPrice(rs.getInt("price"));
				product.setBrand(rs.getString("brand"));
				product.setCategory(rs.getString("category"));
				product.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		return product;
	}
	public String Update(ProductDTO product) {
		String message = "업데이트를 실패하였습니다.";
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(UPDATE_PRODUCT);
			pstmt.setString(1, product.getItemName());
			pstmt.setInt(2,product.getPrice());
			pstmt.setString(3, product.getBrand());
			pstmt.setString(4, product.getCategory());
			pstmt.setString(5, product.getImage());
			pstmt.setInt(6, product.getItemId());
			int success = pstmt.executeUpdate();
			
			
			if(success > 0) {
				message = "업데이트를 성공하였습니다!";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		return message;
	}
	
	public List<String> getCategory(){
		List<String> categories = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(GET_CATEGORY);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				categories.add(rs.getString("category"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		return categories;
	}
	
	public String delete(int itemId) {
		String message = "삭제를 실패하였습니다.";
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(DELETE_PRODUCT);
			pstmt.setInt(1, itemId);
			
			int success = pstmt.executeUpdate();
			
			if(success > 0) {
				message = "삭제를 성공하였습니다!";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		
		return message;
		
	}
	
	public int getCurrentItemId() {
		int currentItemId = 1;
		try {
			con = DBConnection.getConnection();
			pstmt = con.prepareStatement(GET_CURRENT_ITEMID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				currentItemId = rs.getInt("current_itemId");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, pstmt, con);
		}
		return currentItemId;
	}
	public ProductDTO transfind(String itemName) {
	      ProductDTO product = null;
	      try {
	         con = DBConnection.getConnection();
	         pstmt = con.prepareStatement(SELECT_PRODUCT_TRANS);
	         pstmt.setString(1, itemName);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            product = new ProductDTO();
	            product.setItemId(rs.getInt("item_id"));
	            product.setItemName(rs.getString("item_name"));
	            product.setPrice(rs.getInt("price"));
	            product.setBrand(rs.getString("brand"));
	            product.setCategory(rs.getString("category"));
	            product.setCount(rs.getInt("count"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBConnection.close(rs, pstmt, con);
	      }
	      return product;
	   }
	   // 카테고리로 목록 불러오기
	   public List<ProductDTO> findCategoryAll(String category) {
	      List<ProductDTO> products = new ArrayList<>();
	      
	      try {
	         con = DBConnection.getConnection();
	         pstmt = con.prepareStatement(SELECT_PRODUCTS_CATEGORY);
	         pstmt.setString(1,category);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            ProductDTO product = new ProductDTO();
	            product.setItemId(rs.getInt("item_id"));
	            product.setItemName(rs.getString("item_name"));
	            product.setPrice(rs.getInt("price"));
	            product.setBrand(rs.getString("brand"));
	            product.setCategory(rs.getString("category"));
	            product.setCount(rs.getInt("count"));
	            products.add(product);
	;         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBConnection.close(rs, pstmt, con);
	      }
	      return products;
	   }
}
