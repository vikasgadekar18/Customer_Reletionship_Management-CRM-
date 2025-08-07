package in.sp.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.entity.CustFollowup;

public interface CustfollowRepository extends JpaRepository<CustFollowup, Integer> {
	
   CustFollowup findByPhoneno(String phoneno);
   List<CustFollowup> findByFollowupdate(String followupdate);
   
   
}
