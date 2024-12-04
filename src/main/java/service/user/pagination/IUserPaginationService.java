package service.user.pagination;

import model.DTO.UserDTO;

import java.util.List;

public interface IUserPaginationService {
    List<UserDTO> getUserPageOrderByFollower(int page, int pageSize);

}
