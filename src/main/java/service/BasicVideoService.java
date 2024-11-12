package service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.Video;
import repository.IVideoRepository;
import repository.VideoRepository;

import java.time.LocalDate;
import java.util.List;

public class BasicVideoService implements IBasicVideoService {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("video");
    IVideoRepository videoRepository = new VideoRepository();

    @Override
    public List<Video> selectByPosterId(String posterId) {
        return videoRepository.selectVideoByPosterId(posterId);
    }

    @Override
    public List<Video> selectByTitleAndDescription(String data) {
        return videoRepository.selectVideoByTitleOrDescription(data);
    }

    @Override
    public long selectCountVideoByPostedDate(LocalDate postedDate) {
        return videoRepository.selectCountVideoByPostedDate(postedDate);
    }

    @Override
    public long selectCountVideoByPosterId(String id) {
        return videoRepository.selectCountVideoByPosterId(id);
    }

    @Override
    public void add(Video video) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            videoRepository.add(video, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void update(Video video) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            videoRepository.update(video, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public void delete(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            videoRepository.delete(id, entityManager);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<Video> selectAll() {
        return videoRepository.selectAll();
    }

    @Override
    public Video selectById(String id) {
        return videoRepository.selectById(id);
    }
}
