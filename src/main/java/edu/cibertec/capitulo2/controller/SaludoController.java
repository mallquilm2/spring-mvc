/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SaludoController {
    /* FORMA 1
    @RequestMapping("saludo")
    public String saludar(Model modelo){
        modelo.addAttribute("mensaje", "Bienvenido desde contralador");
        modelo.addAttribute("nombre", "Luis");
        return "saludo";
    }
    */
    
    /*FORMA 2
    @RequestMapping("saludo")
    public ModelAndView saludar(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("mensaje", "Bienvenido desde contralador");
        mv.addObject("nombre","Luis");
        mv.setViewName("saludo");
        return mv;
    }
*/
    //FORMA 3
    @RequestMapping("saludo")
    public ModelAndView saludar(){
        return new ModelAndView("saludo", "mensaje", "Bienvenido desde le controlador MVC");
    }
    
}
