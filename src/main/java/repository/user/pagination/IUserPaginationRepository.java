package repository.user.pagination;

import model.defaults.User;

import java.util.List;

public interface IUserPaginationRepository {
    List<User> getUserPageData(int page, int pageSize);
}
