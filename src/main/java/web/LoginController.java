package web;

import entity.Admin;
import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.AdminService;
import service.ReaderService;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final ReaderService readerService;

    private  final AdminService adminService;

    @Autowired
    public LoginController(ReaderService readerService,AdminService adminService) {
        this.readerService = readerService;
        this.adminService = adminService;
    }

    @RequestMapping("/login")
    public String login(String username, String password, HttpSession httpSession){
        Reader reader = readerService.readerIsExist(username,password);
        Admin admin = null;
        if (reader == null) {
            admin = adminService.adminIsExist(username,password);
            if (admin == null) {
                return "fail";
            }else{
                httpSession.setAttribute("isAdmin",true);
                httpSession.setAttribute("username",admin.getaName());
                httpSession.setAttribute("id",admin.getaId());
                System.out.println("Admin success login");
                return "welcom";
            }
        }else {
            System.out.println("Reader success login");
            httpSession.setAttribute("isAdmin",false);
            httpSession.setAttribute("username",reader.getrName());
            httpSession.setAttribute("id",reader.getrId());
            return "welcom";
        }
    }

}
