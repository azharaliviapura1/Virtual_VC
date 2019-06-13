package com.journaldev.spring.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author Maherban
 *
 */
@Entity
@Table(name="User_Transaction")
public class CreditDebit {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="user_id")
	private int user_id;
	
	@Column(name="group_id")
	private int group_id;
	
	@Column(name="Credit_Debit")
	private String creditDebit;
	
	@Column(name="amount")
	private BigDecimal amount;
	
	@Column(name="transaction_date")
	private Date transaction_date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}


	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}


	public String getCreditDebit() {
		return creditDebit;
	}

	public void setCreditDebit(String creditDebit) {
		this.creditDebit = creditDebit;
	}
	
	public Date getTransaction_date() {
		return transaction_date;
	}

	public void setTransaction_date(Date transaction_date) {
		this.transaction_date = transaction_date;
	}

	

	
}
