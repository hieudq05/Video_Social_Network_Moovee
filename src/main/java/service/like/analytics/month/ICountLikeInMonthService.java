package service.like.analytics.month;

import java.time.LocalDate;

public interface ICountLikeInMonthService {
    Long countLikeInMonth(LocalDate localDate);

    Long getCountLikeOfVideoInMonth(LocalDate localDate, String videoId);

    Long getCountLikeOfUserInMonth(LocalDate localDate, String userId);
}
