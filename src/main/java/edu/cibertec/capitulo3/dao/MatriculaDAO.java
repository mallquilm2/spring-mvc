/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package edu.cibertec.capitulo3.dao;

import edu.cibertec.capitulo3.dao.entity.MatriculaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author miguel
 */
public interface MatriculaDAO extends JpaRepository<MatriculaEntity, Integer>{
    
}
