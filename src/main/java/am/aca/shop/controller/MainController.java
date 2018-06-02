package am.aca.shop.controller;

import am.aca.shop.service.CategoryService;
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
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;


    @RequestMapping("/")
    public ModelAndView index(@RequestParam(value = "search", required = false) String searchParam) {
        ModelAndView modelAndView = new ModelAndView("home/index");
        List<CategoryDto> categoriesTree = categoryService.getCategoriesTree(0);
        if (searchParam != null && searchParam != "") {
          modelAndView.addObject("products", productService.searchProduct(searchParam));
        }
        else {
          modelAndView.addObject("products", productService.getProducts());
        }
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
