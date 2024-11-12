package repository;

import model.Follow;

import java.time.LocalDate;
import java.util.List;

public interface IBasicSelectFollowRepository {
    List<Follow> selectFollowsByUser(String id);

    List<Follow> selectFollowsByDate(LocalDate date);

    long selectCountAllFollows();

    long selectCountFollowsByUser(String id);

    long selectCountFollowsByDate(LocalDate date);
}
