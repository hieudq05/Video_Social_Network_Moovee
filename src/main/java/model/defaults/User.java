package model.defaults;

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
@Table(name = "\"User\"")
public class User {
    @Id
    @Column(name = "id", nullable = false, length = 36)
    private String id;

    @Column(name = "email", nullable = false, length = 75)
    private String email;

    @Column(name = "password", nullable = false, length = 50)
    private String password;

    @Column(name = "number", nullable = false, length = 41)
    private String number;

    @Nationalized
    @Column(name = "fullname", nullable = false, length = 105)
    private String fullname;

    @Column(name = "gender")
    private Boolean gender;

    @Column(name = "role", nullable = false)
    private Boolean role = false;

    @Column(name = "registerDate", nullable = false)
    private LocalDate registerDate;

    @ColumnDefault("1")
    @Column(name = "active", nullable = false)
    private Boolean active = false;

    @Nationalized
    @Column(name = "avartar")
    private String avartar;

    @Nationalized
    @Column(name = "coverImage")
    private String coverImage;

    @OneToMany(mappedBy = "userComment", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Comment> comments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "userFollow", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Follow> followers = new LinkedHashSet<>();

    @OneToMany(mappedBy = "userFollowed", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Follow> follows = new LinkedHashSet<>();

    @OneToMany(mappedBy = "userLike", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Like> likes = new LinkedHashSet<>();

    @OneToMany(mappedBy = "userLog", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Log> logs = new LinkedHashSet<>();

    @OneToMany(mappedBy = "userRecent", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Recent> recents = new LinkedHashSet<>();

    @OneToMany(mappedBy = "userShare", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Share> shares = new LinkedHashSet<>();

    @OneToMany(mappedBy = "poster", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Video> videos = new LinkedHashSet<>();

}