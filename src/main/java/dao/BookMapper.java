package dao;

import entity.Book;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookMapper {

    int deleteByPrimaryKey(Integer bId);

    int insert(Book record);

    int insertSelective(Book record);


    Book selectByPrimaryKey(Integer bId);


    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);//修改书的状态

    List<Book> findBookByPageNum(@Param("pageon") int pageon, @Param("Pagenum") int pagenum);

    int getAllBookNums();

    Book findBookById(int book_id);

    int modifybook(Book book);//修改书籍信息

    void deletebook(Book book);
}