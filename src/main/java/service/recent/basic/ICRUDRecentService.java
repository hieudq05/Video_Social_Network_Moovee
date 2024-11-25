package service.recent.basic;

import model.defaults.Recent;
import service.interfaces.IBasicCRUDService;

import java.time.LocalDate;
import java.util.List;

public interface ICRUDRecentService extends IBasicCRUDService<Recent, Integer> {
    List<Recent> getRecentsByDate(LocalDate date);

    List<Recent> getRecentsByUserId(String userId);

    long selectCountAllRecents();

    long selectCountRecentsByUserId(String userId);

    long selectCountRecentsByDate(LocalDate date);
}
