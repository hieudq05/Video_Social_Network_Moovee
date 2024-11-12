package model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;

@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Video {
    @Id
    @Column(name = "id", nullable = false, length = 36)
    private String id;

    @Nationalized
    @Lob
    @Column(name = "urlImage", nullable = false)
    private String urlImage;

    @Nationalized
    @Lob
    @Column(name = "urlVideo", nullable = false)
    private String urlVideo;

    @Nationalized
    @Column(name = "title", nullable = false, length = 155)
    private String title;

    @Nationalized
    @Column(name = "decription", nullable = false)
    private String decription;

    @Column(name = "postedDate", nullable = false)
    private Instant postedDate;

    @ColumnDefault("0")
    @Column(name = "viewCount", nullable = false)
    private Integer viewCount;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "poster", nullable = false)
    private User poster;

    @ColumnDefault("1")
    @Column(name = "active", nullable = false)
    private Boolean active = false;

}