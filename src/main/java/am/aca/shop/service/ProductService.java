package am.aca.shop.service;

import am.aca.shop.domain.dto.ProductDto;
import am.aca.shop.domain.entity.Product;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {

    private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();


    public Product getProductById(long id) {
        Session session = sessionFactory.openSession();
        return (Product) session.createSQLQuery("SELECT * FROM products WHERE id=:productId")
                .setParameter("productId", id)
                .list().get(0);
    }

    private List<Object[]> getObjects() {
        return getObjects("");
    }

    private List<Object[]> getObjects(String whereClause) {
        Session session = sessionFactory.openSession();
        SQLQuery sqlQuery = session.createSQLQuery("SELECT p.*, d.name, d.description, d.lang_id " +
                "FROM products AS p INNER JOIN product_descriptions AS d " +
                "ON (p.id = d.product_id) " + whereClause);
        List<Object[]> list = sqlQuery.list();
        session.close();
        return list;
    }

    public List<ProductDto> getProductDtos() {
        return toProductDtoList(getObjects());
    }

    public List<ProductDto> getProductDtos(String whereClause) {
        return toProductDtoList(getObjects(whereClause));
    }

    public List<Product> getProducts() {
        return toProductList(getObjects());
    }

    public List<Product> getProducts(String whereClause) {
        return toProductList(getObjects(whereClause));
    }

    public List<ProductDto> searchProduct(String searchParam) {
        return toProductDtoList(getObjects(" WHERE instr(d.name, '" + searchParam + "') > 0 " +
                "OR instr(d.description, '" + searchParam + "') > 0"));
    }

    private List<ProductDto> toProductDtoList(List<Object[]> list) {
        List<ProductDto> productDtoList = new ArrayList<ProductDto>();
        for (Object[] o : list) {
            ProductDto productDto = new ProductDto();
            productDto.setId((Integer) o[0]);
            productDto.setName((String) o[5]);
            productDto.setPrice((Double) o[1]);
            productDtoList.add(productDto);
        }
        return productDtoList;
    }

    private List<Product> toProductList(List<Object[]> list) {
        List<Product> productList = new ArrayList<Product>();
        for (Object[] o : list) {
            Product product = new Product();
            product.setId((Integer) o[0]);
            product.setPrice((Double) o[1]);
            product.setUserId((Integer) o[2]);
            product.setCategoryId((Integer) o[3]);
            product.setStatus((Integer) o[4]);
            productList.add(product);
        }
        return productList;
    }
}
