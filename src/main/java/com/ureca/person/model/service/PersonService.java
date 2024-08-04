package com.ureca.person.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ureca.person.dto.Person;

public interface PersonService {
//명세 => Person 추가/수정/삭제/조회/모두조회
	
	public int add(Person person)throws SQLException;
	public int edit(Person person)throws SQLException;
	public int remove(int no)throws SQLException;
	
	public Person read(int no)throws SQLException;
	public List<Person> readAll()throws SQLException;
	
	// PersonService.java 인터페이스에 메소드 선언
	List<Person> getRandomFlavors(int count) throws SQLException;
	// 랜덤 맛 추출 메소드 선언
	
}
