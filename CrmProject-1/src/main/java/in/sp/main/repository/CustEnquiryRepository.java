package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.entity.CustomerEnquiry;

public interface CustEnquiryRepository extends JpaRepository<CustomerEnquiry, Integer> {

}
