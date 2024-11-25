package repository.like.basicQueries;

import model.defaults.Like;

import java.util.List;

public interface ISelectLikeRepository {
    List<Like> selectLikesByUserId(String userId);

    List<Like> selectLikesByPostId(String postId);

    long selectCountAllLikes();

    long selectCountLikeByUserId(String userId);

    long selectCountLikeByPostId(String postId);
}
