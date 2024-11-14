/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.dao;

import edu.cibertec.capitulo2.model.UsuarioDTO;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO {
    
    public UsuarioDTO validarLogin(UsuarioDTO usuario){
        if(usuario.getUsuario().equalsIgnoreCase("user") && usuario.getClave().equalsIgnoreCase("12345"))
            usuario.setNombreCompleto("Luis Mallqui");
        else
            usuario = null;
        return usuario;
    }
    
}
