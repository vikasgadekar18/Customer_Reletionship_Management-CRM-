package in.sp.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.sp.main.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    // 1. Custom JPQL to get only course names
    @Query("SELECT p.coursename FROM Product p")
    List<String> findcoursename();

    // 2. Auto-implemented by Spring Data JPA: find by course name
    Product findByCoursename(String coursename);
    
}
