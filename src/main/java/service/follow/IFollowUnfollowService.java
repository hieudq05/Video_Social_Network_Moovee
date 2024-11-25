package service.follow;

public interface IFollowUnfollowService {
    void deleteFollowByUserIdAndFollowId(String followId, String userId);

    Long selectAllFollowersInUserId(String userId);

    Boolean checkFollowedStatusByUserIdAndFollowId(String userId, String followId);
}
