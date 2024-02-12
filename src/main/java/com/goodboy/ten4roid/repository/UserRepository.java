package com.goodboy.ten4roid.repository;
import com.goodboy.ten4roid.model.Board;
import com.goodboy.ten4roid.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
public interface UserRepository extends JpaRepository<User, Long> {
}
