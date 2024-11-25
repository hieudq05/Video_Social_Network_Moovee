package service.video.pagination;

import model.defaults.Video;
import model.DTO.VideoInHomeDTO;

import java.util.List;

public interface IVideoPaginationService {
    List<VideoInHomeDTO> getVideoPageOrderByTitle(int page, int pageSize);

    List<VideoInHomeDTO> getVideoPageOrderByLike(int page, int pageSize);

    List<VideoInHomeDTO> getVideoPageOrderByPostedDate(int page, int pageSize);

    List<Video> getVideoPageOfUserOrderByTitle(int page, int pageSize, String userId);

    List<Video> getVideoPageOfUserOrderByLike(int page, int pageSize, String userId);

    List<Video> getVideoPageOfUserOrderByPostedDate(int page, int pageSize, String userId);
}
