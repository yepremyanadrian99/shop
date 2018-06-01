package am.aca.shop.domain.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "price")
    private double price;
    @Column(name = "user_id")
    private int userId;
    @Column(name = "category_id")
    private int categoryId;
    @Column(name = "status")
    private int status;
    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private List<ProductDescription> productDescription;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public List<ProductDescription> getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(List<ProductDescription> productDescription) {
        this.productDescription = productDescription;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


}