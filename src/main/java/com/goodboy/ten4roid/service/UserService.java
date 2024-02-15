package com.goodboy.ten4roid.service;

import com.goodboy.ten4roid.model.Board;
import com.goodboy.ten4roid.model.Role;
import com.goodboy.ten4roid.model.User;
import com.goodboy.ten4roid.repository.BoardRepository;
import com.goodboy.ten4roid.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
    public User save(User user) throws Exception {
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        user.setEnabled(true);
        Role role = new Role();
        role.setId(1l);
        user.getRoles().add(role);

        User saveUser = userRepository.save(user);


        // 사용자 가입인사글 자동작성
        Board board = new Board();
        board.setTitle("안녕하세요 !");
        board.setContent("반갑습니다.");
        board.setUser(saveUser);
        boardRepository.save(board);
        return saveUser;
    }

}
