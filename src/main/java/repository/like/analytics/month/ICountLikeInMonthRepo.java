package repository.like.analytics.month;

import java.time.LocalDate;

public interface ICountLikeInMonthRepo {
    Long getCountLikeInMonth(LocalDate localDate);

    Long getCountLikeOfVideoInMonth(LocalDate localDate, String videoId);

    Long getCountLikeOfUserInMonth(LocalDate localDate, String userId);
}
