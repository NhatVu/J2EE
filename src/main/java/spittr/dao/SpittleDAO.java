package spittr.dao;

import java.util.List;

import spittr.model.SpittleModel;

/**
 * Repository interface with operations for {@link SpittleModel} persistence.
 * @author habuma
 */
public interface SpittleDAO {

  long count();

  List<SpittleModel> findRecent();

  List<SpittleModel> findRecent(int count);

  SpittleModel findOne(long id);

  SpittleModel save(SpittleModel spittle);

  List<SpittleModel> findBySpitterId(long spitterId);
  
  void delete(long id);

}
