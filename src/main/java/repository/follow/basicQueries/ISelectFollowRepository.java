package repository.follow.basicQueries;

import model.defaults.Follow;

import java.time.LocalDate;
import java.util.List;

public interface ISelectFollowRepository {
    List<Follow> selectFollowsByUser(String id);

    List<Follow> selectFollowsByDate(LocalDate date);

    List<Follow> selectFollowersFollowUser(String id);

    long selectCountAllFollows();

    long selectCountFollowsByUser(String id);

    long selectCountFollowsByDate(LocalDate date);

    long selectCountUserFollows(String id);
}
