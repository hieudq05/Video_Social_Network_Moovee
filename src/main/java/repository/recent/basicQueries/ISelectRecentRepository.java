package repository.recent.basicQueries;

import model.defaults.Recent;
import java.time.LocalDate;
import java.util.List;

public interface ISelectRecentRepository {
    List<Recent> getRecentsByDate(LocalDate date);

    List<Recent> getRecentsByUserId(String userId);

    long selectCountAllRecents();

    long selectCountRecentsByUserId(String userId);

    long selectCountRecentsByDate(LocalDate date);

    long selectCountRecentsByPostId(String postId);
}
