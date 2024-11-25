package service.follow.basic;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.defaults.Follow;
import repository.follow.basicQueries.FollowRepository;
import repository.follow.basicQueries.IFollowRepository;

import java.time.LocalDate;
import java.util.List;

public class FollowService implements IFollowService {

    EntityManagerFactory entityManagerFactory;
    IFollowRepository followRepository;

    public FollowService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        this.followRepository = new FollowRepository(entityManagerFactory);
    }

    @Override
    public List<Follow> selectFollowsByUser(String id) {
        return followRepository.selectFollowsByUser(id);
    }

    @Override
    public List<Follow> selectFollowsByDate(LocalDate date) {
        return followRepository.selectFollowsByDate(date);
    }

    @Override
    public List<Follow> selectFollowersFollowUser(String id) {
        return followRepository.selectFollowersFollowUser(id);
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
    public long selectCountUserFollow(String id) {
        return followRepository.selectCountUserFollows(id);
    }

    @Override
    public void add(Follow entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            followRepository.add(entity, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
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

    @Override
    public void deleteFollowByUserIdAndFollowId(String followId, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            followRepository.deleteFollowByUserIdAndFollowId(followId, userId, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public Long selectAllFollowersInUserId(String userId) {
        return followRepository.selectAllFollowersInUserId(userId);
    }

    @Override
    public Boolean checkFollowedStatusByUserIdAndFollowId(String userId, String followId) {
        return followRepository.checkFollowedStatusByUserIdAndFollowId(userId, followId);
    }
}
