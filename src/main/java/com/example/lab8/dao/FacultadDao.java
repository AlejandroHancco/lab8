package com.example.lab8.dao;


import com.example.lab8.entity.Facultad;
import com.example.lab8.entity.Student;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class FacultadDao {

    public List<Facultad> listar() {

        List<Facultad> lista = new ArrayList<>();

        RestTemplate restTemplate = new RestTemplate();

        String endPoint = "http://localhost:8080/supplier";

        ResponseEntity<Facultad[]> responseEntity = restTemplate.getForEntity(endPoint, Facultad[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            Facultad[] body = responseEntity.getBody();
            assert body != null;
            lista = Arrays.asList(body);
        }

        return lista;
    }
}
