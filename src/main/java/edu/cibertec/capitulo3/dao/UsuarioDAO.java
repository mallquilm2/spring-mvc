/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo3.dao;

import edu.cibertec.capitulo3.dao.entity.UsuarioEntity;
import java.util.ArrayList;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface UsuarioDAO extends JpaRepository<UsuarioEntity, String>{
    /*
    private List<UsuarioEntity> listaUsuarios;
    
    public UsuarioDAO(){
        listaUsuarios = new ArrayList<>();
        listaUsuarios.add(new UsuarioEntity("jose", "12345", "José Perez",null));
        listaUsuarios.add(new UsuarioEntity("maria", "12345", "Maria Lupita",null));
        listaUsuarios.add(new UsuarioEntity("Pedro", "12345", "Pedro Tenorio",null));
    }
    
    public UsuarioEntity getUsuario(String codigo){
        UsuarioEntity rpta = null;
        
        for(UsuarioEntity usuario:listaUsuarios){
            if(usuario.getUsuario().equalsIgnoreCase(codigo)){
                rpta = usuario;
            }
        }
        return rpta;
    }
    
    public void insertarUsuario(UsuarioEntity usuario){
        listaUsuarios.add(usuario);
    }
    
    public List<UsuarioEntity> getListaUsuarios(){
        return listaUsuarios;
    }
    
    public UsuarioEntity validarLogin(UsuarioEntity usuario){
        if(usuario.getUsuario().equalsIgnoreCase("user") && usuario.getClave().equalsIgnoreCase("12345"))
            usuario.setNombreCompleto("Luis Mallqui");
        else
            usuario = null;
        return usuario;
    }
*/
    
}
