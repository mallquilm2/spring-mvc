/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.service;

import edu.cibertec.capitulo2.dao.UsuarioDAO;
import edu.cibertec.capitulo2.model.UsuarioDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {
    
    @Autowired
    private UsuarioDAO usuarioDao;
    
    public UsuarioDTO validarLogin(UsuarioDTO usuario){
        return usuarioDao.validarLogin(usuario);
    }
    
}
