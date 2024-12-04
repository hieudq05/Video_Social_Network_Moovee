package repository.video.analytics.day;

import java.time.LocalDate;

public interface ICountVideoInDayRepo {
    Long getVideoCountInDay(LocalDate localDate);
}
