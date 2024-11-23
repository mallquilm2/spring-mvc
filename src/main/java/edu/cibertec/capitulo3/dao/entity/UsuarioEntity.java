/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo3.dao.entity;

import java.util.Base64;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="usuario")
public class UsuarioEntity {
    
    @Size(min=3, max=20)
    @Id
    private String usuario;
    
    @NotNull
    @NotBlank()
    @Column(nullable = false)
    private String clave;
    
    @Column(name = "nomCompleto")
    private String nombreCompleto;
    
    @Column
    private byte[] foto;
    
    @Transient
    private String fotoBase64;
    
    public String obtenerFotoBase(){
        String rpta= null;
        if(foto != null && foto.length >0)
            rpta = Base64.getEncoder().encodeToString(foto);
        
        return rpta;
    }

}
