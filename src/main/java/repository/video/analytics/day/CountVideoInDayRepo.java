package repository.video.analytics.day;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
public class CountVideoInDayRepo implements ICountVideoInDayRepo{

    EntityManagerFactory entityManagerFactory;

    @Override
    public Long getVideoCountInDay(LocalDate localDate) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return (Long) entityManager.createNativeQuery(
                            "SELECT COUNT_BIG(*) FROM Video v WHERE CAST(v.postedDate AS DATE) = CAST(GETDATE() AS DATE)")
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
