package am.aca.shop.service;

import am.aca.shop.domain.Product;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class ProductService {

    private List<Product> productList = Arrays.asList(
            new Product(1, "Product 1", 1000),
            new Product(2, "Product 2", 2000),
            new Product(3, "Product 3", 3000)
    );

    public List<Product> getProducts() {
        return productList;
    }

    public Product getProductById(int id) {
        for (Product p : productList) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }
}
