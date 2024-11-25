package service.recent.basic;

public interface IRecentService extends ICRUDRecentService {
    long selectCountRecentsByPostId(String postId);
}
