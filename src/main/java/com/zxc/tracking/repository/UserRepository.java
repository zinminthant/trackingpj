package com.zxc.tracking.repository;

import com.zxc.tracking.model.User.Role;
import com.zxc.tracking.model.User.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {

    List<User> findAllByRole(Role role);

    User getUserById(long id);
}
