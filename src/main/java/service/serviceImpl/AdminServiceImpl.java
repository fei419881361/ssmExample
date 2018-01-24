package service.serviceImpl;

import dao.AdminMapper;
import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;

    @Autowired
    public AdminServiceImpl(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public Admin adminIsExist(String username, String userpassword) {
        Admin admin = adminMapper.selectByNameAndPassword(username,userpassword);
        if (admin == null) {
            return null;
        }
        return admin;
    }
}
