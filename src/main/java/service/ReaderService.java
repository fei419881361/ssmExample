package service;

import entity.Reader;

import java.util.List;

public interface ReaderService {
    Reader getReaderById(int id);
    Reader readerIsExist(String username,String userpassword);

    int getAllReaders();

    List<Reader> findReaderByPageNum(int start, int prepages);

    void deleteReader(int r_id);

    void readRegister(Reader reader);

    boolean validateNum(String num);

    boolean update(Reader reader);
}
