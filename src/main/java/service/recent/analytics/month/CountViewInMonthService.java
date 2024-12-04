package service.recent.analytics.month;

import jakarta.persistence.EntityManagerFactory;
import repository.recent.analytics.month.CountViewInMonthRepo;
import repository.recent.analytics.month.ICountViewInMonthRepo;

import java.time.LocalDate;

public class CountViewInMonthService implements ICountViewInMonthService {

    EntityManagerFactory entityManagerFactory;
    ICountViewInMonthRepo countViewInMonthRepo;

    public CountViewInMonthService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        this.countViewInMonthRepo = new CountViewInMonthRepo(entityManagerFactory);
    }

    @Override
    public Long getCountViewInMonth(LocalDate localDate) {
        return countViewInMonthRepo.countViewInMonth(localDate);
    }

    @Override
    public Long countViewOfVideoInMonth(LocalDate localDate, String videoId) {
        return countViewInMonthRepo.countViewOfVideoInMonth(localDate, videoId);
    }

    @Override
    public Long countViewOfUserInMonth(LocalDate localDate, String userId) {
        return countViewInMonthRepo.countViewOfUserInMonth(localDate, userId);
    }
}
