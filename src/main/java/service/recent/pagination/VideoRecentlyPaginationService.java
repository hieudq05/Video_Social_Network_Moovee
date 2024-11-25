package service.recent.pagination;

import jakarta.persistence.EntityManagerFactory;
import model.defaults.Video;
import repository.video.pagination.IVideoRecentlyPaginationRepository;
import repository.video.pagination.VideoRecentlyPaginationRepository;

import java.util.List;

public class VideoRecentlyPaginationService {

    EntityManagerFactory entityManagerFactory;
    IVideoRecentlyPaginationRepository repository;

    public VideoRecentlyPaginationService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        repository = new VideoRecentlyPaginationRepository(entityManagerFactory);
    }

    public List<Video> getVideoRecentPageOfUserOrderByDate(int page, int pageSize, String userId) {
        return repository.getVideoRecentPageOfUserOrderByDate(page, pageSize, userId);
    }
}
