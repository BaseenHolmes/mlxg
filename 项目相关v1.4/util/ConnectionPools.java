
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName ConnectionPools
 * @Description: 创建连接池
 * @Author Baseen
 * @Date 2019/9/22
 * @Version V1.0
 **/
public class ConnectionPools {

    /**
     * 用于存储连接池中的连接对象的集合
     */
    private static List<MyConnections> poolsList = new ArrayList<>();

    /**
     * JDBC连接池最大连接数
     */
    private final static int POOLS_NUMBER = 5;

    static {
        for (int i = 0; i < POOLS_NUMBER; i++) {
            MyConnections my = new MyConnections();
            poolsList.add(my);
        }
    }

    /**
     *返回的是MyConnections对象，父接口实现子类对象方法
     * @return 连接池中的某一连接，之后此连接变为被占用状态
     */
    public synchronized static Connection findConnection() {
        MyConnections conn = null;
        int count = 0;
        while(conn == null){
            for (MyConnections mc : poolsList) {
                if (!mc.isFlag()) {
                    conn = mc;
                    mc.setFlag(true);
                    break;
                }
            }
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (count > 20) {
                System.out.println("连接超时，请稍后再试");
                break;
            }
            count++;
        }
        return conn;
    }


}
