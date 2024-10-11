
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
            rel="stylesheet"
            />

        <!<!-- Icons -->
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <!-- CSS -->

        <style>

            .ErrorCredenciales {
                display:  flex;
                border-radius:  20px;
                box-shadow:  10px 10px 10px rgba(207, 12, 5, 0.84);
                height:  60px;
                max-width:  400px;
                transition:  all 1s ease;
                border:  solid thin #0315af;
            }


            .msjError {
                width:  100%;
                display:  flex;
                justify-content: center;
                border-radius:  20px;
                text-align:  center;
                background-color:  #3fb7ee;
                border-top-left-radius:  20px;
                border-bottom-left-radius:  20px;
                border:  solid thin red;
            }

            .msjError h4 {
                color: red
            }
        </style>

        <title>Mensaje de ERROR</title>
    </head>
    <body>        
        <div class="ErrorCredenciales">
            <div class="msjError">                
                <h4>Usuario y/o contraseña erradas.</h4>
                <br>
                <br>
                <h5>Vuelve a intentarlo.</h5>
                
                

            </div>
            
    </body>
</html>
