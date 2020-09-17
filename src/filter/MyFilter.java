package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RespectBinding;

import com.sun.mail.iap.Response;

@WebFilter("/admin/*")
public class MyFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		String admin = (String) request.getSession().getAttribute("admin");
		String login = (String) request.getSession().getAttribute("login");
		if (null != admin) {
			chain.doFilter(request, response);
		} else {
			if (null != login) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				response.getWriter().write("<h1>权限不足，没有管理员权限,使用管理员帐号登录,3秒后跳转到登录页</h1>");
				response.setHeader("Refresh", "3;url="+ request.getContextPath()+"/index/login.jsp");
			} else {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				response.getWriter().write("<h1>未登录系统，请使用管理员帐号登录,3秒后跳转到登录页</h1>");
				response.setHeader("Refresh", "3;url="+ request.getContextPath()+"/index/login.jsp");
			}
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	

}
