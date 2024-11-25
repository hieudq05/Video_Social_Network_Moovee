package repository.video.pagination;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Video;

import java.util.List;

@AllArgsConstructor
public class VideoLikedPaginationRepository implements IVideoLikedPaginationRepository {

    EntityManagerFactory entityManagerFactory;

    @Override
    public List<Video> getVideoLikedPageOfUserOrderByDate(int page, int pageSize, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT l.videoLike FROM Like l WHERE l.userLike.id = :userId ORDER BY l.date DESC ", Video.class)
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
