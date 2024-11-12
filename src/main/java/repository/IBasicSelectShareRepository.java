package repository;

import model.Share;

import java.util.List;

public interface IBasicSelectShareRepository {
     List<Share> getShareByUserId(String userId);

     List<Share> getShareByPostId(String postId);

     long selectCountAllShare();

     long selectCountShareByUserId(String userId);

     long selectCountShareByPostId(String postId);
}
