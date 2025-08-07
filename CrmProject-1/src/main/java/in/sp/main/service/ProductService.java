package in.sp.main.service;

import java.util.List;

import in.sp.main.entity.Product;
import in.sp.main.entity.SaleCourse;

public interface ProductService {

    // Save a new product (course)
    public boolean addProductService(Product product);

    // Get all products
    public List<Product> getallproductsListService();

    // Get all unique course names (for dropdown)
    public List<String> getAllCourseNameService();

    // Get a selected course's details by name (used in /getCoursePrices)
    public Product getSelectedCourseDetailsService(String coursename);

    // Save a course sale entry
    public boolean addsaleCourseDetailsService(SaleCourse saleCourse);
    public List<Object[]> getcountbypurchasedcourseservice();
}
