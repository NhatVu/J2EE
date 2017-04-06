package spittr.dao;

import java.util.List;

import spittr.model.SpitterModel;

/**
 * Repository interface with operations for {@link SpitterModel} persistence.
 * @author habuma
 */
public interface SpitterDAO {

  long count();

  SpitterModel save(SpitterModel spitter);

  SpitterModel findOne(long id);

  SpitterModel findByUsername(String username);

  List<SpitterModel> findAll();

}
