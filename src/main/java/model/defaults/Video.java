package model.defaults;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
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

    @Column(name = "postedDate")
    private LocalDate postedDate;

    @ColumnDefault("0")
    @Column(name = "viewCount", nullable = false)
    private Integer viewCount;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JsonBackReference
    @JoinColumn(name = "poster", nullable = false)
    private User poster;

    @ColumnDefault("1")
    @Column(name = "active", nullable = false)
    private Boolean active = false;

    @OneToMany(mappedBy = "videoComment", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Comment> comments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "videoLike", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Like> likes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "videoRecent", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Recent> recents = new LinkedHashSet<>();

    @OneToMany(mappedBy = "videoShare", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Share> shares = new LinkedHashSet<>();

}