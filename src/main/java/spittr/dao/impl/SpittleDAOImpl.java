package spittr.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spittr.dao.SpittleDAO;
import spittr.model.SpittleModel;

@Repository
@Transactional
public class SpittleDAOImpl implements SpittleDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Inject
	public SpittleDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();//<co id="co_RetrieveCurrentSession"/>
	}

	public long count() {
		return findAll().size(); 
	}

	public List<SpittleModel> findRecent() {
		return findRecent(10);
	}

	public List<SpittleModel> findRecent(int count) {
		return (List<SpittleModel>) spittleCriteria()
				.setMaxResults(count)
				.list();
	}

	public SpittleModel findOne(long id) {
		return (SpittleModel) currentSession().get(SpittleModel.class, id);
	}

	public SpittleModel save(SpittleModel spittle) {
		Serializable id = currentSession().save(spittle);
		return new SpittleModel(
			(Long) id, 
			spittle.getSpitter(), 
			spittle.getMessage(), 
			spittle.getPostedTime());
	}

	public List<SpittleModel> findBySpitterId(long spitterId) {
		return spittleCriteria()
				.add(Restrictions.eq("spitter.id", spitterId))
				.list();
	}
	
	public void delete(long id) {
		currentSession().delete(findOne(id));
	}
	
	public List<SpittleModel> findAll() {
		return (List<SpittleModel>) spittleCriteria().list(); 
	}
	
	private Criteria spittleCriteria() {
		return currentSession() 
				.createCriteria(SpittleModel.class)
				.addOrder(Order.desc("postedTime"));
	}

}
