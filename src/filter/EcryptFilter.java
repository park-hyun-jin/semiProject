package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import wrapper.EncryptWrapper;

/**
 * Servlet Filter implementation class EcryptFilter
 */
@WebFilter(filterName = "encrypt", 
			servletNames= {"LoginEmailUserServlet", "EmailJoinUserServlet", "ChangePwdServlet"})
public class EcryptFilter implements Filter {

    public EcryptFilter() { }

	public void destroy() {	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 매개변수 ServletRequest를
		/// HttpServletRequest로 다운캐스팅
		HttpServletRequest hRequest = (HttpServletRequest)request;
		// wrapper는 HttpServletRequest를 매개변수로 받기 때문.
		
		// 암호화 wrapper 객체 생성
		EncryptWrapper encWrapper = new EncryptWrapper(hRequest);
		
		chain.doFilter(encWrapper, response);
	}

	public void init(FilterConfig fConfig) throws ServletException { }

}
