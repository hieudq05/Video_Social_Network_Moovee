package service.user.basic;

import model.defaults.User;
import service.interfaces.IBasicCRUDService;

import java.util.List;

public interface ICRUDUserService extends IBasicCRUDService<User, String> {
     User selectByEmail(String email);

     User selectByNumber(String number);

     List<User> selectByGender(Boolean gender);

     List<User> selectByActive(Boolean active);

     long selectCountAllUsers();

     long selectCountUserByGender(Boolean gender);

     long selectCountUserByActive(Boolean active);
}
