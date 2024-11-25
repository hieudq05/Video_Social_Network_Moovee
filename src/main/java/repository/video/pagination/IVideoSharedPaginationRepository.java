package repository.video.pagination;

import model.defaults.Video;

import java.util.List;

public interface IVideoSharedPaginationRepository {
    List<Video> getVideoSharedPageOfUserOrderByDate(int page, int pageSize, String userId);
}
