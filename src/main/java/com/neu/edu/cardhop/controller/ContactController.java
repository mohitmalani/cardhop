/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.neu.edu.cardhop.controller;

import com.neu.edu.cardhop.pojo.Contact;
import com.neu.edu.cardhop.service.ContactService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author MohitMalani
 */

@Controller
public class ContactController {
    
    @Autowired
    ContactService contactService;
    
    @RequestMapping(value="/user/contact_form")
    public String contactForm(Model m){
        
        Contact contact = new Contact();
        m.addAttribute("command", contact);
        return "contact_form";
    }
    
    @RequestMapping(value="/user/contact_save")
    public String saveOrUpdateContact(@ModelAttribute("command") Contact c, Model m, HttpSession session) {
        Integer contactId = (Integer) session.getAttribute("aContactId");
        if (contactId == null) {
            
            try {
                Integer userId = (Integer) session.getAttribute("userId");
                c.setUserId(userId);
                contactService.save(c);
                return "redirect:/user/contact_list?act=csv";
            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute("err", "Failed to save contact");
                return "contact_form";
            }
        } else {
            
            try {
                c.setContactId(contactId); 
                contactService.update(c);
                session.removeAttribute("aContactId");
                return "redirect:/user/contact_list?act=ed";
            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute("err", "Failed to Edit contact");
                return "contact_form";
            }
        }
    }
    
    @RequestMapping(value = "/user/edit_contact")
    public String prepareEditForm(Model m, HttpSession session, @RequestParam("cid") Integer contactId) {
        session.setAttribute("aContactId", contactId);
        Contact c = contactService.findById(contactId);
        m.addAttribute("command", c);
        return "contact_form";
    }
    
    
    @RequestMapping(value="/user/contact_list")
    public String contactList(Model m, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        m.addAttribute("contactList", contactService.findUserContact(userId));
        return "contact_list"; 
    }
    
    @RequestMapping(value="/user/del_contact")
    public String deleteContact(@RequestParam("cid") Integer contactId) {
        contactService.delete(contactId);
        return "redirect:/user/contact_list?act=del";
    }
    
    @RequestMapping(value="/user/contact_search")
    public String contactSearch(Model m, HttpSession session, @RequestParam("freeText") String freeText) {
        Integer userId = (Integer) session.getAttribute("userId");
        m.addAttribute("contactList", contactService.findUserContact(userId, freeText));
        return "contact_list"; 
    }
    
   
   @RequestMapping("/user/bulk_contact_delete")         
    public String deleteBulkContact(@RequestParam("cid") Integer[] contactIds) {
        contactService.delete(contactIds);
        return "redirect:/user/contact_list?val=bdel";
    }
}
