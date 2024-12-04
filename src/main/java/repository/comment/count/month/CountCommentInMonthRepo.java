package repository.comment.count.month;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
public class CountCommentInMonthRepo implements ICountCommentInMonthRepo {

    EntityManagerFactory entityManagerFactory;

    @Override
    public Long countCommentInMonth(LocalDate localDate) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(c) FROM Comment c WHERE MONTH(c.commentDate) = MONTH(:month) AND YEAR(c.commentDate) = YEAR(:month)", Long.class)
                    .setParameter("month", localDate)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long countCommentOfVideoInMonth(LocalDate localDate, String videoId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(c) FROM Comment c WHERE MONTH(c.commentDate) = MONTH(:month) AND YEAR(c.commentDate) = YEAR(:month) AND c.videoComment.id = :videoId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("videoId", videoId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long countCommentOfUserInMonth(LocalDate localDate, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(c) FROM Comment c WHERE MONTH(c.commentDate) = MONTH(:month) AND YEAR(c.commentDate) = YEAR(:month) AND c.videoComment.poster.id = :userId", Long.class)
                    .setParameter("month", localDate)
                    .setParameter("userId", userId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
