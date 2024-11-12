/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.controller;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author miguel
 */
public class SaludoController {
    
    @RequestMapping("saludo")
    public String saludar(){
        return "saludo.jsp";
    }
    
}
