package Model;

public class User {

    private static String email, password, role, firstName, lastName, subStart, subEnd;
    private static boolean subStatus;

    public User(String uName, String pWord, String userRole, boolean status, String fn, String ln, String start, String end) {
        email = uName;
        password = pWord;
        role = userRole;
        subStatus = status;
        firstName = fn;
        lastName = ln;
        subStart = start;
        subEnd = end;
    }

    public void setDetails(String uEmail, String pWord, String userRole, boolean status, String fn, String ln, String start, String end) {
        email = uEmail;
        password = pWord;
        role = userRole;
        subStatus = status;
        firstName = fn;
        lastName = ln;
        subStart = start;
        subEnd = end;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public boolean getSubscription() {
        return subStatus;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
    public String getSubStart() {
        return subStart;
    }
    
    public String getSubEnd() {
        return subEnd;
    }

    public String toString() {
        return "Username: " + email + "\nPassword: " + password + "\nIs subscribed?: " + subStatus + "\nRole: " + role
                + "\nFirst Name: " + firstName + "\nLast Name: " + lastName + "\nStart of Subscription: " + subStart
                + "\nEnd of Subscription: " + subEnd;
    }

}
