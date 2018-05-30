package am.aca.shop.service;

import am.aca.shop.domain.dto.CategoryDto;
import am.aca.shop.domain.dto.ProductDto;
import am.aca.shop.domain.entity.Category;
import am.aca.shop.domain.entity.Product;
import org.hibernate.Query;
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
    public List<CategoryDto> getCategoriesTree(int startingId){
        Session session = sessionFactory.openSession();
        List<CategoryDto> categoryDtos = new ArrayList<CategoryDto>();

         getCateory(0, categoryDtos, session);

        //System.out.println(categoryDtos);
        session.close();
        return categoryDtos;
    }

    public void getCateory(int parentId,List<CategoryDto> categoryDtos,Session session){
        List<Category> list1 = session.createQuery("SELECT c FROM Category c  WHERE c.parentId =:id")
                .setParameter("id",parentId)
                .list();
        for (Category category :list1){
            categoryDtos.add(new CategoryDto(category.getId(),category.getCategoryDescriptions().get(0).getName()));
        }
        for (CategoryDto categoryDto :categoryDtos){
            categoryDto.setSubcategories(new ArrayList<CategoryDto>());

            getCateory(categoryDto.getId(),categoryDto.getSubcategories(),session);
        }
    }
}
