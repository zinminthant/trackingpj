package com.zxc.tracking.repository;

import com.zxc.tracking.model.Util.Code;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CodeRepository extends JpaRepository<Code,Long> {

    Page<Code> findAllByCodeType(String codeType, Pageable pageable);

    List<Code> findAllByCodeType(String codeType);

    Code getCodeByCodeID(String codeId);
}
