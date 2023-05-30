/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.neu.edu.cardhop.controller;

import com.neu.edu.cardhop.action.LoginAction;
import com.neu.edu.cardhop.action.UserAction;
import com.neu.edu.cardhop.pojo.User;
import com.neu.edu.cardhop.exception.UserException;
import com.neu.edu.cardhop.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 *
 * @author MohitMalani
 */

@Controller
public class UserController {
    
    @Autowired
    private UserService userService;
   
    @RequestMapping(value={"/","/index"})
    public String index(Model m){
        return "index";
    }
    
    @RequestMapping("/login_form")
    public String loginForm(Model m){
        m.addAttribute("command",new LoginAction());
        return "login_form";
    }
    
    @RequestMapping(value= {"/login"}, method = RequestMethod.POST)
    public String handleLogin(@ModelAttribute("command") LoginAction lcmd, Model m, HttpSession session){
        try {
            
            User loggedInUser = userService.login(lcmd.getLoginName(), lcmd.getPassword());
            
            if(loggedInUser==null){
                m.addAttribute("err", "Login Failed! Please Enter the Valid Credentials");
                return "login_form";
            }
            else{
                if(loggedInUser.getRole().equals(UserService.ROLE_ADMIN)){
                    
                    this.addUserInSession(loggedInUser, session);
                    return "redirect:admin/dashboard";
                }
                else if(loggedInUser.getRole().equals(UserService.ROLE_USER)){
                    
                    this.addUserInSession(loggedInUser, session);
                    return "redirect:user/dashboard";
                }
                else{
                    m.addAttribute("err", "Invalid User!");
                    return "login_form"; 
                }
            }
            
        } catch (UserException ex) {
            m.addAttribute("err", ex.getMessage());
            return "login_form";      
        }
    }
    
    @RequestMapping(value={"/logout"})
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index?act=lo";
    }
    
    @RequestMapping(value={"/user/dashboard"})
    public String userDashBoard(){
        return "user_dashboard";
    }
    
    
    @RequestMapping(value={"/admin/dashboard"})
    public String adminDashBoard(){
        return "admin_dashboard";
    }
    
    @RequestMapping("/user/list")
    public String userList(Model m){
        m.addAttribute("usersList", userService.getUserList());
        
        return "ulist_form";
    }
    
    @RequestMapping(value={"/reg_form"})
    public String registrationForm(Model m){
        UserAction cmd = new UserAction();
        m.addAttribute("command", cmd);
        return "reg_form";
    }
    
    @RequestMapping(value="/register")
    public String registerUser(@ModelAttribute("command") UserAction cmd, Model m){
        try{
            User user=cmd.getUser();
            user.setRole(UserService.ROLE_USER);
            user.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE);
            userService.register(user);
            return "redirect:/index?act=reg";
        }catch(DuplicateKeyException duplicateKeyException){
            duplicateKeyException.printStackTrace();
            m.addAttribute("err","Login Name already Exist! Please try with another Login Name"); 
            return "reg_form";
        }
    }
    
    @RequestMapping(value={"/user/change_status"})
    @ResponseBody
    public String changeStatus(@RequestParam("userId") Integer userId,@RequestParam("loginStatus") Integer loginStatus){
        try{
            userService.changeLoginStatus(userId, loginStatus);
            return "Success : Status Changed! ";
        }catch(Exception ex){
            ex.printStackTrace();
            return "Error : Unable To change Status ! Try Again";
        }
    }

    
    private void addUserInSession(User u, HttpSession session){
        session.setAttribute("user", u);
        session.setAttribute("userId", u.getUserId());
        session.setAttribute("role", u.getRole());
    }
}
