
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JdbcTemplate {
    public void update(String sql, Object[] values) {
        Connection conn = null;
        PreparedStatement pstat = null;
        try {
            conn = ConnectionPools.findConnection();
            pstat = conn.prepareStatement(sql);
            for (int i = 0; i < values.length; i++) {
                pstat.setObject(i + 1, values[i]);
            }
            pstat.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstat != null) {
                    pstat.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public Object queryForOne(String sql, Object[] values, RowMapper mapper) {
        Object rtvObj = null;
        Connection conn = null;
        PreparedStatement pstat = null;
        ResultSet rs = null;
        try {
            conn = ConnectionPools.findConnection();
            pstat = conn.prepareStatement(sql);
            for (int i = 0; i < values.length; i++) {
                pstat.setObject(i + 1, values[i]);
            }
            rs = pstat.executeQuery();
            if (rs.next()) {
                rtvObj = mapper.mapRow(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (pstat != null) {
                    pstat.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rtvObj;
    }

    public Object queryForOne(String sql, RowMapper mapper) {
        return this.queryForOne(sql,null,mapper);
    }


    public List queryForList(String sql, Object[] values, RowMapper mapper) {
        List list = new ArrayList();
        Connection conn = null;
        PreparedStatement pstat = null;
        ResultSet rs = null;
        try {
            conn = ConnectionPools.findConnection();
            pstat = conn.prepareStatement(sql);
            if (values != null) {
                for (int i = 0; i < values.length; i++) {
                    pstat.setObject(i + 1, values[i]);
                }
            }
            rs = pstat.executeQuery();
            Object rtvObj = null;
            while (rs.next()) {
                rtvObj = mapper.mapRow(rs);
                list.add(rtvObj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (pstat != null) {
                    pstat.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public List queryForList(String sql, RowMapper mapper) {
        return this.queryForList(sql, null, mapper);
    }

}
