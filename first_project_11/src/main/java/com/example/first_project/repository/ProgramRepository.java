package com.example.first_project.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.first_project.model.Program;

public interface ProgramRepository extends JpaRepository<Program, Long>{
	
	@Query(value="select p.*, avg(r.starrating) from program p LEFT OUTER JOIN reply r ON r.bnum = p.programnum  where p.category=?1 group by p.programnum order by AVG(r.starrating) desc", nativeQuery = true)
	List<Program> findByCategory(String category);
	
	
}
