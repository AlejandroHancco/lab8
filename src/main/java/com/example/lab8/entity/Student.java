package com.example.lab8.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Student {

    private int idstudents;
    private String dni;
    private String nombre;
    private double gpa;
    private int creditos;
    private Facultad facultad_idfacultad;
}


