package am.aca.shop.service;

import am.aca.shop.domain.dto.ProductDto;
import am.aca.shop.domain.entity.Product;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class CategoryService {

    private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    public List<ProductDto> getProducts(int cid,int page,int itemPerPage){
        Session session = sessionFactory.openSession();
        //TODO replace with ORM
        SQLQuery sqlQuery = session.createSQLQuery("SELECT p.*,d.name,d.description " +
                "from products as p INNER JOIN product_descriptions as d " +
                "on (p.id = d.product_id) where d.lang_id=:lang_id and p.category_id=:cid LIMIT :page,:item_per_page");
        sqlQuery.setParameter("lang_id",1);
        sqlQuery.setParameter("cid",cid);
        sqlQuery.setParameter("page",(page-1)*itemPerPage);
        sqlQuery.setParameter("item_per_page",itemPerPage);
        List<Object[]> list = sqlQuery.list();
        List<ProductDto> productDtos = new ArrayList<ProductDto>();
        for (Object[] row : list) {
            productDtos.add(new ProductDto((Integer)row[0],Double.toString((Double)row[1]) ,(String) row[5]));
        }
        session.close();
        return productDtos;
    }
    public Number getCountOf(int cid){
        Session session = sessionFactory.openSession();
        SQLQuery sqlQuery = session
                .createSQLQuery("SELECT count(*) as count FROM `products` WHERE category_id=:cid");
        sqlQuery.setParameter("cid",cid);
        Number number = (Number)sqlQuery.uniqueResult();
        session.close();
        return number;
    }
}
