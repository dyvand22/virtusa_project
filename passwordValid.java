import java.util.Scanner;

public class passwordValid {

    static class PasswordFlags {
        boolean upper = false;
        boolean lower = false;
        boolean digit = false;
        boolean special = false;
    }

    static PasswordFlags checkPassword(String pass) {
        PasswordFlags flags = new PasswordFlags();

        for (int i = 0; i < pass.length(); i++) {
            char c = pass.charAt(i);
            if (Character.isUpperCase(c))      flags.upper = true;
            if (Character.isLowerCase(c))      flags.lower = true;
            if (Character.isDigit(c))          flags.digit = true;
            if (!Character.isLetterOrDigit(c)) flags.special = true;
        }
        return flags;
    }

    static boolean isValid(String pass) {
        if (pass.length() < 8) return false;
        PasswordFlags f = checkPassword(pass);
        return f.upper && f.lower && f.digit && f.special;
    }

    static void response(String pass) {
        if (pass.length() < 8) {
            System.out.println("Too Short! Must be at least 8 characters.");
            return;
        }
        PasswordFlags f = checkPassword(pass);
        if (!f.upper)   System.out.println("Missing Uppercase Letter!");
        if (!f.lower)   System.out.println("Missing Lowercase Letter!");
        if (!f.digit)   System.out.println("Missing a digit (0-9)!");
        if (!f.special) System.out.println("Missing a special character (!@#$%^&* etc.)!");
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String password = "";

        System.out.println("        safelog password     ");

        while (!isValid(password)) {
            System.out.println("\nEnter Password: ");
            password = sc.nextLine();

            if (isValid(password)) {
                System.out.println("\nStrong Password! Access Granted.");
            } else {
                System.out.println("\nPassword is weak");
                response(password);
                System.out.println("\nPlease try again :(");
            }
        }
    }
}
