package edu.cibertec.capitulo3.service;

import edu.cibertec.capitulo3.dao.UsuarioDAO;
import edu.cibertec.capitulo3.dao.entity.UsuarioEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {
    
    @Autowired
    private UsuarioDAO usuarioDao;
    
    public List<UsuarioEntity> getListaUsuarios(){
        return usuarioDao.findAll();
    }
    
    public void insertarUsuario(UsuarioEntity usuario){
        usuarioDao.save(usuario);
    }
    
    public UsuarioEntity getUsuario(String codigo){
        UsuarioEntity rpta = null;
        Optional<UsuarioEntity> busqueda = usuarioDao.findById(codigo);
        if(busqueda.isPresent())
            rpta = busqueda.get();
        return rpta;
    }
    
    public UsuarioEntity validarLogin(UsuarioEntity usuario){
        UsuarioEntity rpta = getUsuario(usuario.getUsuario());
        if(rpta == null)
                return rpta;
        
        if(!rpta.getClave().equalsIgnoreCase(usuario.getClave()))
            rpta = null;
        
        return rpta;
        
    }
    
    public void eliminarUsuario(String codigo){
        usuarioDao.deleteById(codigo);
    }
    
}
