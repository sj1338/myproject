package jdbc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class JDBCInitListener
 *
 */
@WebListener
public class JDBCInitListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public JDBCInitListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         ServletContext application = sce.getServletContext();
         
         String url = application.getInitParameter("jdbcUrl");
         String user = application.getInitParameter("jdbcUser");
         String pw = application.getInitParameter("jdbcPassword");
         
         System.out.println(url);
         System.out.println(user);
         System.out.println(pw);
         
         try {
        	 Class.forName("oracle.jdbc.driver.OracleDriver");			
		} catch (ClassNotFoundException e) {
			 e.printStackTrace();
		}
         
         ConnectionProvider.setUrl(url);
         ConnectionProvider.setUser(user);
     	 ConnectionProvider.setPassword(pw);
         
     	String contextPath = application.getContextPath();
    	application.setAttribute("root", contextPath);
    	
    	// 카테고리 저장해두기
    	Map<String, String> categoryMap = new HashMap<>();
    	categoryMap.put("art", "예술");
    	categoryMap.put("cook", "요리");
    	categoryMap.put("game", "게임");
    	categoryMap.put("music", "음악");
    	categoryMap.put("sport", "스포츠");
    	categoryMap.put("tour", "관광");
    	
    	application.setAttribute("categoryMap", categoryMap);
    }
	
}
