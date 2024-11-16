/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo2.dao;

import edu.cibertec.capitulo2.model.UsuarioDTO;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAO {
    
    private List<UsuarioDTO> listaUsuarios;
    
    public UsuarioDAO(){
        listaUsuarios = new ArrayList<>();
        listaUsuarios.add(new UsuarioDTO("jose", "12345", "José Perez",null));
        listaUsuarios.add(new UsuarioDTO("maria", "12345", "Maria Lupita",null));
        listaUsuarios.add(new UsuarioDTO("Pedro", "12345", "Pedro Tenorio",null));
    }
    
    public UsuarioDTO getUsuario(String codigo){
        UsuarioDTO rpta = null;
        
        for(UsuarioDTO usuario:listaUsuarios){
            if(usuario.getUsuario().equalsIgnoreCase(codigo)){
                rpta = usuario;
            }
        }
        return rpta;
    }
    
    public void insertarUsuario(UsuarioDTO usuario){
        listaUsuarios.add(usuario);
    }
    
    public List<UsuarioDTO> getListaUsuarios(){
        return listaUsuarios;
    }
    
    public UsuarioDTO validarLogin(UsuarioDTO usuario){
        if(usuario.getUsuario().equalsIgnoreCase("user") && usuario.getClave().equalsIgnoreCase("12345"))
            usuario.setNombreCompleto("Luis Mallqui");
        else
            usuario = null;
        return usuario;
    }
    
}
