package service.video.analytics.day;

import jakarta.persistence.EntityManagerFactory;
import repository.video.analytics.day.CountVideoInDayRepo;
import repository.video.analytics.day.ICountVideoInDayRepo;

import java.time.LocalDate;

public class CountVideoInDayService implements ICountVideoInDayService {

    ICountVideoInDayRepo countVideoInDayRepo;
    EntityManagerFactory entityManagerFactory;

    public CountVideoInDayService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        countVideoInDayRepo = new CountVideoInDayRepo(entityManagerFactory);
    }

    @Override
    public Long countVideoInDay(LocalDate date) {
        return countVideoInDayRepo.getVideoCountInDay(date);
    }

}
