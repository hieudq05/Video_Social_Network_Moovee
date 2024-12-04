package service.share.analytics.month;

import java.time.LocalDate;

public interface ICountShareInMonthService {
    Long countShareInMonth(LocalDate localDate);

    Long countShareOfVideoInMonth(LocalDate localDate, String videoId);

    Long countShareOfUserInMonth(LocalDate localDate, String userId);
}
