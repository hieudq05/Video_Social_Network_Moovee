package service.like.analytics.month;

import jakarta.persistence.EntityManagerFactory;
import repository.like.analytics.month.CountLikeInMonthRepo;
import repository.like.analytics.month.ICountLikeInMonthRepo;

import java.time.LocalDate;

public class CountLikeInMonthService implements ICountLikeInMonthService {

    EntityManagerFactory entityManagerFactory;
    ICountLikeInMonthRepo countLikeInMonthRepo;

    public CountLikeInMonthService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        this.countLikeInMonthRepo = new CountLikeInMonthRepo(entityManagerFactory);
    }

    @Override
    public Long countLikeInMonth(LocalDate localDate) {
        return countLikeInMonthRepo.getCountLikeInMonth(localDate);
    }

    @Override
    public Long getCountLikeOfVideoInMonth(LocalDate localDate, String videoId) {
        return countLikeInMonthRepo.getCountLikeOfVideoInMonth(localDate, videoId);
    }

    @Override
    public Long getCountLikeOfUserInMonth(LocalDate localDate, String userId) {
        return countLikeInMonthRepo.getCountLikeOfUserInMonth(localDate, userId);
    }
}
