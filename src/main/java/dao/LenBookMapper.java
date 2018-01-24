package dao;

import entity.Book;
import entity.LenBook;

import java.util.List;

import entity.Reader;
import org.apache.ibatis.annotations.Param;

public interface LenBookMapper {
    boolean lenBook(@Param("book") Book book, @Param("reader") Reader reader ,@Param("time") String time);

    void deleteItem(int book_id);

    List<Book> getReaderLenbook(int reader_id);

    LenBook getLenbook(int book_id);
}