package service.video.analytics.day;

import java.time.LocalDate;

public interface ICountVideoInDayService {
    Long countVideoInDay(LocalDate date);
}
