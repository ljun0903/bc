package bit.your.prj.visit;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class VisitCountDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Vi.";
	
	public void insertVisitor(VisitCountDto dto) {
		
		try {
		dto.setVisit_id(1);
		dto.setVisit_ip("192.000.000.0");
		dto.setVisit_agent("agentsafari");
		
		
		System.out.print("1111111111111111111111111111111111dao visit = " + dto);
		//return temp.insert("Vi.VisitCountDao", dto);
		session.insert("Vi.VisitCountDao", dto);
		}catch(Exception e) {
			System.out.println("99999999999999999"+e);
		}
	}
}