package tyd.service;


import entity.Book;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.BookService;
import tyd.BaseTest;

import java.util.List;

public class BookServiceTest extends BaseTest{

    @Autowired
    BookService bookService;
    public BookServiceTest(){}

    @Test
    public void testBookpages(){
        if(bookService== null){
            System.out.println("null");
        }
        List<Book> bookList = bookService.findBookByPageNum(0,5);
        for (int i = 0; i < bookList.size(); i++) {
            System.out.println(bookList.get(i).getbId());
        }
    }
}
