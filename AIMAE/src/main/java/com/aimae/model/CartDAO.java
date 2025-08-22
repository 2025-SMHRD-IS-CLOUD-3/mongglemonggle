package com.aimae.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.aimae.util.SqlSessionManager;

public class CartDAO {
    
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSessionFactory();
    
    // 장바구니에 상품 추가
    public int addToCart(Cart cart) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        int result = sqlSession.insert("com.aimae.mapper.cartMapper.addToCart", cart);
        sqlSession.close();
        return result;
    }
    
    // 사용자의 장바구니 목록 조회 (상품 정보 포함)
    public List<Cart> getCartList(String userId) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        List<Cart> cartList = sqlSession.selectList("com.aimae.mapper.cartMapper.getCartList", userId);
        sqlSession.close();
        return cartList;
    }
    
    // 장바구니 상품 수량 수정
    public int updateCartQuantity(Cart cart) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int result = 0;
        
        try {
            result = session.update("updateCartQuantity", cart);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
    
    // 장바구니에서 상품 삭제
    public int deleteFromCart(String cartId) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int result = 0;
        
        try {
            result = session.delete("deleteFromCart", cartId);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
        } finally {
            session.close();
        }
        
        return result;
    }
    
    // 장바구니에 이미 존재하는 상품인지 확인
    public Cart checkCartItem(String userId, String productId) {
        SqlSession session = SqlSessionManager.getSqlSession();
        Cart cart = null;
        
        try {
            Cart param = new Cart();
            param.setUSER_ID(userId);
            param.setPRODUCT_ID(productId);
            cart = session.selectOne("checkCartItem", param);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return cart;
    }
    
    // 사용자의 장바구니 총 개수 조회
    public int getCartCount(String userId) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int count = 0;
        
        try {
            count = session.selectOne("getCartCount", userId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return count;
    }
    
    // 장바구니 ID로 상품 조회
    public Cart getCartById(String cartId) {
        SqlSession session = SqlSessionManager.getSqlSession();
        Cart cart = null;
        
        try {
            cart = session.selectOne("getCartById", cartId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return cart;
    }
}
