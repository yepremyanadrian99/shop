package am.aca.shop.service;

import am.aca.shop.domain.dto.ProductDto;
import am.aca.shop.domain.entity.Product;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class ProductService {

    private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    private List<ProductDto> productList = Arrays.asList(
            new ProductDto(1, "1000","1000"),
            new ProductDto(2, "Product 2", "2000"),
            new ProductDto(3, "Product 3", "3000")
    );

    public List<ProductDto> getProducts() {
        getProducts(1,1);
        return productList;
    }
    public List<Product> getProducts(int from,int to){
        Session session = sessionFactory.openSession();
        //TODO replace with ORM
        SQLQuery sqlQuery = session.createSQLQuery("SELECT p.*,d.name,d.description " +
                "from products as p INNER JOIN product_descriptions as d " +
                "on (p.id = d.product_id) where d.lang_id=:lid");
        sqlQuery.setParameter("lid",1);
        List list = sqlQuery.list();

        session.close();
        return list;
    }
    public ProductDto getProductById(int id) {
        for (ProductDto p : productList) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }
}
