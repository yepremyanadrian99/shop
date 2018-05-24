package am.aca.shop.service;

import am.aca.shop.domain.Product;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class ProductService {

    public List<Product> getProducts(){
        return Arrays.asList(
                new Product("Product 1", 1000),
                new Product("Product 2", 2000),
                new Product("Product 3", 3000)
        );
    }

}
