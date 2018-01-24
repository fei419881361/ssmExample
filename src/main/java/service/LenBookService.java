package service;

import entity.Book;
import entity.LenBook;
import entity.Reader;

import java.util.List;

public interface LenBookService {
    boolean lenBook(Book book, Reader reader);

    void deleteItem(int book_id);

    LenBook getLenbook(int book_id);

    List<Book> getReaderLenbook(int reader_id);
}
