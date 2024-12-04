package repository.user.pagination;

import model.DTO.UserDTO;
import model.DTO.VideoInHomeDTO;

import java.util.List;

public interface IUserPaginationRepo {
    List<UserDTO> getUserPageOrderByFollower(int page, int pageSize);
}
