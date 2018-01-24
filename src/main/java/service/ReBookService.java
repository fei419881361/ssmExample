package service;

import entity.Book;
import entity.Reader;

import java.util.List;

public interface ReBookService{
        boolean reBook(Book book, Reader reader);

    List<Book> getReaderRebook(int reader_id);
}
