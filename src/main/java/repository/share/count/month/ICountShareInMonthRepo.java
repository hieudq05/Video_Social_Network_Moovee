package repository.share.count.month;

import java.time.LocalDate;

public interface ICountShareInMonthRepo {
    Long countShareInMonth(LocalDate localDate);

    Long countShareOfVideoInMonth(LocalDate localDate, String videoId);

    Long countShareOfUserInMonth(LocalDate localDate, String userId);
}