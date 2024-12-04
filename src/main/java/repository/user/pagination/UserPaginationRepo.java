package repository.user.pagination;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import lombok.AllArgsConstructor;
import model.DTO.UserDTO;

import java.util.List;

@AllArgsConstructor
public class UserPaginationRepo implements IUserPaginationRepo {

    EntityManagerFactory entityManagerFactory;

    @Override
    public List<UserDTO> getUserPageOrderByFollower(int page, int pageSize) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            return entityManager.createQuery("""
                        SELECT new model.DTO.UserDTO(u.id, u.fullname, COUNT(f.userFollowed.id), u.avartar)
                        FROM User u
                        LEFT JOIN Follow f ON f.userFollowed.id = u.id
                        GROUP BY u.fullname, u.avartar, u.id
                        ORDER BY COUNT(f.userFollowed) DESC
                    """, UserDTO.class)
                    .setFirstResult(page*pageSize)
                    .setMaxResults(pageSize)
                    .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
