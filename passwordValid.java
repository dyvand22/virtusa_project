import java.util.Scanner;

public class passwordValid {
    static boolean isValid(String pass){
        if(pass.length()<8){
            return false;
        }

        boolean upper = false;
        boolean digit = false;

        for(int i = 0;i<pass.length();i++){
            char c = pass.charAt(i);
            if(Character.isUpperCase(c)){
                upper = true;
            }

            if(Character.isDigit(c)){
                digit = true;
            }


        }
        return upper && digit;
    }

    static void response(String pass){
        if(pass.length()<8){
            System.out.println("Too Short! Must be at least 8 characters.");
        }
        boolean upper = false;
        boolean digit = false;

        for(int i = 0; i< pass.length();i++){
            char c = pass.charAt(i);
            if(Character.isDigit(c)){
                digit = true;
            }
            if(Character.isUpperCase(c)){
                upper= true;
            }
        }
        if(upper==false){
            System.out.println("Missing Uppercase Letter!");
        }
        if(digit= false){
            System.out.println("Missing a digit(0-9)");
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String password = "";


        System.out.println("        safelog password     ");


        while(isValid(password)==false){
            System.out.println("\nEnter Password: ");
            password = sc.nextLine();

            if(isValid(password)){
                System.out.println("\n Strong Password! Access Granted.");

            }else {
                System.out.println("\nPassword  is weak");
                response(password);
                System.out.println("\nPlease try again");

            }
        }
    }
}
