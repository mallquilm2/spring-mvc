
package edu.cibertec.capitulo3.service;

import edu.cibertec.capitulo3.dao.CursoDAO;
import edu.cibertec.capitulo3.dao.entity.CursoEntity;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

@Service
public class CursoService {
    
    @Autowired
    CursoDAO cursoDAO;
    
    public List<CursoEntity> consultaPorEstado(int estado){
        return cursoDAO.consultaPorEstado(estado);
    }
    
    
    public List<CursoEntity> abiertoIncompleto(){
        return cursoDAO.abiertoIncompleto();
    }
    
    
    public List<CursoEntity> consultarFaltantes(Integer cantidad){
        return cursoDAO.consultarFaltantes(cantidad);
    }
    
    
    public List<CursoEntity> consultarPorFecha(Date fecha){
        return cursoDAO.consultarPorFecha(fecha);
    }
    
    
    public List<CursoEntity> consultarPorNombre(String cadena){
        return cursoDAO.consultarPorNombre(cadena);
    }
    
    
}
