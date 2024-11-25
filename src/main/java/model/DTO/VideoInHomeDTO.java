package model.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import model.defaults.Video;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
public class VideoInHomeDTO {
    private String id;

    private String urlImage;

    private String title;

    private LocalDate postedDate;

    private Long likeCount;

    private Long viewCount;

    private Boolean active;

    private String fullnameUser;

    private String urlAvatarImage;

    private String posterId;
}
