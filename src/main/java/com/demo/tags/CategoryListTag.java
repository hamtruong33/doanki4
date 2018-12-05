package com.demo.tags;

import javax.servlet.jsp.JspWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.*;
import com.demo.entities.Category;
import com.demo.services.CategoryService;

public class CategoryListTag extends RequestContextAwareTag {

	@Autowired
	private CategoryService categoryService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (categoryService == null) {
			WebApplicationContext wac = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory acbf = wac.getAutowireCapableBeanFactory();
			acbf.autowireBean(this);
		}
		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {
			writer.print("<ul class=\"list\">");
			for (Category category : categoryService.findAll()) {
				writer.print("<li><a href='" + pageContext.getRequest().getServletContext().getContextPath()
						+ "/product/gotoCategory/" + category.getId() + "'>" + category.getName() + "</a></li>");
			}
			writer.print("</ul>");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}