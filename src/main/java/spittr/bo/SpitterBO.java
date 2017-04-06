package spittr.bo;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spittr.model.SpitterModel;


public interface SpitterBO {
	long count();

	SpitterModel save(SpitterModel spitter);

	SpitterModel findOne(long id);

	SpitterModel findByUsername(String username);

	List<SpitterModel> findAll();
}
