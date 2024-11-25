package repository.follow.basicQueries;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Follow;

import java.time.LocalDate;
import java.util.List;

@AllArgsConstructor
public class FollowRepository implements IFollowRepository {

    EntityManagerFactory entityManagerFactory;

    @Override
    public int add(Follow follow, EntityManager entityManager) {
        try {
            entityManager.persist(follow);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int update(Follow entity, EntityManager entityManager) {
        try {
            entityManager.merge(entity);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(Integer followId, EntityManager entityManager) {
        try {
            Follow follow = entityManager.find(Follow.class, followId);
            entityManager.remove(follow);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Follow> selectAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT f FROM Follow f", Follow.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Follow selectById(Integer id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.find(Follow.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Follow> selectFollowsByUser(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT f FROM Follow f WHERE f.userFollow.id = :id", Follow.class).setParameter("id", id).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Follow> selectFollowsByDate(LocalDate date) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT f FROM Follow f WHERE f.date = :date", Follow.class).setParameter("date", date).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Follow> selectFollowersFollowUser(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT f FROM Follow f WHERE f.userFollowed.id = :id", Follow.class).setParameter("id", id).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountAllFollows() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(f) FROM Follow f", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountFollowsByUser(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(f) FROM Follow f WHERE f.userFollow.id = :id", Long.class).setParameter("id", id).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountFollowsByDate(LocalDate date) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(f) FROM Follow f WHERE f.date = :date", Long.class).setParameter("date", date).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountUserFollows(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(f) FROM Follow f WHERE f.userFollowed.id = :id", Long.class).setParameter("id", id).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteFollowByUserIdAndFollowId(String followId, String userId, EntityManager em) {
        try {
            em.createQuery("DELETE FROM Follow f WHERE f.userFollow.id = :userId AND f.userFollowed.id = :followId")
                    .setParameter("userId", userId)
                    .setParameter("followId", followId)
                    .executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Long selectAllFollowersInUserId(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT f FROM Follow f WHERE f.userFollow.id = :userId", Long.class)
                    .setParameter("userId", userId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean checkFollowedStatusByUserIdAndFollowId(String userId, String followId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(f) > 0 FROM Follow f WHERE f.userFollow.id = :userId AND f.userFollowed.id = :followId", Boolean.class)
                    .setParameter("userId", userId)
                    .setParameter("followId", followId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
