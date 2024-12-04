package service.like.basic;

public interface ILikeDislikeService {
    void deleteLikeByUserIdAndPostId(String userId, String postId);

    Long selectAllLikeInPostId(String postId);

    Boolean checkLikedStatusByUserIdAndPostId(String userId, String postId);
}
