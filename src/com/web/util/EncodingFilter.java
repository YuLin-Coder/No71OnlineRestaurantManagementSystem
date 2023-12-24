package com.web.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	protected String encoding = null;

	protected FilterConfig filterConfig = null;

	public void destroy() {
		this.encoding = null;
		this.filterConfig = null;
	}
//采用encodingfilter统一处理字符集

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {		
		String encoding = selectEncoding(request);
		if (encoding != null) { // 对请求进行编码设置
			request.setCharacterEncoding(encoding);
			response.setCharacterEncoding(encoding);
		}
		// 将控制权传递给下一个过滤器
		chain.doFilter(request, response);
	}
//在doFilter方法中放入过滤行为oFilter方法的第一个参数为ServletRequest对象，此对象给过滤器提供了对进入的信息（包括表单数据，cookie和HTTP请求头）的完全访问；
//第二个参数为ServletResponse对象，通常在简单的过滤器中忽略此参数；最后一个参数为FilterChain，如下一步所述，此参数调用Servlet或JSP页面
//调用FilterChain对象的doFilter方法，Filter接口的doFilter方法取一个FilterChain对象作为它的一个参数。在调用此对象的doFilter方法时，
//激活下一个相关过滤器。如果没有另一个过滤器与Servlet或JSP页面被激活
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");
	}
// 初始化方法  
	protected String selectEncoding(ServletRequest request) {
		return (this.encoding);
	}
}
