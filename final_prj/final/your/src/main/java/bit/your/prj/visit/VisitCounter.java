package bit.your.prj.visit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Component
public class VisitCounter implements HttpSessionListener{
	
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		VisitCountDao dao = (VisitCountDao)wac.getBean("visitCountDAO");
		System.out.println("daodaodaodaodaodaodaodaodaodaodaodaodaodaodaodao============");
		System.out.println(dao);

		VisitCountDto dto = new VisitCountDto();
		dto.setVisit_ip(req.getRemoteAddr());
		dto.setVisit_agent(req.getHeader("User-Agent"));
		dao.insertVisitor(dto);
		
		
		//System.out.println("sessionCreadted = " + req.getHeader("refer") );
		
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}