/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.controller;

import edu.cibertec.capitulo2.model.UsuarioDTO;
import edu.cibertec.capitulo2.service.UsuarioService;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("contador")
public class UsuarioController {
    
    @Autowired
    private UsuarioService usuarioService;
    
    @RequestMapping("usuarioCrear")
    public ModelAndView crearUsuario(){
        return new ModelAndView("usuarioDatos", "usuarioBean", new UsuarioDTO());
    }
    
    @RequestMapping("usuarioGrabar")
    public ModelAndView grabarUsuario(@Valid @ModelAttribute("usuarioBean") UsuarioDTO usuario, BindingResult result, ModelMap modelo){
        ModelAndView mv = null;
        
        if(result.hasErrors()){
            mv = new ModelAndView("usuarioDatos","usuarioBean",usuario);
        }else{
            usuarioService.insertarUsuario(usuario);
            mv = new ModelAndView("usuariosLista", "lista", usuarioService.getListaUsuarios());
            int contador = (int) modelo.get("contador");
            contador++;
            mv.addObject("contador",contador);
        }
        return mv;
    }
    
    @RequestMapping("loginMostrar")
    public String loginMostrar(){
        return "login";
    }
    
    @RequestMapping("loginAccion")
    public ModelAndView loginAccion(UsuarioDTO usuarioValida){
        ModelAndView mv = null;
        
        UsuarioDTO user = usuarioService.validarLogin(usuarioValida);
        if(user == null){
            mv = new ModelAndView("login", "msgError", "Usuario y/o clave incorrecto.");
            
        }else{
           //mv = new ModelAndView("saludo", "mensaje", "Bienvenido "+user.getNombreCompleto());
           mv = new ModelAndView("usuariosLista", "lista", usuarioService.getListaUsuarios());
           mv.addObject("contador",usuarioService.getListaUsuarios().size());
        }
        return mv;
    }
    
    @RequestMapping("fotoMostar")
    public String fotoMostarr(HttpServletRequest request, Model modelo){
        UsuarioDTO usuario = usuarioService.getUsuario(request.getParameter("codigoUsuario"));
        modelo.addAttribute("usuario", usuario);
        String foto ="";
        if(usuario.getFoto()!=null && usuario.getFoto().length > 0){
            foto = Base64.getEncoder().encodeToString(usuario.getFoto());
            modelo.addAttribute("foto64", foto);
        }
        return "fotoUsuario";
    }
    
    @RequestMapping("fotoGrabar")
    public ModelAndView fotoGrabar(@RequestParam("archivo") CommonsMultipartFile archivo, @RequestParam("codigoUsuario") String codigoUsuario){
        
        UsuarioDTO usuario = usuarioService.getUsuario(codigoUsuario);
        usuario.setFoto(archivo.getBytes());
        
        return new ModelAndView("usuariosLista", "lista", usuarioService.getListaUsuarios());
    }
    
}
