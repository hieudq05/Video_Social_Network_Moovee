package service.video.pagination;

import jakarta.persistence.EntityManagerFactory;
import model.defaults.Video;
import model.DTO.VideoInHomeDTO;
import repository.video.pagination.IVideoPaginationRepository;
import repository.video.pagination.VideoPaginationRepository;

import java.util.List;

public class VideoPaginationService implements IVideoPaginationService {

    EntityManagerFactory entityManagerFactory;
    IVideoPaginationRepository videoPaginationRepository;

    public VideoPaginationService(EntityManagerFactory entityManagerFactory) {
        videoPaginationRepository = new VideoPaginationRepository(entityManagerFactory);
        this.entityManagerFactory = entityManagerFactory;
    }

    @Override
    public List<VideoInHomeDTO> getVideoPageOrderByTitle(int page, int pageSize) {
        return videoPaginationRepository.getVideoPageOrderByTitle(page, pageSize);
    }

    @Override
    public List<VideoInHomeDTO> getVideoPageOrderByLike(int page, int pageSize) {
        return videoPaginationRepository.getVideoPageOrderByLike(page, pageSize);
    }

    @Override
    public List<VideoInHomeDTO> getVideoPageOrderByPostedDate(int page, int pageSize) {
        return videoPaginationRepository.getVideoPageOrderByPostedDate(page, pageSize);
    }

    @Override
    public List<Video> getVideoPageOfUserOrderByTitle(int page, int pageSize, String userId) {
        return videoPaginationRepository.getVideoPageOfUserOrderByTitle(page, pageSize, userId);
    }

    @Override
    public List<Video> getVideoPageOfUserOrderByLike(int page, int pageSize, String userId) {
        return videoPaginationRepository.getVideoPageOfUserOrderByLike(page, pageSize, userId);
    }

    @Override
    public List<Video> getVideoPageOfUserOrderByPostedDate(int page, int pageSize, String userId) {
        return videoPaginationRepository.getVideoPageOfUserOrderByPostedDate(page, pageSize, userId);
    }
}
