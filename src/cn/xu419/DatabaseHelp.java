package cn.xu419;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;


/**
 * @author 22948
 */
public class DatabaseHelp {
    private Connection connection;
    private String user;
    private String password;
    private final static int[] [] RANDOM  ={
            {3,4,5,6},{3,5,4,6},{3,6,4,5},{3,6,5,4},
            {4,3,5,6},{4,5,3,6},{4,5,3,5},{4,6,5,3},
            {5,3,4,6},{5,4,3,6},{5,6,3,4},{5,6,4,3},
            {6,3,4,5},{6,4,3,5},{6,5,3,4},{6,5,4,3}};


    public DatabaseHelp(String user, String password) {
        this.user = user;
        this.password = password;
        connection = null;
    }

    public DatabaseHelp() {
        this.user = "JavaWeb";
        this.password = "q1w2e3r4";
        connection = null;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://123.206.43.242:3336/zsb?useUnicode=true&characterEncoding=utf-8&useSSL=false";
            connection = DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("cn.xu419.conn:类加载失败");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("cn.xu419.conn:连接失败");
        }
        return connection;
    }

    public ArrayList<Redio> getRediosBySql(String sql){
        Connection conn = getConnection();
        ArrayList<Redio> list= new ArrayList<>();
        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()){
                Redio redio = new Redio();
                Random rd = new Random();
                int i = rd.nextInt(16);
                redio.setNum(resultSet.getInt("num"));
                redio.setScore(resultSet.getInt("score"));
                redio.setCourse(resultSet.getString("course"));
                redio.setStem(resultSet.getString("stem"));
                redio.setOptionOne(resultSet.getString(RANDOM[i][0]));
                redio.setOptionTwo(resultSet.getString(RANDOM[i][1]));
                redio.setOptionThree(resultSet.getString(RANDOM[i][2]));
                redio.setOptionFour(resultSet.getString(RANDOM[i][3]));
                list.add(redio);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getAnswerScore(String num,String option){
        String sql = "SELECT score FROM t_question WHERE num ="+"'"
                +num+"'"+" AND optionOne = '"+option+"'";
        int score = 0;
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                score =  resultSet.getInt("score");
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("查找失败，Sql:"+sql);
        }
        return score;
    }

    public boolean isAccountExist(String account){
        String sql = "SELECT * FROM t_user WHERE account ="+"'"
                +account+"'";
        return isSelectExist(sql);
    }

    public boolean isAccountAllowed(String account,String passwd){
        String sql = "SELECT * FROM t_user WHERE account ="+"'"
                +account+"'"+" AND password = '"+passwd+"' AND permission = 0";
        return isSelectExist(sql);
    }
    public String getUser() {
        return user;
    }

    private boolean isSelectExist(String sql){
        boolean result = false;
        try {
            Connection conn = getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                result = true;
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("查找失败，Sql:"+sql);
        }
        return result;
    }
}
