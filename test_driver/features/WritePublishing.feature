
Feature: Write a Post
  Realizar una publicación
  
  Scenario: El usuario realiza una publicación en su cuenta
    Given  que el usuario desea crear una publicacion 
    When  ingresa la informacion correspondiente a la publicacion And select the button create 
    Then the response is 200