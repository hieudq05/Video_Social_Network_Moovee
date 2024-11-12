package service;

import model.User;

import java.util.List;

public interface IBasicCRUDUserService extends IBasicCRUDService<User, String> {
     User selectByEmail(String email);

     User selectByNumber(String number);

     List<User> selectByGender(Boolean gender);

     List<User> selectByActive(Boolean active);

     long selectCountAllUsers();

     long selectCountUserByGender(Boolean gender);

     long selectCountUserByActive(Boolean active);
}
