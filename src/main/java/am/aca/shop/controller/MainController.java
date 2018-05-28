package am.aca.shop.controller;

import am.aca.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private  ProductService productService;


//    public MainController(ProductService productService) {
//        this.productService = productService;
//    }

    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("products", productService.getProducts());
        return modelAndView;
    }

    @RequestMapping("/product")
    public ModelAndView product(@RequestParam(value = "id") int id) {
        ModelAndView modelAndView = new ModelAndView("product");
        modelAndView.addObject("product", productService.getProductById(id));
        return modelAndView;
    }
}
