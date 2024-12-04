package repository.share.count.month;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
public class CountShareInMonthRepo implements ICountShareInMonthRepo {

    EntityManagerFactory entityManagerFactory;

    @Override
    public Long countShareInMonth(LocalDate localDate) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(s) FROM Share s WHERE MONTH(s.date) = MONTH(:month) AND YEAR(s.date) = YEAR(:month)", Long.class)
                    .setParameter("month", localDate)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long countShareOfVideoInMonth(LocalDate localDate, String videoId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(s) FROM Share s WHERE MONTH(s.date) = MONTH(:month) AND YEAR(s.date) = YEAR(:month) AND s.videoShare.id = :videoId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("videoId", videoId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long countShareOfUserInMonth(LocalDate localDate, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(s) FROM Share s WHERE MONTH(s.date) = MONTH(:month) AND YEAR(s.date) = YEAR(:month) AND s.videoShare.poster.id = :userId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("userId", userId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
