package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.entity.Product;

public interface ProductRepository extends JpaRepository<Product,Integer>{
	
	

}
