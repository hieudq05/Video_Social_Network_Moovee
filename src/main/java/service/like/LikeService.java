package service.like;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.defaults.Like;
import repository.like.basicQueries.ILikeRepository;
import repository.like.basicQueries.LikeRepository;

import java.util.List;

public class LikeService implements ILikeService {

    EntityManagerFactory entityManagerFactory;
    ILikeRepository likeRepository;

    public LikeService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        likeRepository = new LikeRepository(entityManagerFactory);
    }

    @Override
    public List<Like> selectLikesByUserId(String userId) {
        return likeRepository.selectLikesByUserId(userId);
    }

    @Override
    public List<Like> selectLikesByPostId(String postId) {
        return likeRepository.selectLikesByPostId(postId);
    }

    @Override
    public long selectCountAllLikes() {
        return likeRepository.selectCountAllLikes();
    }

    @Override
    public long selectCountLikeByUserId(String userId) {
        return likeRepository.selectCountLikeByUserId(userId);
    }

    @Override
    public long selectCountLikeByPostId(String postId) {
        return likeRepository.selectCountLikeByPostId(postId);
    }

    @Override
    public void add(Like like) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            likeRepository.add(like, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
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
            likeRepository.update(like, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void delete(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            likeRepository.delete(id, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Like> selectAll() {
        return likeRepository.selectAll();
    }

    @Override
    public Like selectById(Long id) {
        return likeRepository.selectById(id);
    }

    @Override
    public void deleteLikeByUserIdAndPostId(String userId, String postId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            likeRepository.deleteLikeByUserIdAndPostId(userId, postId, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public Long selectAllLikeInPostId(String postId) {
        return likeRepository.selectAllLikeInPostId(postId);
    }

    @Override
    public Boolean checkLikedStatusByUserIdAndPostId(String userId, String postId) {
        return likeRepository.checkLikedStatusByUserIdAndPostId(userId, postId);
    }
}
