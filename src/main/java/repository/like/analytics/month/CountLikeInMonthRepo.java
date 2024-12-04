package repository.like.analytics.month;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
public class CountLikeInMonthRepo implements ICountLikeInMonthRepo {

    EntityManagerFactory entityManagerFactory;

    @Override
    public Long getCountLikeInMonth(LocalDate localDate) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE MONTH(l.date) = MONTH(:month) AND YEAR(l.date) = YEAR(:month)", Long.class)
                    .setParameter("month", localDate)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long getCountLikeOfVideoInMonth(LocalDate localDate, String videoId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE MONTH(l.date) = MONTH(:month) AND YEAR(l.date) = YEAR(:month) AND l.videoLike.id = :videoId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("videoId", videoId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long getCountLikeOfUserInMonth(LocalDate localDate, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE MONTH(l.date) = MONTH(:month) AND YEAR(l.date) = YEAR(:month) AND l.videoLike.poster.id = :userId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("userId", userId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
