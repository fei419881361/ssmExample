package tyd.dao;


import dao.BookMapper;
import entity.Book;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import tyd.BaseTest;


import java.util.List;

public class BookDaoTest  extends BaseTest{
    @Autowired
    BookMapper bookMapper;

    public BookDaoTest(){}


    @Test
    public void test(){
        if(bookMapper == null){
            System.out.println("null");
        }
        List<Book> bookList = bookMapper.findBookByPageNum(0, 5);
        for (int i = 0; i < bookList.size(); i++) {
            System.out.println(bookList.get(i).getbName());
        }
    }

    @Test
    public void testUpdateStatus(){
        Book book = new Book();
        book.setbId(1);
        book.setbStatus(2);
        bookMapper.updateByPrimaryKey(book);
    }

    @Test
    public void addBook(){
        Book book = new Book();
        book.setbStatus(2);
        book.setbName("aliluya");
        book.setbAuthor("zzl2");
        book.setbLocation("diyi");
        bookMapper.insert(book);
    }

    @Test
    public void modifiBook(){
        Book book = new Book();
        book.setbId(1);
        book.setbStatus(1);
        book.setbName("aliluya");
        book.setbAuthor("zzl2aaa");
        book.setbLocation("diyi");
        System.out.println(bookMapper.modifybook(book));
    }

    @Test
    public void deleteBook(){
        Book book = new Book();
        book.setbId(16);

        bookMapper.deletebook(book);
    }
}