package repository.follow.basicQueries;

import jakarta.persistence.EntityManager;

public interface IFollowUnfollowRepository {
    void deleteFollowByUserIdAndFollowId(String followId, String userId, EntityManager em);

    Long selectAllFollowersInUserId(String userId);

    Boolean checkFollowedStatusByUserIdAndFollowId(String userId, String followId);
}
