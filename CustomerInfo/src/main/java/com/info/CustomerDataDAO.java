package com.info;
import java.util.List;



public interface CustomerDataDAO {

  void insertCustomer(CustomerData user);

  List<CustomerData> SearchCustomer(CustomerData customerinfo);
  
}