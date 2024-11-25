package repository.video.pagination;

import model.defaults.Video;

import java.util.List;

public interface IVideoLikedPaginationRepository {
    List<Video> getVideoLikedPageOfUserOrderByDate(int page, int pageSize, String userId);

}
