package Model;
public class User {
    
    private static String email;
    private static String password;
    private static String role;
    private static String captcha;
    private static boolean subStatus;
    
    public User(String uName, String pWord, String userRole, boolean status) {
       email = uName;
       password = pWord;
       role = userRole;
       subStatus = status;
    }
    
    public void setDetails(String uEmail, String pWord, String userRole, boolean status){
        email = uEmail;
        password = pWord;
        role = userRole;
        subStatus = status;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getPassword(){
        return password;
    }
    
    public String getRole(){
        return role;
    }
    
    public boolean getSubscription(){
        return subStatus;
    }
    
    public String toString(){
        return "Username: " + email + "\nPassword: " + password + "\nIs subscribed?: " + subStatus + "\nRole: " + role;
    }
    
}
