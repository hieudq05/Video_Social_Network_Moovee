package service.video.pagination;

import jakarta.persistence.EntityManagerFactory;
import model.defaults.Video;
import repository.video.pagination.IVideoLikedPaginationRepository;
import repository.video.pagination.VideoLikedPaginationRepository;

import java.util.List;

public class VideoLikedPaginationService {

    EntityManagerFactory entityManagerFactory;
    IVideoLikedPaginationRepository repository;

    public VideoLikedPaginationService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        repository = new VideoLikedPaginationRepository(entityManagerFactory);
    }

    public List<Video> getVideoLikedPageOfUserOrderByDate(int page, int pageSize, String userId) {
        return repository.getVideoLikedPageOfUserOrderByDate(page, pageSize, userId);
    }
}
