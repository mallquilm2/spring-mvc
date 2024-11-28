
package edu.cibertec.capitulo3.controller;

import edu.cibertec.capitulo3.service.CursoService;
import java.text.DateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CursoController {
    
    @Autowired
    private CursoService cursoService;
    
    @RequestMapping("cursoMostrar")
    public String cursoMostrar(){
        return "cursoBusqueda";
    }
    
    @RequestMapping("cursoBusqueda")
    public ModelAndView busquedaAccion(@RequestParam("tipo") String tipo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView("cursoBusqueda");
        
        switch (tipo) {
            case "estado":
                int estado = Integer.parseInt(request.getParameter("estado"));
                mv.addObject("lista", cursoService.consultaPorEstado(estado));
                break;
            case "incompleto":
                mv.addObject("lista", cursoService.abiertoIncompleto());
                break;
            case "faltante":
                int faltante = Integer.parseInt(request.getParameter("numero"));
                mv.addObject("lista", cursoService.consultarFaltantes(faltante));
                break;
            case "porFecha":
                Date d = new Date(request.getParameter("fecha"));
                String fecha = d.toString();
                //DateFormat df = new DateFormat("dd-mm-yyy");
                mv.addObject("lista", cursoService.consultarPorFecha(d));
                break;
            case "nombre":
                String nombre = request.getParameter("nombreCurso");
                mv.addObject("lista", cursoService.consultarPorNombre(nombre));
                break;
        }
        
        return mv;
    }
    
}
