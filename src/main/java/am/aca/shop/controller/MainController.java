package am.aca.shop.controller;

import am.aca.shop.domain.dto.CategoryDto;
import am.aca.shop.service.CategoryService;
import am.aca.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private  ProductService productService;
    @Autowired
    private CategoryService categoryService;


//    public MainController(ProductService productService) {
//        this.productService = productService;
//    }

    @RequestMapping("/")
    public ModelAndView index() {
        List<CategoryDto> categoriesTree = categoryService.getCategoriesTree(0);

        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("products", productService.getProducts());
        modelAndView.addObject("categories", categoriesTree);
        return modelAndView;
    }

    @RequestMapping("/product")
    public ModelAndView product(@RequestParam(value = "id") int id) {
        ModelAndView modelAndView = new ModelAndView("product");
        modelAndView.addObject("product", productService.getProductById(id));
        return modelAndView;
    }
}
