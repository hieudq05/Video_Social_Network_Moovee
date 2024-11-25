package repository.video.pagination;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Video;

import java.util.List;

@AllArgsConstructor
public class VideoRecentlyPaginationRepository implements IVideoRecentlyPaginationRepository {

    EntityManagerFactory entityManagerFactory;

    @Override
    public List<Video> getVideoRecentPageOfUserOrderByDate(int page, int pageSize, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT r.videoRecent FROM Recent r WHERE r.userRecent.id = :userId ORDER BY r.date DESC", Video.class)
                    .setParameter("userId", userId)
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
