package service.user.pagination;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import model.DTO.UserDTO;
import repository.user.pagination.IUserPaginationRepo;
import repository.user.pagination.UserPaginationRepo;

import java.util.List;

public class UserPaginationService implements IUserPaginationService {

    EntityManagerFactory entityManagerFactory;
    IUserPaginationRepo userPaginationRepo;

    public UserPaginationService(EntityManagerFactory entityManagerFactory) {
        this.entityManagerFactory = entityManagerFactory;
        userPaginationRepo = new UserPaginationRepo(entityManagerFactory);
    }

    @Override
    public List<UserDTO> getUserPageOrderByFollower(int page, int pageSize) {
        return userPaginationRepo.getUserPageOrderByFollower(page, pageSize);
    }
}
