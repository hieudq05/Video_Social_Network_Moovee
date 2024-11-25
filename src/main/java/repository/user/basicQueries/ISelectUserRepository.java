package repository.user.basicQueries;

import model.defaults.User;

import java.util.List;

public interface ISelectUserRepository {
    User selectUserByEmail(String email);

    User selectUserByNumber(String number);

    List<User> selectUserByGender(Boolean gender);

    List<User> selectUserByActive(Boolean active);

    long selectCountAllUser();

    long selectCountUserByGender(Boolean gender);

    long selectCountUserByActive(Boolean active);

}
