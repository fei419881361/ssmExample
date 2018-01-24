package web;

import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ReaderService;

@Controller
public class RegisterController {
    private final ReaderService readerService;

    @Autowired
    public RegisterController(ReaderService readerService) {
        this.readerService = readerService;
    }


    @RequestMapping("/register")
    public String register(Reader reader){
        System.out.println(reader.toString());
        readerService.readRegister(reader);
        return "index";
    }

    @RequestMapping(value ="/register_validate",produces="text/html; charset=UTF-8")
    @ResponseBody
    public String validate(String  num){
        System.out.println(num+"-------");
        if(!readerService.validateNum(num)){
           return "ok";
        }
        return "*学号存在了";
    }

}
