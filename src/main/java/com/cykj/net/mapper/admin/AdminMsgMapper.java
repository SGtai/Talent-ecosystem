package com.cykj.net.mapper.admin;

import com.cykj.net.javabean.Msg;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMsgMapper {

    @Insert("Insert into msg(event) values(#{event})")
    void addMsg(Msg msg);
}
