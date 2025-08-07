package in.sp.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.entity.Product;
import in.sp.main.entity.SaleCourse;
import in.sp.main.repository.ProductRepository;
import in.sp.main.repository.SaleCourseRepository;

@Service
public class ProductServiceimpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SaleCourseRepository saleCourseRepository;

    // Save product (course) data
    @Override
    public boolean addProductService(Product product) {
        boolean status = false;
        try {
            productRepository.save(product);
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Get all products (used for listing)
    @Override
    public List<Product> getallproductsListService() {
        return productRepository.findAll();
    }

    // Get all course names (for dropdown)
    @Override
    public List<String> getAllCourseNameService() {
        return productRepository.findcoursename();
    }

    // Get selected course details (for dynamic price fetch)
    @Override
    public Product getSelectedCourseDetailsService(String coursename) {
        return productRepository.findByCoursename(coursename);  
    }

    // Save a sold course entry
    @Override
    public boolean addsaleCourseDetailsService(SaleCourse saleCourse) {
        boolean status = false;
        try {
            saleCourseRepository.save(saleCourse);
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

	@Override
	public List<Object[]> getcountbypurchasedcourseservice() {
		return saleCourseRepository.countBypurchaseddate();
	}
}
