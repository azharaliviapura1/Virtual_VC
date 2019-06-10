package com.journaldev.spring;

import org.springframework.stereotype.Component;

import com.journaldev.spring.model.CreditDebit;
import com.journaldev.spring.model.Group;
import com.journaldev.spring.model.Person;
import com.journaldev.spring.service.CreditDebitForm;
import com.journaldev.spring.service.GroupForm;
import com.journaldev.spring.service.PersonForm;

@Component
public class FormToDomainConverter {

	public static Person convertPersonFormToDomain(PersonForm pForm,Person p)
	{
		// TO DO -- Conversion of all fields are pending
		p.setFirstName(pForm.getFirstName());
		return p;
	}
	
	public static PersonForm convertPersonDomainToForm(Person p,PersonForm pForm)
	{
		// TO DO --- Conversion of all fields are pending
		pForm.setFirstName(p.getFirstName());
		return pForm;
	}
	
	public static Group convertGroupFormToDomain(GroupForm gForm,Group g)
	{
		// TO DO --- Conversion of all fields are pending
		g.setGroupName(gForm.getGroupName());
		return g;
	}
	
	public static GroupForm convertGroupDomainToForm(Group g,GroupForm gForm)
	{
		// TO DO --- Conversion of all fields are pending
		gForm.setGroupName(g.getGroupName());
		return gForm;
	}
	
	public static CreditDebit convertCreditFormToDomain(CreditDebitForm cForm,CreditDebit c)
	{
		// TO DO --- Conversion of all fields are pending
		c.setAmount(cForm.getAmount());
		return c;
	}
}
