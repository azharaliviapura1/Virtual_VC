package com.journaldev.spring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.journaldev.spring.model.CreditDebit;
import com.journaldev.spring.model.Group;
import com.journaldev.spring.model.Person;
import com.journaldev.spring.service.PersonService;

@Controller
public class PersonController {
	
	private PersonService personService;
	
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}
	
	
	@RequestMapping(value = "/")
    public ModelAndView redirectToMainPage() {
        return new ModelAndView("home");
    }
	
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		model.addAttribute("listGroups", this.personService.listGroups());
		return "person";
	}
	
	//For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p){
		
		if(p.getId() == 0){
			//new person, add it
			this.personService.addPerson(p);
		}else{
			//existing person, call update
			this.personService.updatePerson(p);
		}
		
		return "redirect:/persons";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.personService.removePerson(id);
        return "redirect:/persons";
    }
 
    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("listPersons", this.personService.listPersons());
        return "person";
    }
	
    
    @RequestMapping(value = "/groups", method = RequestMethod.GET)
	public String listGroups(Model model) {
		model.addAttribute("group", new Group());
		model.addAttribute("listGroups", this.personService.listGroups());
		return "group";
	}
    
    
  //For add and update person both
  	@RequestMapping(value= "/group/add", method = RequestMethod.POST)
  	public String addGroup(@ModelAttribute("group") Group p){
  		
  		if(p.getId() == 0){
  			//new person, add it
  			this.personService.addGroup(p);
  		}else{
  			//existing person, call update
  			this.personService.updateGroup(p);
  		}
  		
  		return "redirect:/groups";
  		
  	}
  	
  	@RequestMapping("/removeGroup/{id}")
      public String removeGroup(@PathVariable("id") int id){
  		
          this.personService.removeGroup(id);
          return "redirect:/groups";
      }
   
      @RequestMapping("/editGroup/{id}")
      public String editGroup(@PathVariable("id") int id, Model model){
          model.addAttribute("group", this.personService.getGroupById(id));
          model.addAttribute("listGroups", this.personService.listGroups());
          return "group";
      }
      
      @RequestMapping(value = "/creditdebit", method = RequestMethod.GET)
      public String creditDebit(Model model) {
  		model.addAttribute("creditDebit", new CreditDebit());
  		model.addAttribute("listGroups", this.personService.listGroups());
  		return "creditDebit";
  	}
    
      @RequestMapping(value = "/getusersByGroup", method = RequestMethod.GET, produces = "application/json")
      @ResponseBody
      public String getuserByGropName(@RequestParam int groupId, HttpServletRequest request,
    	        HttpServletResponse
    	        response) {
    	  System.out.println("myID"+groupId);
    	  List<Person> personsList = this.personService.getUserByGroupId(groupId);
    	  for(int i = 0; i< personsList.size() ; i++)
    	  {
    		  System.out.println(personsList.get(i).getLastName());
    	  }
    	  Gson gson = new Gson();
    	  String strPersonList = gson.toJson(personsList);
    	  return strPersonList;
      }
    
}
