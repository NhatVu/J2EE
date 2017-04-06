package spittr.bo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spittr.bo.SpitterBO;
import spittr.dao.SpitterDAO;
import spittr.model.SpitterModel;

@Service
public class SpitterBOImpl implements SpitterBO{

	@Autowired
	SpitterDAO dao;
	@Override
	public long count() {
		// TODO Auto-generated method stub
		return  dao.count();
	}

	@Override
	//@Transactional
	public SpitterModel save(SpitterModel spitter) {
		// TODO Auto-generated method stub
		return dao.save(spitter);
	}

	@Override
	public SpitterModel findOne(long id) {
		// TODO Auto-generated method stub
		return dao.findOne(id);
	}

	@Override
	public SpitterModel findByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.findByUsername(username);
	}

	@Override
	public List<SpitterModel> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

}
