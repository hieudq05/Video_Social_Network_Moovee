package repository.video.pagination;

import model.defaults.Video;

import java.util.List;

public interface IVideoRecentlyPaginationRepository {

    List<Video> getVideoRecentPageOfUserOrderByDate(int page, int pageSize, String userId);

}
