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
