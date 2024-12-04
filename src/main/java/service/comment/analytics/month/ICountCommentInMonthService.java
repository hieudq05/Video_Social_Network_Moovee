package service.comment.analytics.month;

import java.time.LocalDate;

public interface ICountCommentInMonthService {
    Long countCommentInMonth(LocalDate localDate);

    Long countCommentOfVideoInMonth(LocalDate localDate, String videoId);

    Long countCommentOfUserInMonth(LocalDate localDate, String userId);
}
