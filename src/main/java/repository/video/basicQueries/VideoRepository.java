package repository.video.basicQueries;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Video;

import java.time.LocalDate;
import java.util.List;

@AllArgsConstructor
public class VideoRepository implements IVideoRepository {

    EntityManagerFactory entityManagerFactory;

    @Override
    public int add(Video video, EntityManager entityManager) {
        try {
            entityManager.persist(video);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int update(Video video, EntityManager entityManager) {
        try {
            entityManager.merge(video);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delete(String id, EntityManager entityManager) {
        try {
            Video video = entityManager.find(Video.class, id);
            entityManager.remove(video);
            return 1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Video> selectAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT v FROM Video v", Video.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Video selectById(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.find(Video.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Video> selectVideoByPosterId(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT v FROM Video v WHERE v.poster.id = :posterId", Video.class).setParameter("posterId", id).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Video> selectVideoByTitleOrDescription(String data) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT v FROM Video v WHERE v.decription LIKE :description OR v.title LIKE :title", Video.class)
                    .setParameter("description", "%" + data + "%")
                    .setParameter("title", "%" + data + "%")
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Video> selectVideoByPostedDate(LocalDate postedDate) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT v FROM Video v WHERE v.postedDate = :postedDate", Video.class)
                    .setParameter("postedDate", postedDate)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountAllVideos() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(*) FROM Video", Long.class).getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountVideoByTitleAndDescription(String data) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(v) FROM Video v WHERE v.decription LIKE :description OR v.title LIKE :title", Long.class)
                    .setParameter("description", "%" + data + "%")
                    .setParameter("title", "%" + data + "%")
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountVideoByPostedDate(LocalDate postedDate) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(v) FROM Video v WHERE v.postedDate = :postedDate", Long.class)
                    .setParameter("postedDate", postedDate)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public long selectCountVideoByPosterId(String id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT COUNT(v) FROM Video v WHERE v.poster.id = :id", Long.class)
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
