package com.goodboy.ten4roid.service;

import com.goodboy.ten4roid.model.Board;
import com.goodboy.ten4roid.model.User;
import com.goodboy.ten4roid.repository.BoardRepository;
import com.goodboy.ten4roid.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private UserRepository userRepository;
    public Board save(String username, Board board){
        User user = userRepository.findByUsername(username);
        board.setUser(user);
        return boardRepository.save(board);
    }
}
