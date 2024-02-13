import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Demo {
    
    public static void main(String args[])
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cermdb","root","1234");

            if(con!=null)
                System.out.println("success");

        }catch(Exception ex){
            System.out.println(ex);
            System.out.println("not success");
        }
    }
    
}
