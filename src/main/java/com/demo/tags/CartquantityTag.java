package com.demo.tags;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.demo.entities.Item;
//@Component
public class CartquantityTag extends RequestContextAwareTag {
	
	@Autowired
	private HttpServletRequest httpServletRequest;
	
	@Override
	public void doFinally() {
		JspWriter writer =pageContext.getOut();
		try {
			int quantity=0;
			HttpSession httpSession = httpServletRequest.getSession();
			List<Item> cart = (List<Item>) httpSession.getAttribute("cart");
			if (cart == null) {
				quantity=0;
			} else {
				
				for (Item item : cart) {
					quantity = quantity + item.getQuantity();
				}
				
			}
			writer.print("<span>"+quantity+"</span>");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	protected int doStartTagInternal() throws Exception {
		if (httpServletRequest == null) {
			WebApplicationContext wac = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory acbf = wac.getAutowireCapableBeanFactory();
			acbf.autowireBean(this);
			}
			return SKIP_BODY;
	}

}
