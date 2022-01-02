package com.example.first_project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.first_project.model.Castmates;


public interface CastmatesRepository extends JpaRepository<Castmates, Long>{

	@Query(value="select sc.* from castmates sc where programnum=?1",nativeQuery = true)
	public List<Castmates> findByprogramnum(Long programnum);
}
