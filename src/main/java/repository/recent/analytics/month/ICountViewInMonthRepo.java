package repository.recent.analytics.month;

import java.time.LocalDate;

public interface ICountViewInMonthRepo {
    Long countViewInMonth(LocalDate localDate);

    Long countViewOfVideoInMonth(LocalDate localDate, String videoId);

    Long countViewOfUserInMonth(LocalDate localDate, String userId);
}
