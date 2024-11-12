package service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Follow;
import repository.FollowRepository;
import repository.IFollowRepository;

import java.time.LocalDate;
import java.util.List;

public class BasicFollowService implements IBasicFollowService {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");
    IFollowRepository followRepository = new FollowRepository();

    @Override
    public List<Follow> selectFollowsByUser(String id) {
        return followRepository.selectFollowsByUser(id);
    }

    @Override
    public List<Follow> selectFollowsByDate(LocalDate date) {
        return followRepository.selectFollowsByDate(date);
    }

    @Override
    public long selectCountAllFollows() {
        return followRepository.selectCountAllFollows();
    }

    @Override
    public long selectCountFollowsByUser(String id) {
        return followRepository.selectCountFollowsByUser(id);
    }

    @Override
    public long selectCountFollowsByDate(LocalDate date) {
        return followRepository.selectCountFollowsByDate(date);
    }

    @Override
    public void add(Follow entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            followRepository.add(entity, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void update(Follow entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            followRepository.update(entity, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void delete(Integer id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            followRepository.delete(id, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Follow> selectAll() {
        return followRepository.selectAll();
    }

    @Override
    public Follow selectById(Integer id) {
        return followRepository.selectById(id);
    }
}
