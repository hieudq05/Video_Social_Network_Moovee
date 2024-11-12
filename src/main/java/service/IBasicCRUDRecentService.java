package service;

import model.Recent;

import java.time.LocalDate;
import java.util.List;

public interface IBasicCRUDRecentService extends IBasicCRUDService<Recent, Integer> {
    List<Recent> getRecentsByDate(LocalDate date);

    List<Recent> getRecentsByUserId(String userId);

    long selectCountAllRecents();

    long selectCountRecentsByUserId(String userId);

    long selectCountRecentsByDate(LocalDate date);
}
