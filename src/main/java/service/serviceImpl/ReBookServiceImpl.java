package service.serviceImpl;

import dao.BookMapper;
import dao.ReBookMapper;
import entity.Book;
import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.ReBookService;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class ReBookServiceImpl implements ReBookService {

    final ReBookMapper reBookMapper;
    final BookMapper bookMapper;

    @Autowired
    public ReBookServiceImpl(ReBookMapper reBookMapper,BookMapper bookMapper) {
        this.reBookMapper = reBookMapper;
        this.bookMapper = bookMapper;
    }

    @Override
    public boolean reBook(Book book, Reader reader) {
        String time = String.valueOf(LocalDate.now());
        book.setbStatus(1);
        bookMapper.updateByPrimaryKey(book);
        return reBookMapper.reBook(book,reader,time);
    }

    @Override
    public List<Book> getReaderRebook(int reader_id) {
        return reBookMapper.getReaderRebook(reader_id);
    }
}
