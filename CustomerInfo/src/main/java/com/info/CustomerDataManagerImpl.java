package com.info;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class CustomerDataManagerImpl implements CustomerDataManager {

  @Autowired
  private CustomerDataDAO userDAO;

  @Override
  @Transactional
  public void insertCustomer(CustomerData user) {
    userDAO.insertCustomer(user);
  }

  @Override
  public List<CustomerData> SearchCustomer(CustomerData customerinfo) {
    return userDAO.SearchCustomer(customerinfo);
  }

}
