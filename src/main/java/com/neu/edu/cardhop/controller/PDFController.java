package com.neu.edu.cardhop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.neu.edu.cardhop.pojo.User;

@Controller
public class PDFController {
	@RequestMapping(value = "/report.pdf", method = RequestMethod.GET)
    public ModelAndView downloadPDF(HttpServletRequest request) {
		View view = new PDFView();
		Map<String,Object> userData = new HashMap<String,Object>();
		User user = (User) request.getSession().getAttribute("user");
		userData.put("user", user);
        return new ModelAndView(view, "userData", userData);
    }
}
