package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.PersonDAO;
import com.journaldev.spring.model.CreditDebit;
import com.journaldev.spring.model.Group;
import com.journaldev.spring.model.Person;

@Service
public class PersonServiceImpl implements PersonService {
	
	private PersonDAO personDAO;

	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}

	@Override
	@Transactional
	public void addPerson(Person p) {
		this.personDAO.addPerson(p);
	}
	
	@Override
	@Transactional
	public void addGroup(Group p) {
		this.personDAO.addGroup(p);
	}

	@Override
	@Transactional
	public void updatePerson(Person p) {
		this.personDAO.updatePerson(p);
	}
	
	@Override
	@Transactional
	public void updateGroup(Group p) {
		this.personDAO.updateGroup(p);
	}

	@Override
	@Transactional
	public List<Person> listPersons() {
		return this.personDAO.listPersons();
	}
	
	@Override
	@Transactional
	public List<Group> listGroups() {
		return this.personDAO.listGroups();
	}

	@Override
	@Transactional
	public Person getPersonById(int id) {
		return this.personDAO.getPersonById(id);
	}

	@Override
	@Transactional
	public void removePerson(int id) {
		this.personDAO.removePerson(id);
	}
	
	@Override
	@Transactional
	public Group getGroupById(int id) {
		return this.personDAO.getGroupById(id);
	}

	@Override
	@Transactional
	public void removeGroup(int id) {
		this.personDAO.removeGroup(id);
	}

	@Override
	@Transactional
	public List<Person> getUserByGroupId(int id) {
		// TODO Auto-generated method stub
		return this.personDAO.getUserByGroupId(id);
	}
	
	@Override
	@Transactional
	public void addTransaction(CreditDebit creditDebit)
	{
		this.personDAO.addTransaction(creditDebit);
	}

	@Override
	@Transactional
	public List<CreditDebit> getCreditDebit(int userId){
		return this.personDAO.getCreditDebit(userId);
	}

}
