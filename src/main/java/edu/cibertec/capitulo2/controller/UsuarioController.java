/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.controller;

import edu.cibertec.capitulo2.model.UsuarioDTO;
import edu.cibertec.capitulo2.service.UsuarioService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsuarioController {
    
    @Autowired
    private UsuarioService usuarioService;
    
    @RequestMapping("loginMostrar")
    public String loginMostrar(){
        return "login";
    }
    
    @RequestMapping("loginAccion")
    public ModelAndView loginAccion(HttpServletRequest request){
        ModelAndView mv = null;
        UsuarioDTO usuarioValida = new UsuarioDTO();
        usuarioValida.setUsuario(request.getParameter("txtUsuario"));
        usuarioValida.setClave(request.getParameter("txtClave"));
        
        UsuarioDTO user = usuarioService.validarLogin(usuarioValida);
        if(user == null){
            mv = new ModelAndView("login", "msgError", "Usuario y/o clave incorrecto.");
        }else{
           mv = new ModelAndView("saludo", "mensaje", "Bienvenido "+user.getNombreCompleto());
        }
        
        return mv;
    }
}
