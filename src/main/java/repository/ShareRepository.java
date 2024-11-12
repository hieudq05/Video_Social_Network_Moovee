package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Share;

import java.util.List;

public class ShareRepository implements IShareRepository {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");

    @Override
    public int add(Share entity, EntityManager entityManager) {
        try {
            entityManager.persist(entity);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int update(Share entity, EntityManager entityManager) {
        try {
            entityManager.merge(entity);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(Integer integer, EntityManager entityManager) {
        try {
            entityManager.remove(integer);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Share> selectAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT s FROM Share s", Share.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Share selectById(Integer integer) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.find(Share.class, integer);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Share> getShareByUserId(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT s FROM Share s WHERE s.user.id = :userId", Share.class).setParameter("userId", userId).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Share> getShareByPostId(String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT s FROM Share s WHERE s.video.id = :postId", Share.class).setParameter("postId", postId).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountAllShare() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(s) FROM Share s", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountShareByUserId(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(s) FROM Share s WHERE s.user.id = :userId", Long.class)
                    .setParameter("userId", userId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountShareByPostId(String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(s) FROM Share s WHERE s.video.id = :postId", Long.class)
                    .setParameter("postId", postId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
