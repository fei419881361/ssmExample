package dao;

import entity.Book;
import entity.ReBook;

import java.util.List;

import entity.Reader;
import org.apache.ibatis.annotations.Param;

public interface ReBookMapper {

    boolean reBook(@Param("book") Book book, @Param("reader") Reader reader , @Param("time") String time);

    List<Book> getReaderRebook(int reader_id);
}