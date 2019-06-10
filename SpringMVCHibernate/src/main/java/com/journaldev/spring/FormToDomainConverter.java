package com.journaldev.spring;

import com.journaldev.spring.model.Person;
import com.journaldev.spring.service.PersonForm;

public class FormToDomainConverter {

	public static Person convertPersonFormToDomain(PersonForm pForm,Person p)
	{
		p.setFirstName(pForm.getFirstName());
		return p;
	}
	
	public static PersonForm convertPersonDomainToForm(Person p,PersonForm pForm)
	{
		pForm.setFirstName(p.getFirstName());
		return pForm;
	}
}
