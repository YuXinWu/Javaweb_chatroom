package Javabean;
import java.sql.*;

public class DBAccessBean {
    private String drv="com.mysql.cj.jdbc.Driver";
    private String url="jdbc:mysql://www.samwu.work:3306/Javaweb";
    private String user="root";
    private String pwd="19971003";
    private Connection conn=null;
    private Statement stmt=null;
    private ResultSet rs =null;

    public String getDrv(){
        return drv;
    }
    public void setDrv(String drv){
        this.drv=drv;
    }
    public String getUrl(){
        return url;
    }
    public void setUrl(String url){
        this.url=url;
    }
    public String getUser(){
        return user;
    }
    public void setUser(String user){
        this.user=user;
    }
    public  String getPwd(){
        return pwd;
    }
    public void setPwd(String pwd){
        this.pwd=pwd;
    }
    public Connection getConn(){
        return conn;
    }
    public void setConn(Connection conn){
        this.conn=conn;
    }
    public Statement getStmt(){
        return stmt;
    }
    public void setStmt(Statement stmt) {
        this.stmt = stmt;
    }
    public ResultSet getRs() {
        return rs;
    }
    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    /**
     * 连接数据库
     * @return b代表是否执行成功
     */
    public boolean createConn(){
        boolean b=false;
        try{
            Class.forName(drv).newInstance();
            conn=DriverManager.getConnection(url,user,pwd);
            b=true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return b;
    }

    /**
     * 增、删、改数据库都使用此函数
     * @param sql sql语句参数
     * @return 是否执行成功
     */
    public boolean update(String sql){
        boolean b=false;
        try{
            stmt=conn.createStatement();
            stmt.execute(sql);
            b=true;
        }catch (Exception e){
            System.out.println(e.toString());
        }
        return b;
    }

    /**
     * 查询数据库
     * @param sql sql语句参数
     */
    public void query(String sql){
        try{
            stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);
        }catch (Exception e){}
    }

    /**
     * 将记录移到下一条
     * @return 返回执行是否成功
     */
    public boolean next(){
        boolean b=false;
        try{
            if(rs.next()){
                b=true;
            }
        }catch (Exception e){}
        return b;
    }

    /**
     * 取得当前记录的字段field的值
     * @param field 字段
     * @return 返回值
     */
    public String getValue(String field){
        String value=null;
        try{
            if(rs!=null){
                value=rs.getString(field);
            }
        }catch (Exception e){}
        return value;
    }

    public void closeConn(){
        try{
            if(conn!=null){
                conn.close();
            }
        }catch (SQLException e){}
    }

    public void closeStmt(){
        try{
            if(stmt!=null){
                stmt.close();
            }
        }catch (SQLException e){}
    }

    public void closeRs(){
        try{
            if(rs!=null){
                rs.close();
            }
        }catch (SQLException e){}
    }

    public ResultSet advancedQuery(String sql){
        try{
            stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);
        }catch (Exception e){}
        return rs;
    }
}
