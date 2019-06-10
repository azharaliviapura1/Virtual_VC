package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.CreditDebit;
import com.journaldev.spring.model.Group;
import com.journaldev.spring.model.Person;

public interface PersonDAO {

	public void addPerson(Person p);
	public void updatePerson(Person p);
	public void addGroup(Group g);
	public void updateGroup(Group g);
	public List<Person> listPersons();
	public List<Group> listGroups();
	public Person getPersonById(int id);
	public void removePerson(int id);
	public Group getGroupById(int id);
	public void removeGroup(int id);
	public List<Group> groupNameList();
	public  List<Person> getUserByGroupId(int id);
	public void addTransaction(CreditDebit creditDebit);
	public List<CreditDebit> getCreditDebit(int userId);
 }
