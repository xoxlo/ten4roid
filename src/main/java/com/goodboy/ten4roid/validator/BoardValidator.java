package com.goodboy.ten4roid.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Validator;
import org.thymeleaf.util.StringUtils;
import com.goodboy.ten4roid.model.Board;
import org.springframework.validation.Errors;
@Component
public class BoardValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz){
        return Board.class.equals(clazz);
    }

    @Override
    public void validate(Object obj, Errors errors){
        Board b = (Board) obj;
        if(StringUtils.isEmpty(b.getContent())){
            errors.rejectValue("content","key","내용을 입력하세요");
        }
    }
}
