package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Follow;

import java.time.LocalDate;
import java.util.List;

public class FollowRepository implements IFollowRepository {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");

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
            return entityManager.createQuery("SELECT f FROM Follow f WHERE f.user.id = :id", Follow.class).setParameter("id", id).getResultList();
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
            return entityManager.createQuery("SELECT COUNT(f) FROM Follow f WHERE f.user.id = :id", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountFollowsByDate(LocalDate date) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(f) FROM Follow f WHERE f.date = :date", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
