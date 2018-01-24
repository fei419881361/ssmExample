package web;

import Constant.Constant;
import entity.Book;
import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.ReaderService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {

    final ReaderService readerService;
    final BookService bookService;
    @Autowired
    public AdminController(ReaderService readerService,BookService bookService) {
        this.readerService = readerService;
        this.bookService = bookService;
        Constant.R_TOTLEPAGES = readerService.getAllReaders();
        Constant.R_PAGES = Constant.R_TOTLEPAGES / Constant.R_PREPAGES;
        if(Constant.R_TOTLEPAGES % Constant.R_PREPAGES != 0){
            Constant.R_PAGES ++ ;
        }
    }

    @RequestMapping("/readerpage")
    public String findReaderPage(int pageon, HttpServletRequest httpServletRequest){
        int start = (pageon - 1) * pageon;
        httpServletRequest.setAttribute("rtotlepages",Constant.R_TOTLEPAGES);
        httpServletRequest.setAttribute("rpages",Constant.R_PAGES);
        List<Reader> readerList = readerService.findReaderByPageNum(start,Constant.PREPAGES);
        httpServletRequest.setAttribute("rpageon",pageon);
        httpServletRequest.setAttribute("readerList",readerList);
        return "reader";
    }

    @RequestMapping("/deletereader")
    public String deleteReader(int r_id){
        readerService.deleteReader(r_id);
        return "success";
    }
    @RequestMapping("/deletebook")
    public String deleteBook(int b_id){
        Book book = new Book();
        book.setbId(b_id);
        bookService.deletebook(book);
        return "success";
    }

    @RequestMapping("/modifybook")
    public String modifyBook(Book book){
        int i = bookService.modifybook(book);
        if(i>0)
            return "success";
        else return "fail";
    }
    @RequestMapping("/addbook")
    public String addbook(Book book){
        int i = bookService.insert(book);
        System.out.println(i);
        return (i==1)?"success":"fail";
    }

    @RequestMapping("/modifyreader")
    public String modifyReader(Reader reader){
        readerService.update(reader);
        return "success";
    }



}
