package service.serviceImpl;

import com.sun.org.apache.regexp.internal.RE;
import dao.BookMapper;
import dao.LenBookMapper;
import dao.ReaderMapper;
import entity.Book;
import entity.LenBook;
import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.LenBookService;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class LenBookServiceImpl implements LenBookService {
    final LenBookMapper lenBookMapper;
    final BookMapper bookMapper;

    @Autowired
    public LenBookServiceImpl(LenBookMapper lenBookMapper,BookMapper bookMapper) {
        this.lenBookMapper = lenBookMapper;
        this.bookMapper = bookMapper;
    }

    public boolean lenBook(Book book, Reader reader) {
        String time = String.valueOf(LocalDate.now());
        System.out.println(time);
        book.setbStatus(2);
        bookMapper.updateByPrimaryKey(book);
        System.out.println(reader.getrId());
        boolean flag = lenBookMapper.lenBook(book,reader,time);
        return flag;
    }

    @Override
    public void deleteItem(int book_id) {
        lenBookMapper.deleteItem(book_id);
    }

    @Override
    public LenBook getLenbook(int book_id) {
        return lenBookMapper.getLenbook(book_id);
    }

    @Override
    public List<Book> getReaderLenbook(int reader_id) {
        return lenBookMapper.getReaderLenbook(reader_id);
    }
}
