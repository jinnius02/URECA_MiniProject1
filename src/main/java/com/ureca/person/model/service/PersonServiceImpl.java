package com.ureca.person.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ureca.person.dto.Person;
import com.ureca.person.model.dao.PersonDAO;

@Service
public class PersonServiceImpl implements PersonService {

	@Autowired
	PersonDAO dao;
	
	@Override
	public int add(Person person) throws SQLException {
		return dao.insert(person);
	}

	@Override
	public int edit(Person person) throws SQLException {
		return dao.update(person);
	}

	@Override
	public int remove(int no) throws SQLException {
		return dao.delete(no);
	}

	@Override
	public Person read(int no) throws SQLException {
		return dao.select(no);
	}

	@Override
	public List<Person> readAll() throws SQLException {
		return dao.selectAll();
	}

	// PersonServiceImpl.java 구현 클래스에 메소드 구현
	@Override
	public List<Person> getRandomFlavors(int count) throws SQLException {
	    return dao.selectRandomFlavors(count); // DAO를 통해 DB에서 랜덤으로 데이터를 가져오는 구현
	}

}
