package com.info;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DataController {
	@Autowired
	private ApplicationContext ctx;
	
		
	@RequestMapping(value = "/CustomerData", method = RequestMethod.GET)
	public String printHello(ModelMap model) {
			return "CustomerData";

	}
 
	@RequestMapping(headers = "Content-Type=application/json", method = RequestMethod.POST, value = "/addCustomer")
	@ResponseBody
	public CustomerData addCustomer(@RequestBody CustomerData customerinfo) {
				
		CustomerDataManager customerDataManager = (CustomerDataManager) ctx.getBean("customerDataManagerImpl");

	  //  CustomerData customer = new CustomerData();
	   // customer.setName(customerinfo.getName());
	   // customer.setMail(customerinfo.getMail());
	   // customer.setphone(customerinfo.getPhone());
	   // customer.setAddress((customerinfo.getAddress()).toString());
	    
	    customerDataManager.insertCustomer(customerinfo);
	    System.out.println("User inserted!");
	  
		return customerinfo;
	}
	
	@RequestMapping(headers = "Content-Type=application/json", method = RequestMethod.POST, value = "/getCustomer")
	@ResponseBody
	public List<CustomerData> getCustomer(@RequestBody CustomerData customerinfo) {
		
		CustomerDataManager userManager = (CustomerDataManager) ctx.getBean("customerDataManagerImpl");

	    List<CustomerData> Customerlist = userManager.SearchCustomer(customerinfo);
	    	    
		return Customerlist;
	}
	
}
