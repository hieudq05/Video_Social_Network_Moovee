package service.video.pagination;

import jakarta.persistence.EntityManagerFactory;
import model.defaults.Video;
import repository.video.pagination.IVideoSharedPaginationRepository;
import repository.video.pagination.VideoSharedPaginationRepository;

import java.util.List;

public class VideoSharedPaginationService {

    EntityManagerFactory entityManagerFactory;
    IVideoSharedPaginationRepository repository;

    public VideoSharedPaginationService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        repository = new VideoSharedPaginationRepository(entityManagerFactory);
    }

    public List<Video> getVideoSharedPageOfUserOrderByDate(int page, int pageSize, String userId) {
        return repository.getVideoSharedPageOfUserOrderByDate(page, pageSize, userId);
    }
}
