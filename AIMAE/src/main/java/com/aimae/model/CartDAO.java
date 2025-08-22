package com.aimae.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.aimae.util.SqlSessionManager;

public class CartDAO {
	 SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSessionFactory();
	    
	    
	    
	    // 장바구니에 상품 추가
	    public int addCart(Cart cart) {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        int result = sqlSession.insert("com.aimae.mapper.CartMapper.addCart", cart);
	        sqlSession.close();
	        return result;
	    }
	    
	        // 사용자의 장바구니 목록 조회 (상품 정보 포함)
    public List<Cart> cartList(String userNum) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        List<Cart> cartList = sqlSession.selectList("com.aimae.mapper.CartMapper.cartList", userNum);
        sqlSession.close();
        return cartList;
    }
	    
	    // 장바구니에서 상품 삭제
	    public int deleteCart(String cartId) {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        int result = sqlSession.delete("com.aimae.mapper.CartMapper.deleteCart", cartId);
	        sqlSession.close();
	        return result;
	    }
	    
	    // 장바구니 상품 수정 (주소)
	    public int updateCart(Cart cart) {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        int result = sqlSession.update("com.aimae.mapper.CartMapper.updateCart", cart);
	        sqlSession.close();
	        return result;
	    }
	    
	        // 사용자의 장바구니 총 개수 조회
    public int cartCount(String userNum) {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        int count = sqlSession.selectOne("com.aimae.mapper.CartMapper.cartCount", userNum);
        sqlSession.close();
        return count;
    }
	    	

}