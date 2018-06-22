package Javabean;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class ReturnUser {
    private ResultSet rs =null;
    private String[] user;
    private Object temp;

    public String[] returnuser(){
        DBAccessBean db=new DBAccessBean();
        if(db.createConn()){
            try{
                String sql="select username from 'User_Info'";
                System.out.println(sql);
                rs=db.advancedQuery(sql);
                ResultSetMetaData md = rs.getMetaData(); //获得结果集结构信息,元数据
                int columnCount = md.getColumnCount();   //获得列数
                while (rs.next()){
                    for (int i = 0; i < columnCount; i++) {
                        temp=rs.getObject(i+1);
                        user[i]=temp.toString();
                    }
                }
                db.closeConn();
                db.closeStmt();
                db.closeRs();
            }catch(Exception e){}
        }
        return user;
    }
}
