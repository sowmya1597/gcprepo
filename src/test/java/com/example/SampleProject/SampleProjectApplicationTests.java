package com.example.SampleProject;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SampleProjectApplicationTests {

	@Test
	void contextLoads() {
		
	}
	stage("Maven Build"){
           steps{
                sh "mvn clean package"
               
            }

}
