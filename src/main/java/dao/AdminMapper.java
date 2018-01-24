package dao;

import entity.Admin;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

    int deleteByPrimaryKey(Integer aId);

    int insert(Admin record);

    int insertSelective(Admin record);


    Admin selectByPrimaryKey(Integer aId);


    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin selectByNameAndPassword(@Param("username") String username,@Param("password") String password);
}