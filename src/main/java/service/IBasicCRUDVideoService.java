package service;

import model.Video;

import java.time.LocalDate;
import java.util.List;

public interface IBasicCRUDVideoService extends IBasicCRUDService<Video, String> {
    List<Video> selectByPosterId(String posterId);

    List<Video> selectByTitleAndDescription(String data);

    long selectCountVideoByPostedDate(LocalDate postedDate);

    long selectCountVideoByPosterId(String id);
}
