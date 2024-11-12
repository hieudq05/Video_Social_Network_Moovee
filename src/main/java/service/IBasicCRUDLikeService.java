package service;

import model.Like;

import java.util.List;

public interface IBasicCRUDLikeService extends IBasicCRUDService<Like, Integer> {
    List<Like> selectLikesByUserId(String userId);

    List<Like> selectLikesByPostId(String postId);

    long selectCountAllLikes();

    long selectCountLikeByUserId(String userId);

    long selectCountLikeByPostId(String postId);
}
