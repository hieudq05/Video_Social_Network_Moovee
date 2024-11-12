package service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Like;

import java.util.List;

public class BasicLikeService implements IBasicLikeService {

    IBasicLikeService basicLikeService = new BasicLikeService();
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");

    @Override
    public List<Like> selectLikesByUserId(String userId) {
        return basicLikeService.selectLikesByUserId(userId);
    }

    @Override
    public List<Like> selectLikesByPostId(String postId) {
        return basicLikeService.selectLikesByPostId(postId);
    }

    @Override
    public long selectCountAllLikes() {
        return basicLikeService.selectCountAllLikes();
    }

    @Override
    public long selectCountLikeByUserId(String userId) {
        return basicLikeService.selectCountLikeByUserId(userId);
    }

    @Override
    public long selectCountLikeByPostId(String postId) {
        return basicLikeService.selectCountLikeByPostId(postId);
    }

    @Override
    public void add(Like like) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            basicLikeService.add(like);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void update(Like like) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            basicLikeService.update(like);
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
            basicLikeService.delete(id);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Like> selectAll() {
        return basicLikeService.selectAll();
    }

    @Override
    public Like selectById(Integer id) {
        return basicLikeService.selectById(id);
    }
}
