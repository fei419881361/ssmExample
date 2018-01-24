package service;

import entity.Book;

import java.util.List;

public interface BookService {
    List<Book> findBookByPageNum(int pageon,int pagenum);
    int getAllBookNums();

    Book getBookById(int book_id);

    int modifybook(Book book);

    void deletebook(Book book);

    int insert(Book book);
}
