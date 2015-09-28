package com.info;
import java.util.List;



public interface CustomerDataManager {

  void insertCustomer(CustomerData user);

  List<CustomerData> SearchCustomer(CustomerData customerinfo);
  
 }
