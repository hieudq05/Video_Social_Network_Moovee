package model.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserDTO {
    private String userId;

    private String fullName;

    private Long follower;

    private String avatarImage;
}
