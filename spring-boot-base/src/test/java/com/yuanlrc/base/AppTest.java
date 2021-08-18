package com.yuanlrc.base;

import com.yuanlrc.base.config.TokenConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertTrue;

/**
 * Unit test for simple App.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class AppTest 
{
    @Autowired
    private TokenConfig tokenConfig;
    private String token;
    /**
     * Rigorous Test :-)
     */
    @Test
    public void shouldAnswerWithTrue()
    {
        assertTrue( true );
    }

    @Test
    public void creatToken(){
        token = tokenConfig.createToken();
    }

    @Test
    public  void isToken(){
        Boolean aBoolean = tokenConfig.verifyToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ5dWFubHJjVG9rZW4iLCJhdWQiOiJBUFAiLCJsb2dpbk5hbWUiOiJ5dWFubGFyYyIsImlzcyI6IlNFUlZJQ0UiLCJleHAiOjE2MTcyODg0NjIsInVzZXJOYW1lIjoi54y_5p2l5YWl5q2kIiwiaWF0IjoxNjE3Mjg4NDMyfQ.wBzdlml1yWq_ZhPHm7pBIxw7GYC_hKO60975SczjS8k");
        System.out.println(aBoolean);
    }
}
