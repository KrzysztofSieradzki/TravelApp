package pl.com.travelApp.application;


import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import pl.com.travelApp.application.model.entities.User;
import pl.com.travelApp.application.model.repositories.UserRepository;

import static org.junit.jupiter.api.Assertions.assertEquals;


@RunWith(SpringRunner.class)
@DataJpaTest
//@SpringBootTest
class UserRepositoryTest {

    @Autowired
    private TestEntityManager testEntityManager;

    @Autowired
    private UserRepository userRepository;

    private User user;

    @BeforeEach
    public void creatUserTest(){
        user = new User();
        user.setId(1L);
        user.setUsername("Test");
        user.setFirstName("John");
        user.setLastName("McKensey");
        user.setActive(true);
        user.setPassword("pass");

        testEntityManager.persistAndFlush(user);
    }
    @Test
    public void whenFindByUser_thenReturnUser() {
        //given
        //when
        User result = userRepository.findByUsername("Test").get();
        //then
        assertEquals(result.getUsername(),user.getUsername());
    }
}
