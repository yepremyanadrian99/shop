package am.aca.shop.domain.entity;

import am.aca.shop.service.ProductService;

import javax.persistence.*;

@Entity
@Table(name = "product_descriptions")
public class ProductDescription {
    @Id
    private int id;
    @Column(name = "product_id", insertable = false, updatable = false)
    private int productId;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "lang_id")
    private int langId;
    @ManyToOne
    private Product product;

    public ProductDescription() {
        product = new ProductService().getProductById(productId);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getLangId() {
        return langId;
    }

    public void setLangId(int langId) {
        this.langId = langId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        description = description;
    }

    public long getLang_id() {
        return langId;
    }

    public void setLang_id(int langId) {
        this.langId = langId;
    }

}
