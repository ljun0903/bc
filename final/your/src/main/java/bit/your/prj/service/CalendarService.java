package bit.your.prj.service;

import java.util.List;

import bit.your.prj.dto.CalendarDto;

public interface CalendarService {

	List<CalendarDto> getCalendar(CalendarDto dto);

	boolean writeCalendar(CalendarDto dto);	
	
	boolean writeTeachCalendar(CalendarDto dto);
	
	void deleteCalendar(CalendarDto dto);
	
	void deleteMemberCal(int seq_class);
}
