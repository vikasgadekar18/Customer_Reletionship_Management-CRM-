package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.entity.CustomerEnquiry;
import java.util.List;


public interface CustEnquiryRepository extends JpaRepository<CustomerEnquiry, Integer> {
  boolean existsByPhoneno(String phoneno);
  List<CustomerEnquiry> findAllByPhoneno(String phoneno);
}
