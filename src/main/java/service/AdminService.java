package service;

import entity.Admin;

public interface AdminService {
    Admin adminIsExist(String username, String userpassword);
}
