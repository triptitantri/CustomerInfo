package com.info;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;



@Repository
public class CustomerDataDAOImpl implements CustomerDataDAO {

  @PersistenceContext
  private EntityManager entityManager;

  @Override
  public void insertCustomer(CustomerData user) {
    entityManager.persist(user);
  }

  @Override
  public List<CustomerData> SearchCustomer(CustomerData customerinfo) {
    CriteriaBuilder builder = entityManager.getCriteriaBuilder();
    CriteriaQuery<CustomerData> cq = builder.createQuery(CustomerData.class);
    Root<CustomerData> root = cq.from(CustomerData.class);
    List<Predicate> criteriaList = new ArrayList<Predicate>();
    
    Predicate Predicate1 = builder.equal(root.get("name"), customerinfo.getName());
    criteriaList.add(Predicate1);
    
    cq.select(root).where(builder.or(criteriaList.toArray(new Predicate[0])));
        
    return entityManager.createQuery(cq).getResultList();
  }
  
}