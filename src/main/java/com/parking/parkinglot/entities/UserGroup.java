package com.parking.parkinglot.entities;

import jakarta.persistence.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "usergroups")
public class UserGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "username")
    private String username;

    @Column(name = "userGroup")
    private String userGroup;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserGroup(String userGroup) {
        this.userGroup = userGroup;
    }
}
