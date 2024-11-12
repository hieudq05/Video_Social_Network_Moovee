package repository;

import model.Video;

import java.time.LocalDate;
import java.util.List;

public interface IBasicSelectVideoRepository {
    List<Video> selectVideoByPosterId(String id);

    List<Video> selectVideoByTitleOrDescription(String data);

    List<Video> selectVideoByPostedDate(LocalDate postedDate);

    long selectCountAllVideos();

    long selectCountVideoByTitleAndDescription(String data);

    long selectCountVideoByPostedDate(LocalDate postedDate);

    long selectCountVideoByPosterId(String id);
}
