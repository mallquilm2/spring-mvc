/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo3.controller;

import edu.cibertec.capitulo3.dao.entity.UsuarioEntity;
import edu.cibertec.capitulo3.service.UsuarioService;
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
        ModelAndView mv = new ModelAndView("usuarioDatos", "usuarioBean", new UsuarioEntity());
        mv.addObject("accion", "Insertar")
        return mv;
    }
    
    @RequestMapping("usuarioGrabar")
    public ModelAndView grabarUsuario(@Valid @ModelAttribute("usuarioBean") UsuarioEntity usuario, BindingResult result, ModelMap modelo){
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
    public ModelAndView loginAccion(UsuarioEntity usuarioValida){
        ModelAndView mv = null;
        
        UsuarioEntity user = usuarioService.validarLogin(usuarioValida);
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
        UsuarioEntity usuario = usuarioService.getUsuario(request.getParameter("codigoUsuario"));
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
        
        UsuarioEntity usuario = usuarioService.getUsuario(codigoUsuario);
        usuario.setFoto(archivo.getBytes());
        
        return new ModelAndView("usuariosLista", "lista", usuarioService.getListaUsuarios());
    }
    
    @RequestMapping("usuarioMod")
    public ModelAndView usuarioModificar(@RequestParam("codigoUsuario" String codigo)){
        ModelAndView mv = new ModelAndView("usuarioDatos", "usuarioBean", usuarioService.getUsuario(codigo));
        mv.addObject("accion","Modificar");
        return mv;
    }
    
    /*
    @RequestMapping("usuarioEli")
    public ModelAndView usuarioEliminar(@RequestParam("codigoUsuario" String codigo)){
        ModelAndView mv = new ModelAndView("usuarioDatos", "usuarioBean", usuarioService.eliminarUsuario());
        return mv;
    }
*/
    
}
