/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.service;

import edu.cibertec.capitulo2.dao.UsuarioDAO;
import edu.cibertec.capitulo2.model.UsuarioDTO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {
    
    @Autowired
    private UsuarioDAO usuarioDao;
    
    public List<UsuarioDTO> getListaUsuarios(){
        return usuarioDao.getListaUsuarios();
    }
    
    public void insertarUsuario(UsuarioDTO usuario){
        usuarioDao.insertarUsuario(usuario);
    }
    
    public UsuarioDTO validarLogin(UsuarioDTO usuario){
        return usuarioDao.validarLogin(usuario);
    }
    
}
