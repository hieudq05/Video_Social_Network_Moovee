package repository.recent.analytics.month;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
public class CountViewInMonthRepo implements ICountViewInMonthRepo {

    EntityManagerFactory entityManagerFactory;

    @Override
    public Long countViewInMonth(LocalDate localDate) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(r) FROM Recent r WHERE MONTH(r.date) = MONTH(:month) AND YEAR(r.date) = YEAR(:month)", Long.class)
                    .setParameter("month", localDate)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long countViewOfVideoInMonth(LocalDate localDate, String videoId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(r) FROM Recent r WHERE MONTH(r.date) = MONTH(:month) AND YEAR(r.date) = YEAR(:month) AND r.videoRecent.id = :videoId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("videoId", videoId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long countViewOfUserInMonth(LocalDate localDate, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(r) FROM Recent r WHERE MONTH(r.date) = MONTH(:month) AND YEAR(r.date) = YEAR(:month) AND r.videoRecent.poster.id = :userId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("userId", userId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
