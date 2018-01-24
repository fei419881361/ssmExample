package tyd.dao;

import dao.BookMapper;
import dao.ReaderMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import tyd.BaseTest;

public class ReaderDaoTest extends BaseTest {
    @Autowired
    ReaderMapper readerMapper;

    @Test
    public void deleteReader(){
        readerMapper.deleteByPrimaryKey(5);
    }

}
