package com.zxc.tracking.repository;

import com.zxc.tracking.model.User.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role,Long> {

    Role getRoleByRole(String role);


}
