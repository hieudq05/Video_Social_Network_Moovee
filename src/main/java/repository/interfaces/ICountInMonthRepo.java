package repository.interfaces;

import java.util.List;

public interface ICountInMonthRepo<T> {
    List<T> getCountInMonth();

    List<T> getCountInMonthByUserId(String userId);

    List<T> getCountInMonthByVideoId(String videoId);
}
