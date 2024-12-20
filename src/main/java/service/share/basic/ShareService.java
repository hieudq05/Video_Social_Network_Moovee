package service.share.basic;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.defaults.Share;
import repository.share.basicQueries.IShareRepository;
import repository.share.basicQueries.ShareRepository;
import java.util.List;

public class ShareService implements IShareService {

    IShareRepository shareRepository;
    EntityManagerFactory entityManagerFactory;
    public ShareService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        this.shareRepository = new ShareRepository(entityManagerFactory);
    }

    @Override
    public List<Share> getShareByUserId(String userId) {
        return shareRepository.getShareByUserId(userId);
    }

    @Override
    public List<Share> getShareByPostId(String postId) {
        return shareRepository.getShareByPostId(postId);
    }

    @Override
    public long selectCountAllShare() {
        return shareRepository.selectCountAllShare();
    }

    @Override
    public long selectCountShareByUserId(String userId) {
        return shareRepository.selectCountShareByUserId(userId);
    }

    @Override
    public long selectCountShareByPostId(String postId) {
        return shareRepository.selectCountShareByPostId(postId);
    }

    @Override
    public void add(Share share) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            shareRepository.add(share, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void update(Share share) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            shareRepository.update(share, entityManager);
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
            shareRepository.delete(id, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Share> selectAll() {
        return shareRepository.selectAll();
    }

    @Override
    public Share selectById(Integer id) {
        return shareRepository.selectById(id);
    }
}
