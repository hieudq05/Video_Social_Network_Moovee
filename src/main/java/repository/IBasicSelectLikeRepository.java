package repository;

import model.Like;

import java.util.List;

public interface IBasicSelectLikeRepository {
    List<Like> selectLikesByUserId(String userId);

    List<Like> selectLikesByPostId(String postId);

    long selectCountAllLikes();

    long selectCountLikeByUserId(String userId);

    long selectCountLikeByPostId(String postId);
}
