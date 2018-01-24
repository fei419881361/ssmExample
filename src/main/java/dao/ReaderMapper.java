package dao;

import entity.Reader;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReaderMapper {

    int deleteByPrimaryKey(Integer rId);

    int insert(Reader record);

    int insertSelective(Reader record);


    Reader selectByPrimaryKey(Integer rId);

    int updateByPrimaryKeySelective(Reader record);

    int update(Reader record);

    Reader selectByNameAndPassword(@Param("username")String username,@Param("password")String password);

    int getAllReaders();
    List<Reader> findReaderByPageNum(@Param("pageon") int pageon, @Param("Pagenum") int pagenum);

    Reader validateNum(String num);
}