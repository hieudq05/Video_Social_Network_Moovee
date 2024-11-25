package service.user.basic;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.defaults.User;
import repository.user.basicQueries.IUserRepository;
import repository.user.basicQueries.UserRepository;
import java.util.List;

public class UserService implements IUserService {

    EntityManagerFactory entityManagerFactory;
    IUserRepository userRepository;

    public UserService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        userRepository = new UserRepository(entityManagerFactory);
    }

    @Override
    public User selectByEmail(String email) {
        return userRepository.selectUserByEmail(email);
    }

    @Override
    public User selectByNumber(String number) {
        return userRepository.selectUserByNumber(number);
    }

    @Override
    public List<User> selectByGender(Boolean gender) {
        return userRepository.selectUserByGender(gender);

    }

    @Override
    public List<User> selectByActive(Boolean active) {
        return userRepository.selectUserByActive(active);
    }

    @Override
    public long selectCountAllUsers() {
        return userRepository.selectCountAllUser();
    }

    @Override
    public long selectCountUserByGender(Boolean gender) {
        return userRepository.selectCountUserByGender(gender);

    }

    @Override
    public long selectCountUserByActive(Boolean active) {
        return userRepository.selectCountUserByActive(active);

    }

    @Override
    public void add(User user) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            userRepository.add(user, em);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }

    }

    @Override
    public void update(User user) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            userRepository.update(user, em);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(String s) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            userRepository.delete(s, em);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }

    @Override
    public List<User> selectAll() {
        return userRepository.selectAll();
    }

    @Override
    public User selectById(String s) {
        return userRepository.selectById(s);
    }
}
