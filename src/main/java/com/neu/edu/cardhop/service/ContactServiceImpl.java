/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.neu.edu.cardhop.service;

import com.neu.edu.cardhop.dao.BaseDAO;
import com.neu.edu.cardhop.dao.ContactDAO;
import com.neu.edu.cardhop.pojo.Contact;
import com.neu.edu.cardhop.mapper.ContactRowMapper;
import com.neu.edu.cardhop.util.StringUtil;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 *
 * @author MohitMalani
 */
@Service
public class ContactServiceImpl extends BaseDAO implements ContactService{
    
    @Autowired
    private ContactDAO contactDAO;
    
    @Override    
    public void save(Contact c) {
        contactDAO.save(c);
    }

    @Override
    public void update(Contact c) {
        contactDAO.update(c);
    }

    @Override
    public void delete(Integer contactId) {
        contactDAO.delete(contactId);
    }

    @Override
    public void delete(Integer[] contactIds) {
        String ids = StringUtil.toCommaSeparatedString(contactIds);
        String sql = "DELETE FROM contact WHERE contactId IN("+ids+")";
        getJdbcTemplate().update(sql);
    }

    @Override
    public List<Contact> findUserContact(Integer userId) {
        return contactDAO.findByProperty("userId", userId);
    }

    @Override
    public List<Contact> findUserContact(Integer userId, String txt) {
        String sql = "SELECT contactId, userId, name, phone, email, address, remark FROM contact WHERE userId=? AND (name LIKE '%"+txt+"%' OR address LIKE '%"+txt+"%' OR phone LIKE '%"+txt+"%' OR email LIKE '%"+txt+"%' OR remark LIKE '%"+txt+"%')";
        return getJdbcTemplate().query(sql, new ContactRowMapper(),userId); 
    }

    @Override
    public Contact findById(Integer cotactId) {
        return contactDAO.findById(cotactId);
    }
    
}
