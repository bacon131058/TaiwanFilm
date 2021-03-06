package com.web.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {
	@Bean
	public DataSource SQLDataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		ds.setUser("root");
		// ds.setUser("sa");
		// ds.setPassword("1qaz!QAZ");
		// ds.setPassword("P@ssw0rd");
		ds.setPassword("sa123456");
		try {
			ds.setDriverClass("com.mysql.cj.jdbc.Driver");
		// ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		// ds.setJdbcUrl("jdbc:sqlserver://172.17.24.62:1433;DatabaseName=DC_BACON;");
		// ds.setJdbcUrl("jdbc:sqlserver://192.168.99.100:32768;DatabaseName=jspdb;");
		// ds.setJdbcUrl("jdbc:mysql://192.168.99.100:32769/jspdb");
		ds.setJdbcUrl(
				"jdbc:mysql://localhost:3306/lab?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Taipei");
		ds.setInitialPoolSize(4);
		ds.setMaxPoolSize(8);
		return ds;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setPackagesToScan(new String[] { "com.web.model.member", "com.web.model.booking" });
		factory.setDataSource(SQLDataSource());
		factory.setHibernateProperties(additionalProperties());
		return factory;
	}

	@Bean(name = "transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}

	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.MySQL8Dialect.class);
		// properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "none");
		return properties;
	}

}
