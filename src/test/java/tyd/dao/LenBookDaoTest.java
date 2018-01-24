package tyd.dao;

import dao.LenBookMapper;
import entity.Book;
import entity.Reader;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import tyd.BaseTest;

import java.time.LocalDate;
import java.util.List;

public class LenBookDaoTest extends BaseTest {
    @Autowired
    LenBookMapper lenBookMapper;

    public LenBookDaoTest(){}

    @Test
    public void insertItem(){
        Book book = new Book();
        book.setbId(2);
        Reader reader = new Reader();
        reader.setrId(1);
        String time = String.valueOf(LocalDate.now());
        System.out.println(lenBookMapper.lenBook(book,reader,time));
    }
    @Test
    public void testmybook(){
        List<Book>lenbooks = lenBookMapper.getReaderLenbook(3);
        System.out.println(lenbooks.get(0).getbName());
    }

}
