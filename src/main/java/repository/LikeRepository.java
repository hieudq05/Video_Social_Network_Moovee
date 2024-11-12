package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Like;
import java.util.List;

public class LikeRepository implements ILikeRepository {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");

    @Override
    public int add(Like like, EntityManager entityManager) {
        try {
            entityManager.persist(like);
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(Long id, EntityManager entityManager) {
        try {
            Like like = entityManager.find(Like.class, id);
            entityManager.remove(like);
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int update(Like like, EntityManager entityManager) {
        entityManager.getTransaction().begin();
        try {
            entityManager.merge(like);
            entityManager.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Like> selectAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT l FROM Like l", Like.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Like selectById(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.find(Like.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Like> selectLikesByUserId(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT l FROM Like l WHERE l.id = :id", Like.class).setParameter("id", userId).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Like> selectLikesByPostId(String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT l FROM Like l WHERE l.video.id = :videoId", Like.class).setParameter("videoId", postId).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountAllLikes() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountLikeByUserId(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE l.user.id = :userId", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountLikeByPostId(String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE l.video.id = :videoId", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
