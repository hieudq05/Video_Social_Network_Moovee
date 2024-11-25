package repository.like.basicQueries;

import jakarta.persistence.EntityManager;

public interface ILikeDislikeRepository {
    void deleteLikeByUserIdAndPostId(String userId, String postId, EntityManager em);

    Long selectAllLikeInPostId(String postId);

    Boolean checkLikedStatusByUserIdAndPostId(String userId, String postId);
}
