# mi_hackathon

Mi Hackathon Project for Vendor Payment System

## Working Pattern

- package
    - lib
        - backend  *(all backend files)*
            - globalElement.dart *(all global components)*
        - frontends *(frontend files device size type)*
            - desktop 
                - desktop_login_signup_page.dart
            - mobile
                - mobile_login_signup_page.dart
            - pages
                - login_signup_page.dart *(Main Login/Signup Page)*
            - tablet
                - tablet_login_signup_page.dart

> Main Pages are main page which decides which widget will shown up according to device type using createWidget() from globalElement.dart

## Pages
### **globalElement.dart**
- Background Colors
    - mainBackgroundColor (light orange) `#e94f1d` 
    - subBackgroundColor (light grey) `#d9d9d9` 

- Text Colors
    - mainTextColor (black) `#000000`
    - subTextColor (dark grey) `#1f1f1f`

- createWidget(BuildContext context , Widget desktop , Widget tablet , Widget mobile)

  This method will return appropriate Widget according to the window size