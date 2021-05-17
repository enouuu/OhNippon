package Model;
public class User {
    
    private static String username;
    private static String password;
    private static String role;
    private static String captcha;
    private static String subStatus;
    
    public User(String uName, String pWord, String userRole, String status, String captchaInput) {
       username = uName;
       password = pWord;
       role = userRole;
       subStatus = status;
       captcha = captchaInput;
    }
    
    public void setDetails(String uName, String pWord, String userRole, String status){
        username = uName;
        password = pWord;
        role = userRole;
        subStatus = status;
    }
    
    public String getUsername(){
        return username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public String getRole(){
        return role;
    }
    
    public String getInputCaptcha(){
        return captcha;
    }
    
    public String getSubscription(){
        return subStatus;
    }
    
    public String toString(){
        return "Username: " + username + "\nPassword: " + password + "\nSubscription Status: " + subStatus + "\nRole: " + role;
    }
    
}
