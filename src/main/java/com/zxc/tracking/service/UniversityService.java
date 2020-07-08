package com.zxc.tracking.service;

import com.zxc.tracking.model.Const.University;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UniversityService extends JpaRepository<University,Long> {
}
