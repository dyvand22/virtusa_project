# SafeLog Password Validator

## Overview

SafeLog Password Validator is a Java-based console application that validates user passwords against standard password security requirements. The application ensures that passwords meet predefined complexity criteria before granting access and provides detailed feedback when validation fails.

This project demonstrates fundamental Java programming concepts, including string manipulation, character classification, input validation, control flow, and basic object-oriented design.

---

## Features

* Validates password length (minimum 8 characters)
* Verifies the presence of at least one uppercase letter
* Verifies the presence of at least one lowercase letter
* Verifies the presence of at least one numeric digit
* Verifies the presence of at least one special character
* Displays clear validation messages for missing requirements
* Continuously prompts the user until a valid password is entered

---

## Password Validation Criteria

A password is considered valid only if it satisfies all of the following conditions:

| Requirement       | Description                                                       |
| ----------------- | ----------------------------------------------------------------- |
| Minimum Length    | At least 8 characters                                             |
| Uppercase Letter  | At least one uppercase character (A–Z)                            |
| Lowercase Letter  | At least one lowercase character (a–z)                            |
| Numeric Character | At least one digit (0–9)                                          |
| Special Character | At least one non-alphanumeric character (e.g., `! @ # $ % ^ & *`) |

---

## Project Structure

```
passwordValid.java
```

### Core Components

| Component         | Purpose                                                                                    |
| ----------------- | ------------------------------------------------------------------------------------------ |
| `PasswordFlags`   | Stores validation results for each password criterion.                                     |
| `checkPassword()` | Evaluates the password and identifies which validation rules are satisfied.                |
| `isValid()`       | Determines whether the password meets all required criteria.                               |
| `response()`      | Generates descriptive feedback for failed validation checks.                               |
| `main()`          | Handles user interaction and repeatedly requests input until a valid password is provided. |

---

## Sample Execution

```
SafeLog Password Validator

Enter Password:
Password123

Password is weak
Missing a special character (!@#$%^&* etc.)!

Please try again :(

Enter Password:
Password@123

Strong Password! Access Granted.
```

---

## How to Run

### Prerequisites

* Java Development Kit (JDK 8 or later)

### Compilation

```bash
javac passwordValid.java
```

### Execution

```bash
java passwordValid
```

---

## Concepts Demonstrated

* Java Classes and Objects
* Static Methods
* Nested Classes
* String Processing
* Character Classification (`Character` class)
* Conditional Statements
* Iteration
* Input Handling using `Scanner`
* Basic Password Validation Logic

---

## Future Enhancements

* Password masking during input
* Password strength scoring (Weak, Moderate, Strong)
* Configurable validation rules
* Dictionary-based password validation
* Password history and reuse detection
* Graphical User Interface (JavaFX/Swing)
* Unit testing with JUnit

---

## Author

Developed as a Java programming project to demonstrate secure password validation techniques and object-oriented programming principles.





# CityCab Fare Calculator

## Overview

CityCab Fare Calculator is a Python-based console application that calculates the fare for a cab ride based on the travel distance, selected vehicle category, and time of travel. The application applies predefined per-kilometer rates and automatically includes surge pricing during peak hours.

The project demonstrates fundamental Python programming concepts such as functions, dictionaries, loops, exception handling, conditional statements, and user input validation.

---

## Features

* Calculates fare based on travel distance
* Supports multiple vehicle categories
* Applies automatic surge pricing during peak hours
* Validates all user inputs
* Generates a detailed fare receipt
* Handles invalid inputs gracefully using exception handling

---

## Vehicle Categories

| Vehicle Type | Rate (per km) |
| ------------ | ------------: |
| Economy      |        ₹10/km |
| Premium      |        ₹18/km |
| SUV          |        ₹25/km |

---

## Surge Pricing

A **1.5× surge multiplier** is automatically applied during peak hours.

| Time                            | Surge    |
| ------------------------------- | -------- |
| 5:00 PM – 8:00 PM (17:00–20:00) | 1.5×     |
| All Other Hours                 | No Surge |

---

## Project Structure

```text
citycab_fare_calculator.py
```

### Core Components

| Component          | Purpose                                                                                      |
| ------------------ | -------------------------------------------------------------------------------------------- |
| `rates`            | Stores vehicle categories and their respective fare rates.                                   |
| `calculate_fare()` | Calculates the base fare, applies surge pricing when applicable, and returns the final fare. |
| Input Validation   | Ensures valid distance, vehicle type, and time values are entered by the user.               |
| Receipt Generator  | Displays a detailed fare breakdown including surge information and total payable amount.     |

---

## Fare Calculation

The fare is calculated using the following formula:

```text
Base Fare = Distance × Vehicle Rate

Final Fare =
    Base Fare × 1.5    (During Peak Hours)
    Base Fare          (Otherwise)
```

---

## Sample Execution

```text
Welcome! Let us calculate

Enter distance in km:
15

Available vehicles:
- Economy (Rs.10/km)
- Premium (Rs.18/km)
- SUV (Rs.25/km)

Enter vehicle type:
Premium

Enter hour of day (0 to 23):
18

        Your Price Receipt

Vehicle      : Premium
Distance     : 15 km
Rate         : Rs.18/km
Base Fare    : Rs.270.00
Surge        : 1.5x (Peak Hours)
--------------------------------
Total Fare   : Rs.405.00

Note: Peak hour (5PM to 8PM)
surcharge has been applied.

Thank you for choosing CityCab!
Have a safe journey!
```

---

## How to Run

### Prerequisites

* Python 3.x

### Execute

```bash
python citycab_fare_calculator.py
```

---

## Input Validation

The application validates the following user inputs:

* Distance must be greater than **0 km**
* Vehicle type must be **Economy**, **Premium**, or **SUV**
* Hour must be between **0 and 23**
* Invalid numeric inputs are handled using exception handling

---

## Concepts Demonstrated

* Python Functions
* Dictionaries
* Conditional Statements
* Loops
* Exception Handling (`try` / `except`)
* Input Validation
* String Formatting (f-strings)
* Modular Programming

---

## Future Enhancements

* Support for coupon and discount codes
* Dynamic pricing based on traffic conditions
* Multiple trip estimation
* Graphical User Interface (Tkinter or PyQt)
* Integration with mapping APIs for automatic distance calculation
* Trip history and receipt generation
* GST and additional service charge calculation

---

## Author

Developed as a Python programming project to demonstrate fare calculation logic, input validation, exception handling, and modular application design.

