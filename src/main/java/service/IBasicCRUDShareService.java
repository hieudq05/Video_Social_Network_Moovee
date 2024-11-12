package service;

import model.Share;

import java.util.List;

public interface IBasicCRUDShareService extends IBasicCRUDService<Share, Integer> {
    List<Share> getShareByUserId(String userId);

    List<Share> getShareByPostId(String postId);

    long selectCountAllShare();

    long selectCountShareByUserId(String userId);

    long selectCountShareByPostId(String postId);
}
