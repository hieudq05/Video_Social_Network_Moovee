package repository.share.basicQueries;

import model.defaults.Share;

import java.util.List;

public interface ISelectShareRepository {
     List<Share> getShareByUserId(String userId);

     List<Share> getShareByPostId(String postId);

     long selectCountAllShare();

     long selectCountShareByUserId(String userId);

     long selectCountShareByPostId(String postId);
}
