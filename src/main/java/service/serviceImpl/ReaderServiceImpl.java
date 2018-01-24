package service.serviceImpl;

import dao.ReaderMapper;
import entity.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.ReaderService;

import java.util.List;

@Service
@Transactional
public class ReaderServiceImpl implements ReaderService {
    private final ReaderMapper readerMapper;

    @Autowired
    public ReaderServiceImpl(ReaderMapper readerMapper) {
        this.readerMapper = readerMapper;
    }


    public Reader getReaderById(int id) {
        return readerMapper.selectByPrimaryKey(id);
    }

    public Reader readerIsExist(String username, String userpassword) {
        Reader reader = readerMapper.selectByNameAndPassword(username, userpassword);
        if (reader == null ) {
            return null;
        }
        return reader;
    }

    @Override
    public int getAllReaders() {
        return readerMapper.getAllReaders();
    }

    @Override
    public List<Reader> findReaderByPageNum(int start, int prepages) {
        List<Reader> readers = readerMapper.findReaderByPageNum(start,prepages);
        return readers;
    }

    @Override
    public void deleteReader(int r_id) {
        readerMapper.deleteByPrimaryKey(r_id);
    }

    @Override
    public void readRegister(Reader reader) {
        readerMapper.insert(reader);
    }

    @Override
    public boolean validateNum(String num) {
         Reader reader = readerMapper.validateNum(num);
        System.out.println("====="+reader+"-------");
         //true 找到了
         return reader != null;
    }

    @Override
    public boolean update(Reader reader) {
        return readerMapper.update(reader)>0;

    }

}
