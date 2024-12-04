package service.recent.analytics.month;

import java.time.LocalDate;

public interface ICountViewInMonthService {
    Long getCountViewInMonth(LocalDate localDate);

    Long countViewOfVideoInMonth(LocalDate localDate, String videoId);

    Long countViewOfUserInMonth(LocalDate localDate, String userId);
}
