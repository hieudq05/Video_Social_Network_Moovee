package service.recent.basic;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.defaults.Recent;
import repository.recent.basicQueries.IRecentRepository;
import repository.recent.basicQueries.RecentRepository;

import java.time.LocalDate;
import java.util.List;

public class RecentService implements IRecentService {

    EntityManagerFactory entityManagerFactory;
    IRecentRepository recentRepository;

    public RecentService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        recentRepository = new RecentRepository(entityManagerFactory);
    }

    @Override
    public List<Recent> getRecentsByDate(LocalDate date) {
        return recentRepository.getRecentsByDate(date);
    }

    @Override
    public List<Recent> getRecentsByUserId(String userId) {
        return recentRepository.getRecentsByUserId(userId);
    }

    @Override
    public long selectCountAllRecents() {
        return recentRepository.selectCountAllRecents();
    }

    @Override
    public long selectCountRecentsByUserId(String userId) {
        return recentRepository.selectCountRecentsByUserId(userId);
    }

    @Override
    public long selectCountRecentsByDate(LocalDate date) {
        return recentRepository.selectCountRecentsByDate(date);
    }

    @Override
    public void add(Recent recent) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            recentRepository.add(recent, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void update(Recent recent) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            recentRepository.update(recent, entityManager);
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
            recentRepository.delete(id, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Recent> selectAll() {
        return recentRepository.selectAll();
    }

    @Override
    public Recent selectById(Integer id) {
        return recentRepository.selectById(id);
    }


    @Override
    public long selectCountRecentsByPostId(String postId) {
        return recentRepository.selectCountRecentsByPostId(postId);
    }
}
