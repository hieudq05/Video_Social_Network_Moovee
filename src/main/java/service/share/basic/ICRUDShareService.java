package service.share.basic;

import model.defaults.Share;
import service.interfaces.IBasicCRUDService;

import java.util.List;

public interface ICRUDShareService extends IBasicCRUDService<Share, Integer> {
    List<Share> getShareByUserId(String userId);

    List<Share> getShareByPostId(String postId);

    long selectCountAllShare();

    long selectCountShareByUserId(String userId);

    long selectCountShareByPostId(String postId);
}
