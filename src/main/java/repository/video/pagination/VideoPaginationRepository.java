package repository.video.pagination;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Video;
import model.DTO.VideoInHomeDTO;

import java.util.List;

public class VideoPaginationRepository implements IVideoPaginationRepository {

    EntityManagerFactory entityManagerFactory;

    public VideoPaginationRepository(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
    }

    @Override
    public List<VideoInHomeDTO> getVideoPageOrderByTitle(int page, int pageSize) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("""
                        SELECT new model.DTO.VideoInHomeDTO(v.id, v.urlImage, v.title, v.postedDate, COUNT(l.videoLike.id) , COUNT(r.videoRecent.id), v.active , u.fullname, u.avartar, u.id)
                        FROM Video v
                        LEFT JOIN Like l ON l.videoLike.id = v.id
                        LEFT JOIN Recent r ON r.videoRecent.id = v.id
                        JOIN User u ON u.id = v.poster.id
                        GROUP BY v.id, v.title, v.urlImage, v.postedDate, v.active, u.id, u.fullname, u.avartar
                        ORDER BY v.title
                    """, VideoInHomeDTO.class)
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<VideoInHomeDTO> getVideoPageOrderByLike(int page, int pageSize) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("""
                        SELECT new model.DTO.VideoInHomeDTO(v.id, v.urlImage, v.title, v.postedDate, COUNT(l.videoLike.id) , COUNT(r.videoRecent.id), v.active , u.fullname, u.avartar, u.id)
                        FROM Video v
                        LEFT JOIN Like l ON l.videoLike.id = v.id
                        LEFT JOIN Recent r ON r.videoRecent.id = v.id
                        JOIN User u ON u.id = v.poster.id
                        GROUP BY v.id, v.title, v.urlImage, v.postedDate, v.active, u.id, u.fullname, u.avartar
                        ORDER BY COUNT(l.videoLike.id) DESC 
                    """, VideoInHomeDTO.class)
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Video> getVideoPageOfUserOrderByTitle(int page, int pageSize, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("FROM Video v WHERE v.poster.id = :userId ORDER BY v.title", Video.class)
                    .setParameter("userId", userId)
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Video> getVideoPageOfUserOrderByLike(int page, int pageSize, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("FROM Video v WHERE v.poster.id = :userId ORDER BY v.likes.size DESC", Video.class)
                    .setParameter("userId", userId)
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Video> getVideoPageOfUserOrderByPostedDate(int page, int pageSize, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("FROM Video v WHERE v.poster.id = :userId ORDER BY v.postedDate DESC", Video.class)
                    .setParameter("userId", userId)
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<VideoInHomeDTO> getVideoPageOrderByPostedDate(int page, int pageSize) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("""
                        SELECT new model.DTO.VideoInHomeDTO(v.id, v.urlImage, v.title, v.postedDate, COUNT(l.videoLike.id) , COUNT(r.videoRecent.id), v.active , u.fullname, u.avartar, u.id)
                        FROM Video v
                        LEFT JOIN Like l ON l.videoLike.id = v.id
                        LEFT JOIN Recent r ON r.videoRecent.id = v.id
                        JOIN User u ON u.id = v.poster.id
                        GROUP BY v.id, v.title, v.urlImage, v.postedDate, v.active, u.id, u.fullname, u.avartar
                        ORDER BY v.postedDate DESC
                            """, VideoInHomeDTO.class
                    )
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
