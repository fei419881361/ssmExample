package web;

import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ReaderService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ReaderController {
    private final ReaderService readerService;
    @Autowired
    public ReaderController(ReaderService readerService){
        this.readerService = readerService;
    }

    @RequestMapping("/showreaderinfo")
    public String updateInfo(int readerID, HttpServletRequest httpServletRequest){
        System.out.println(readerID);
        Reader reader = readerService.getReaderById(readerID);
        httpServletRequest.setAttribute("readerinfo",reader);
        return "readerinfo";
    }
    @RequestMapping("/updatereader")
    public String updatereader(Reader reader, HttpServletRequest httpServletRequest){
        if(readerService.update(reader))
            return "success";
        else return "fail";
    }

}
