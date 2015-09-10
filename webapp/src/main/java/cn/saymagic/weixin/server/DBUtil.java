package cn.saymagic.weixin.server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

/**
 * Created by eonezhang on 9/10/15.
 */
public class DBUtil {
    private static final Logger LOGGER = Logger.getLogger(DBUtil.class);

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }

    public static String connect(String host, Integer port, String user, String password) {
        Connection con = null;
        String result = "connect success";
        try {
            con = DriverManager.getConnection("jdbc:mysql://"+host+":"+port, user, password);
        } catch (SQLException e) {
            LOGGER.error("connect failed", e);
            result = "connect failed";
        } finally {
            closeQuiet(con);
        }

        return result;
    }

    private static void closeQuiet(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                LOGGER.error("close connection failed", e);
            }
        }
    }
}
