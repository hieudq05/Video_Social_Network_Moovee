package service.follow.basic;

import model.defaults.Follow;
import service.interfaces.IBasicCRUDService;

import java.time.LocalDate;
import java.util.List;

public interface ICRUDFollowService extends IBasicCRUDService<Follow, Integer> {
    List<Follow> selectFollowsByUser(String id);

    List<Follow> selectFollowsByDate(LocalDate date);

    List<Follow> selectFollowersFollowUser(String id);

    long selectCountAllFollows();

    long selectCountFollowsByUser(String id);

    long selectCountFollowsByDate(LocalDate date);

    long selectCountUserFollow(String id);
}
