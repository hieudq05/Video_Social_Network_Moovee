package repository.recent.basicQueries;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Recent;

import java.time.LocalDate;
import java.util.List;

@AllArgsConstructor
public class RecentRepository implements IRecentRepository {

    EntityManagerFactory entityManagerFactory;

    @Override
    public int add(Recent recent, EntityManager entityManager) {
        try {
            entityManager.persist(recent);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int update(Recent entity, EntityManager entityManager) {
        try {
            entityManager.merge(entity);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int delete(Integer recent, EntityManager entityManager) {
        try {
            entityManager.remove(entityManager.find(Recent.class, recent));
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<Recent> selectAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT r FROM Recent r", Recent.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Recent selectById(Integer id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.find(Recent.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Recent> getRecentsByDate(LocalDate date) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT r FROM Recent r WHERE r.date = :date", Recent.class).setParameter("date", date).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Recent> getRecentsByUserId(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT r FROM Recent r WHERE r.user.id = :userId", Recent.class).setParameter("userId", userId).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountAllRecents() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(r) FROM Recent r", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountRecentsByUserId(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
             return entityManager.createQuery("SELECT COUNT(r) FROM Recent r WHERE r.user.id = :userId", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountRecentsByDate(LocalDate date) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(r) FROM Recent r WHERE r.date = :date", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountRecentsByPostId(String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(r) FROM Recent r WHERE r.video.id = :postId", Long.class)
                    .setParameter("postId", postId)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
