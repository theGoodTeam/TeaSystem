package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class Encode_Filter
 */
public class Encode_Filter implements Filter {

	//字符编码初始化参数
	protected String encoding = null;
	
	//FilterConfig对象
	protected FilterConfig filterfConfig = null;
	
    /**
     * Default constructor. 
     */
    public Encode_Filter() {
        // TODO Auto-generated constructor stub
    }

	/**销毁方法
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		this.encoding = null;
		this.filterfConfig = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		//判断字符编码是否有效
		if(encoding != null) {
			//设置request字符编码
			request.setCharacterEncoding("utf-8");
			//设置response字符编码
			response.setContentType("text/html ; charset="+encoding);
		}
		
		//传给下一个过滤器
		chain.doFilter(request, response);
	}

	/**初始化方法
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig filterfConfig) throws ServletException {
		// TODO Auto-generated method stub
		//对FilterConfig赋值
		this.filterfConfig = filterfConfig;
		//对初始化参数赋值
		this.encoding = filterfConfig.getInitParameter("encoding");
	}

}
