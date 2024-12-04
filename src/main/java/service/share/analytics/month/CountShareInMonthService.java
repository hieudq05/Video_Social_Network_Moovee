package service.share.analytics.month;

import jakarta.persistence.EntityManagerFactory;
import repository.share.count.month.CountShareInMonthRepo;
import repository.share.count.month.ICountShareInMonthRepo;

import java.time.LocalDate;

public class CountShareInMonthService implements ICountShareInMonthService {

    EntityManagerFactory entityManagerFactory;
    ICountShareInMonthRepo countShareInMonthRepo;
    public CountShareInMonthService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        this.countShareInMonthRepo = new CountShareInMonthRepo(entityManagerFactory);
    }

    @Override
    public Long countShareInMonth(LocalDate localDate) {
        return countShareInMonthRepo.countShareInMonth(localDate);
    }

    @Override
    public Long countShareOfVideoInMonth(LocalDate localDate, String videoId) {
        return countShareInMonthRepo.countShareOfVideoInMonth(localDate, videoId);
    }

    @Override
    public Long countShareOfUserInMonth(LocalDate localDate, String userId) {
        return countShareInMonthRepo.countShareOfUserInMonth(localDate, userId);
    }
}
