package membership;


import bean.Factory;
import org.apache.ibatis.session.SqlSession;

public class membershipDao {
	SqlSession sqlSession;


public membershipDao() {
        sqlSession = Factory.getFactory().openSession();
        }



}
