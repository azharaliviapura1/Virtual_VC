package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.CreditDebit;
import com.journaldev.spring.model.Group;
import com.journaldev.spring.model.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addPerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Person saved successfully, Person Details="+p);
	}

	@Override
	public void updatePerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Person updated successfully, Person Details="+p);
	}
	
	@Override
	public void addGroup(Group p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Person saved successfully, Person Details="+p);
	}

	@Override
	public void updateGroup(Group p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Person updated successfully, Person Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> listPersons() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Person> personsList = session.createQuery("from Person").list();
		for(Person p : personsList){
			logger.info("Person List::"+p);
		}
		return personsList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Group> listGroups() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Group> groupList = session.createQuery("from Group").list();
		for(Group p : groupList){
			logger.info("Group List::"+p);
		}
		return groupList;
	}
	

	@Override
	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Person p = (Person) session.load(Person.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+p);
		return p;
	}

	@Override
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);
	}
	
	@Override
	public Group getGroupById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Group p = (Group) session.load(Group.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+p);
		return p;
	}

	@Override
	public void removeGroup(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Group p = (Group) session.load(Group.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Group> groupNameList() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Group> groupList = session.createSQLQuery("select Group_Name from VC_groups").list();
		/*for(Group p : groupList){
			logger.info("Group List::"+p);
		}*/
		return groupList;
	}

	@Override
	public List<Person> getUserByGroupId(int id) {
//		Session session = this.sessionFactory.getCurrentSession();
//		@SuppressWarnings("unchecked")
//		List<Person> userList = session.createSQLQuery("from Person where group_name = '"+id+"'").list();
//		return userList;
		
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Person where group_name= :group_id";
		Query query = session.createQuery(hql);
		query.setParameter("group_id",id);
		List<Person> personsList = query.list();
		return personsList;
	}
	
	@Override
	public void addTransaction(CreditDebit creditDebit)
	{
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(creditDebit);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CreditDebit> getCreditDebit(int userId)
	{
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from CreditDebit where user_id= :userId";
		Query query = session.createQuery(hql);
		query.setParameter("userId",userId);
		List<CreditDebit> creditDebitList = query.list();
		return creditDebitList;
	}


}
