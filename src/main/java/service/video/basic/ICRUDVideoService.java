package service.video.basic;

import model.defaults.Video;
import service.interfaces.IBasicCRUDService;

import java.time.LocalDate;
import java.util.List;

public interface ICRUDVideoService extends IBasicCRUDService<Video, String> {
    List<Video> selectByPosterId(String posterId);

    List<Video> selectByTitleAndDescription(String data);

    long selectCountVideoByPostedDate(LocalDate postedDate);

    long selectCountVideoByPosterId(String id);
}
