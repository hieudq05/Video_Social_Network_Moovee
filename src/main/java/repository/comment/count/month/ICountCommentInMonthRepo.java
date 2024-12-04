package repository.comment.count.month;

import java.time.LocalDate;

public interface ICountCommentInMonthRepo{
    Long countCommentInMonth(LocalDate localDate);

    Long countCommentOfVideoInMonth(LocalDate localDate, String videoId);

    Long countCommentOfUserInMonth(LocalDate localDate, String userId);
}
