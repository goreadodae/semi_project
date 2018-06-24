package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import product.model.dao.ProductDao;
import product.model.vo.Basket;
import product.model.vo.Buying;
import product.model.vo.Ordercall;
import product.model.vo.Product;
import product.model.vo.Review;

public class ProductService {
   //��� ��ǰ ����
   public ArrayList<Product> getAllProduct(){
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Product> list = new ProductDao().getAllProduct(conn);
      JDBCTemplate.close(conn);
      return list;
   }

   //��ǰ �� ����
   public Product getProduct(int productNo) {
      Connection conn = JDBCTemplate.getConnection();
      Product productInfo = new ProductDao().getProduct(conn,productNo);
      JDBCTemplate.close(conn);
      return productInfo;
   } 

   //�̴��� ������ ����
   public ArrayList<Product> getThisMonthProduct(){
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Product> list = new ProductDao().getThisMonthProduct(conn);
      JDBCTemplate.close(conn);
      return list;
   }

   //�α��ΰ����� ��ٱ��� ����
   public ArrayList<Basket> getMyBasket(int memberNo){
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Basket> list = new ProductDao().getMyBasket(conn, memberNo);
      JDBCTemplate.close(conn);
      return list;
   }


   //�ٷ� �����ϱ� ��ư�� �������� ��ǰ ����(���� �������� ��� ��ٱ��� ���� ������)
   public ArrayList<Basket> getLastBasket(int memberNo){
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Basket> list = new ProductDao().getLastBasket(conn, memberNo);
      JDBCTemplate.close(conn);
      return list;
   }


   //��ٱ��� ����
   public int deleteBasket(int basketNo) {
      Connection conn = JDBCTemplate.getConnection();
      int result = new ProductDao().deleteBasket(conn,basketNo);
      if(result>0)
         JDBCTemplate.commit(conn);
      else
         JDBCTemplate.rollback(conn);
      JDBCTemplate.close(conn);
      return result;
   }


   //��ٱ��� �߰�
   public int insertBasket(int basketQuantity,int memberNo,int productNo) {
      Connection conn = JDBCTemplate.getConnection();
      int result = new ProductDao().insertBasket(conn, basketQuantity, memberNo, productNo);
      if(result>0)
         JDBCTemplate.commit(conn);
      else
         JDBCTemplate.rollback(conn);
      JDBCTemplate.close(conn);
      return result;
   }

   //��ٱ��� ���� ����
   public int updateBasket(int basketQuantity, int basketNo) {
      Connection conn = JDBCTemplate.getConnection();
      int result = new ProductDao().updateBasket(conn, basketQuantity, basketNo);
      if(result>0)
         JDBCTemplate.commit(conn);
      else
         JDBCTemplate.rollback(conn);
      JDBCTemplate.close(conn);
      return result;
   }

   //1.���ų��� ���̺� �߰�
   public int insertBuying(int basketNo, int orderNo) {
      Connection conn = JDBCTemplate.getConnection();
      int result = new ProductDao().insertBuying(conn, basketNo, orderNo);
      if(result>0)
         JDBCTemplate.commit(conn);
      else
         JDBCTemplate.rollback(conn);
      JDBCTemplate.close(conn);
      return result;
   }


   //3.��ǰ�� ���� ���� ����
   public int updateProduct(int productNo, int basketQuantity) {
      Connection conn = JDBCTemplate.getConnection();
      int result = new ProductDao().updateProduct(conn, productNo, basketQuantity);
      if(result>0)
         JDBCTemplate.commit(conn);
      else
         JDBCTemplate.rollback(conn);
      JDBCTemplate.close(conn);
      return result;
   }

   //4.�����ʰ��� ��ٱ��� ��� ����
   public int deleteBasketOver(int productNo) {
      Connection conn = JDBCTemplate.getConnection();
      int result = new ProductDao().deleteBasketOver(conn, productNo);
      if(result>0)
         JDBCTemplate.commit(conn);
      else
         JDBCTemplate.rollback(conn);
      JDBCTemplate.close(conn);
      return result;
   }

   //0.�ֹ����� �߰�
   public int insertOrdercall(Ordercall oc) {
      Connection conn = JDBCTemplate.getConnection();
      int result = new ProductDao().insertOrdercall(conn, oc);
      if(result>0)
         JDBCTemplate.commit(conn);
      else
         JDBCTemplate.rollback(conn);
      JDBCTemplate.close(conn);
      return result;
   }

   //0.5 �ֹ������� �ֹ���ȣ �޾ƿ���
   public Ordercall getOrderNo(int memberNo) {
      Connection conn = JDBCTemplate.getConnection();
      Ordercall ordercall = new ProductDao().getOrderNo(conn, memberNo);
      JDBCTemplate.close(conn);
      return ordercall;
   }


   //��� ������ ���� ���� ����
   public ArrayList<Buying> selectBuyingRecent(int memberNo, int rowCount){
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Buying> list = new ProductDao().selectBuyingRecent(conn, memberNo, rowCount);
      JDBCTemplate.close(conn);
      return list;
   }

   //�α��� ������ ��ü ���ų��� ����
   public ArrayList<Buying> selectBuyingAll(int memberNo){
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Buying> list = new ProductDao().selectBuyingAll(conn, memberNo);
      JDBCTemplate.close(conn);
      return list;
   }
   
   //��ü �ֹ����� ����
   public ArrayList<Ordercall> selectOrdercallAll(int memberNo) {
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Ordercall> list = new ProductDao().selectOrdercallAll(conn, memberNo);
      JDBCTemplate.close(conn);
      return list;
   }

   //�� ���� �߰� --> ���
   public ArrayList<Review> reviewAll(int productNo) {
      Connection conn = JDBCTemplate.getConnection();
      ArrayList<Review> list = new ProductDao().noticeComment(conn,productNo);

      JDBCTemplate.close(conn);

      return list;
   }

   
}