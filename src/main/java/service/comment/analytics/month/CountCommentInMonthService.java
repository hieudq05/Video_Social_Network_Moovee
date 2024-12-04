package service.comment.analytics.month;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import repository.comment.count.month.CountCommentInMonthRepo;
import repository.comment.count.month.ICountCommentInMonthRepo;

import java.time.LocalDate;

public class CountCommentInMonthService implements ICountCommentInMonthService {

    EntityManagerFactory entityManagerFactory;
    ICountCommentInMonthRepo countCommentInMonthRepo;
    public CountCommentInMonthService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        this.countCommentInMonthRepo = new CountCommentInMonthRepo(entityManagerFactory);
    }

    @Override
    public Long countCommentInMonth(LocalDate localDate) {
        return countCommentInMonthRepo.countCommentInMonth(localDate);
    }

    @Override
    public Long countCommentOfVideoInMonth(LocalDate localDate, String videoId) {
        return countCommentInMonthRepo.countCommentOfVideoInMonth(localDate, videoId);
    }

    @Override
    public Long countCommentOfUserInMonth(LocalDate localDate, String userId) {
        return countCommentInMonthRepo.countCommentOfUserInMonth(localDate, userId);
    }
}
