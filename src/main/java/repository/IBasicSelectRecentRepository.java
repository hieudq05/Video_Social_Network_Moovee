package repository;

import model.Recent;
import java.time.LocalDate;
import java.util.List;

public interface IBasicSelectRecentRepository {
    List<Recent> getRecentsByDate(LocalDate date);

    List<Recent> getRecentsByUserId(String userId);

    long selectCountAllRecents();

    long selectCountRecentsByUserId(String userId);

    long selectCountRecentsByDate(LocalDate date);
}
