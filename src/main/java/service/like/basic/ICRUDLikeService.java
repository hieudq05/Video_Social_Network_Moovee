package service.like.basic;

import model.defaults.Like;
import service.interfaces.IBasicCRUDService;

import java.util.List;

public interface ICRUDLikeService extends IBasicCRUDService<Like, Long> {
    List<Like> selectLikesByUserId(String userId);

    List<Like> selectLikesByPostId(String postId);

    long selectCountAllLikes();

    long selectCountLikeByUserId(String userId);

    long selectCountLikeByPostId(String postId);
}
