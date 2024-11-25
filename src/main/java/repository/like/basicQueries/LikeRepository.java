package repository.like.basicQueries;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Like;
import java.util.List;

@AllArgsConstructor
public class LikeRepository implements ILikeRepository {

    EntityManagerFactory entityManagerFactory;

    @Override
    public int add(Like like, EntityManager entityManager) {
        try {
            entityManager.persist(like);
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
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int update(Like like, EntityManager entityManager) {
        try {
            entityManager.merge(like);
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
            return entityManager.createQuery("SELECT l FROM Like l WHERE l.videoLike.id = :videoId", Like.class).setParameter("videoId", postId).getResultList();
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
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE l.userLike.id = :userId", Long.class)
                    .setParameter("userId", userId).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountLikeByPostId(String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE l.videoLike.id = :videoId", Long.class)
                    .setParameter("videoId", postId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteLikeByUserIdAndPostId(String userId, String postId, EntityManager entityManager) {
        try {
            entityManager.createQuery("DELETE FROM Like l WHERE l.userLike.id = :userId AND l.videoLike.id = :postId")
                    .setParameter("userId", userId)
                    .setParameter("postId", postId)
                    .executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Long selectAllLikeInPostId(String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) FROM Like l WHERE l.videoLike.id = :postId", Long.class)
                    .setParameter("postId", postId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean checkLikedStatusByUserIdAndPostId(String userId, String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(l) > 0 FROM Like l WHERE l.videoLike.id = :postId AND l.userLike.id = :userId", Boolean.class)
                    .setParameter("postId", postId)
                    .setParameter("userId", userId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
