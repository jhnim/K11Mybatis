<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<!--  
Spring에서 Mybatis사용하기 위한 절차

1. pom.xml에서 의존설정하기

	 -- SPRING JDBC를 위한 의존설정 --
	<dependency>  
		<groupId>com.oracle</groupId>
		<artifactId>ojdbc6</artifactId>
		<version>11.2.0.3</version>
	</dependency>
	<dependency>
		<groupId>org.springframework</groupId>
		<artifactId>spring-jdbc</artifactId>
		<version>4.1.4.RELEASE</version>
	</dependency>
	
	 -- Mybatis를 위한 의존설정 --
	<dependency>
		<groupId>org.mybatis</groupId>
		<artifactId>mybatis</artifactId>
		<version>3.2.8</version>
	</dependency>
	<dependency>
		<groupId>org.mybatis</groupId>
		<artifactId>mybatis-spring</artifactId>
		<version>1.2.2</version>
	</dependency>
	저장한 후 라이브러리가 정상적으로 다운로드 되었는지 확인한다.
	
2.servlet-context.xml에서 mybatis관련 빈을 생성한다.
	
	2-1. dataSource : 오라클 DB연결정보를 가진 빈
	2-2. sqlSessionFactory : 데이터소스와 Mapper의 경로를 기반으로 생성하는 빈
				특히 Mapper의 경우 특정 패키지를 지정할때 /를 사용하는 부분을 주의해야 한다.
	2-3. sqlSession : 마이바티스 사용을 위해 자동주입 받은 후 사용하게 되는 빈
	
	--  DB연결을 위한 데이터소스 빈 생성 --	
	<beans:bean name="dataSource" 
		class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<beans:property name="driverClassName" value="oracle.jdbc.OracleDriver" />
		<beans:property name="url" value="jdbc:oracle:thin:@localhost:1521:orcl" />
		<beans:property name="username" value="kosmo" />
		<beans:property name="password" value="1234" />
	</beans:bean>
	
	-- Mybatis 빈 생성 --
	<beans:bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<beans:property name="dataSource" ref="dataSource" />
		<beans:property name="mapperLocations" value="classpath:mybatis/mapper/*.xml" />
	</beans:bean>
	<beans:bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
		<beans:constructor-arg index="0" ref="sqlSessionFactory" />
	</beans:bean>
		
3. 컨트롤러에서 sqlSession을 @Autowired 받는다.

4. 서비스 객체 역할을 할 interface를 생성한다.
	@Service
	public interface 서비스객체명 {
		Mapper를 호출할때 사용할 추상메소드 정의;
	}
	
5. Mapper를 생성한다.
	mapperLocation에 지정한 경로 하위에 xml파일을 생성한 후 Doctype을 추가하고
	<mapper namespace="패키지명.서비스객체명">
		매퍼파일에 클래스를 기술할때에는 반드시 패키지를 포함한 풀경로를 사용해야 한다.
	</mapper>
	
6.컨트롤러에서 기능을 하나씩 정의한다.
-->
<body>
	<h2>Mybatis를 이용한 회원제 방명록(한줄게시판) 제작</h2>
	
	<li>
		<a href="mybatis/list.do" target="_blank">
			한줄게시판 바로가기
		</a>
	</li>
	
	<h2>방명록 + JSON + jQuery Ajax 연동 제작</h2>
	<a href="mybatisJSON/list.do" target="_blank">
		한줄게시판 바로가기
	</a>
</body>
</html>
