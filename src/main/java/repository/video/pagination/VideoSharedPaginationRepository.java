package repository.video.pagination;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.AllArgsConstructor;
import model.defaults.Video;

import java.util.List;

@AllArgsConstructor
public class VideoSharedPaginationRepository implements IVideoSharedPaginationRepository {

    EntityManagerFactory entityManagerFactory;

    @Override
    public List<Video> getVideoSharedPageOfUserOrderByDate(int page, int pageSize, String userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("SELECT s.videoShare FROM Share s WHERE s.userShare.id = :userId ORDER BY s.date DESC", Video.class)
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
