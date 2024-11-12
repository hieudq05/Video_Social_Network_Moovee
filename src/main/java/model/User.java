package model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "\"User\"")
public class User {
    @Id
    @Column(name = "id", nullable = false, length = 36)
    private String id;

    @Column(name = "email", nullable = false, length = 75)
    private String email;

    @Column(name = "password", nullable = false, length = 50)
    private String password;

    @Column(name = "number", nullable = false, length = 16)
    private String number;

    @Nationalized
    @Column(name = "fullname", nullable = false, length = 105)
    private String fullname;

    @Column(name = "gender", nullable = false)
    private Boolean gender = false;

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

}