package Javabean;
public class LoginSignupBean {
    /**
     * 登录验证方法
     * @param username
     * @param password
     * @return 验证是否有效
     */
    public boolean valid(String username,String password){
        boolean isValid=false;
        DBAccessBean db=new DBAccessBean();
        if(db.createConn()){
            String sql="select * from User_Info where username='"+username
                    +"'and password='"+password+"'";
            System.out.println(sql);
            db.query(sql);
            if(db.next()){
                isValid=true;
            }
            db.closeConn();
            db.closeStmt();
            db.closeRs();
        }
        return isValid;
    }

    /**
     * 检验用户名是否存在
     * @param username
     * @return
     */
    public boolean isExist(String username){
        boolean isExist=false;
        DBAccessBean db=new DBAccessBean();
        if(db.createConn()){
            String sql="select * from User_Info where username='"+username+"'";
            System.out.println(sql);
            db.query(sql);
            if(db.next()){
                isExist=true;
            }
            db.closeConn();
            db.closeStmt();
            db.closeRs();
        }
        return isExist;
    }

    /**
     * 增加一个用户
     * @param username
     * @param password
     */
    public void add(String username,String password){
        DBAccessBean db=new DBAccessBean();
        if(db.createConn()){
            String sql="insert into User_Info(username,password)values('"+username+"','"+password+"')";
            System.out.println(sql);
            db.update(sql);
            db.closeConn();
            db.closeStmt();
        }
    }

}
