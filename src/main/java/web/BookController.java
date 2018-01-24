package web;

import Constant.Constant;
import entity.Book;
import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.LenBookService;
import service.ReBookService;
import service.ReaderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {
    private final BookService bookService;
    private final ReaderService readerService;
    private final LenBookService lenBookService;
    private final ReBookService reBookService;

    @Autowired
    public BookController(BookService bookService,ReaderService readerService,LenBookService lenBookService,ReBookService reBookService){
        this.bookService = bookService;
        Constant.TOTLEPAGES = bookService.getAllBookNums();
        Constant.PAGES = Constant.TOTLEPAGES / Constant.PREPAGES;
        if(Constant.TOTLEPAGES % Constant.PREPAGES != 0){
            Constant.PAGES ++ ;
        }
        this.readerService = readerService;
        this.lenBookService = lenBookService;
        this.reBookService = reBookService;
        System.out.println(Constant.TOTLEPAGES+"---"+Constant.PAGES);
    }
    @RequestMapping("/nextpage")
    public String findPage(int pageon, HttpServletRequest httpServletRequest){
        if(pageon > Constant.PAGES){
            pageon = Constant.PAGES;
        }
        if (pageon < 1) {
            pageon = 1;
        }
        int start  = (pageon - 1) * Constant.PREPAGES;
        httpServletRequest.setAttribute("totlepages",Constant.TOTLEPAGES); // 总条目数
        httpServletRequest.setAttribute("pages",Constant.PAGES);//总页数
        List<Book> bookList = bookService.findBookByPageNum(start,Constant.PREPAGES);
        httpServletRequest.setAttribute("nopage",pageon); //当前页
        httpServletRequest.setAttribute("booklist",bookList);
        return "Book";
    }

    @RequestMapping("/lenbook")
    @ResponseBody
    public String lenBook(int book_id,HttpSession httpSession){
        System.out.println(book_id);
        System.out.println(httpSession.getAttribute("id"));
        int reader_id = (int) httpSession.getAttribute("id");
        Reader reader = readerService.getReaderById(reader_id);
        System.out.println("book_id"+book_id);
        System.out.println("reader_id:"+reader_id);
        System.out.println("Reader"+reader.getrName());
        Book book = bookService.getBookById(book_id);
        System.out.println(book.getbStatus());
        if(book.getbStatus() == 2){
            return "fail";
        }
        if(lenBookService.lenBook(book,reader)){
            return "success";
        }else return "error";
    }

    @RequestMapping("/rebook")
    public String reBook(int book_id){
        System.out.println(book_id);
        Book book = bookService.getBookById(book_id);
        Reader reader = new Reader();
        reader.setrId(lenBookService.getLenbook(book_id).getrId());
        System.out.println(reader.getrId());
        reBookService.reBook(book,reader);
        lenBookService.deleteItem(book_id);
        book.setbStatus(1);
        if(bookService.modifybook(book) == 1)
            return "success";
        return "fail";

    }


    @RequestMapping("/showlenbookandrebook")
    public String mybook(int pageon,HttpSession httpSession,HttpServletRequest httpServletRequest){
        int reader_id = (int) httpSession.getAttribute("id");
        System.out.println("reader_id : " + reader_id);
        //分页功能未做 TODO
        List<Book>lenbooks = lenBookService.getReaderLenbook(reader_id);
        List<Book>rebooks = reBookService.getReaderRebook(reader_id);
        httpServletRequest.setAttribute("lenbooks",lenbooks);
        httpServletRequest.setAttribute("rebooks",rebooks);
        return "mylenbook";
    }
}
