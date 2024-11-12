package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.User;

import java.util.List;

public class UserRepository implements IUserRepository {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");

    @Override
    public int add(User user, EntityManager entityManager) {
        try {
            entityManager.persist(user);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int update(User user, EntityManager entityManager) {
        try {
            entityManager.merge(user);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(String id, EntityManager entityManager) {
        try {
            User user = entityManager.find(User.class, id);
            entityManager.remove(user);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> selectAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u", User.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectById(String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.find(User.class, userId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectUserByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class).setParameter("email", email).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectUserByNumber(String number) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u WHERE u.number = :number", User.class).setParameter("number", number).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> selectUserByGender(Boolean gender) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u WHERE u.gender = :gender", User.class).setParameter("gender", gender).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> selectUserByActive(Boolean active) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u WHERE u.active = :active", User.class).setParameter("active", active).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountAllUser() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(u) FROM User u", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountUserByGender(Boolean gender) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(u) FROM User u WHERE u.gender = :gender", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountUserByActive(Boolean active) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(u) FROM User u WHERE u.active = :active", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
