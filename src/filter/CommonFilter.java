package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class CommonFilter
 */
@WebFilter(filterName = "encoding",urlPatterns = "/*") // http://localhost:8080/jspProject 아래 모든
public class CommonFilter implements Filter {

    public CommonFilter() { }

	public void destroy() { }
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 1. view에서 전달받은 요청의 문자 인코딩 변경
		request.setCharacterEncoding("UTF-8");
		
		//2. 응답 데이터의 문자 인코딩 변경
		response.setCharacterEncoding("UTF-8");
		
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
