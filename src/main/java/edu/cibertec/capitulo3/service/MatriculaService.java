/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.cibertec.capitulo3.service;

import edu.cibertec.capitulo3.dao.MatriculaDAO;
import edu.cibertec.capitulo3.dao.entity.MatriculaEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author miguel
 */
@Service
public class MatriculaService {
    
    @Autowired
    private MatriculaDAO matriculaDAO;
    
    public List<MatriculaEntity> listarMatriculas (){
        return matriculaDAO.findAll();
    }
    
    public void grabarMatricula(MatriculaEntity matricula){
        matriculaDAO.save(matricula);
    }
    
}
