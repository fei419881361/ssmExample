package service.serviceImpl;

import Constant.Constant;
import dao.BookMapper;
import entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.BookService;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    private final BookMapper bookMapper;

    @Autowired
    public BookServiceImpl(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    public List<Book> findBookByPageNum(int pageon, int pagenum) {

        List<Book> books = bookMapper.findBookByPageNum(pageon,pagenum);

        return books;
    }

    public int getAllBookNums() {
        return bookMapper.getAllBookNums();
    }

    @Override
    public Book getBookById(int book_id) {
        return bookMapper.findBookById(book_id);
    }

    @Override
    public int modifybook(Book book) {
        return bookMapper.modifybook(book);
    }

    @Override
    public void deletebook(Book book) {
        bookMapper.deletebook(book);
    }

    @Override
    public int insert(Book book) {
        return bookMapper.insert(book);
    }
}
