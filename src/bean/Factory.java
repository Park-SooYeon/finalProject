package bean;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Factory {
	private static SqlSessionFactory factory; //스태틱형태의 이 형태를 초기화 시키기위해서는 스태틱 블록이 필요하다
	static {
		try {
			Reader r = Resources.getResourceAsReader("config\\config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			System.out.println("factory good....");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}

	public static void main(String[] args) {
		Factory.getFactory();
	}

}
