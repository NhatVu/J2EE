package spittr.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spittr.dao.SpitterDAO;
import spittr.model.SpitterModel;

@Repository
@Transactional

public class SpitterDAOImpl implements SpitterDAO {

	//@Autowired
	private SessionFactory sessionFactory;

	@Inject
	public SpitterDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;		 //<co id="co_InjectSessionFactory"/>
	}
	
	private Session currentSession() {
		return sessionFactory.getCurrentSession();//<co id="co_RetrieveCurrentSession"/>
	}
	
	public long count() {
		return findAll().size();
	}

	public SpitterModel save(SpitterModel spitter) {
		Serializable id = currentSession().save(spitter);  //<co id="co_UseCurrentSession"/>
		return new SpitterModel((Long) id, 
				spitter.getUsername(), 
				spitter.getPassword(), 
				spitter.getFullName(), 
				spitter.getEmail(), 
				spitter.isUpdateByEmail());
	}

	public SpitterModel findOne(long id) {
		return (SpitterModel) currentSession().get(SpitterModel.class, id); 
	}

	public SpitterModel findByUsername(String username) {		
		return (SpitterModel) currentSession() 
				.createCriteria(SpitterModel.class) 
				.add(Restrictions.eq("username", username))
				.list().get(0);
	}

	public List<SpitterModel> findAll() {
		return (List<SpitterModel>) currentSession() 
				.createCriteria(SpitterModel.class).list(); 
	}
	
}
