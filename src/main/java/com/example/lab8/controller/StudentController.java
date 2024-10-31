package com.example.lab8.controller;



import com.example.lab8.dao.FacultadDao;
import com.example.lab8.dao.StudentDao;
import com.example.lab8.entity.Student;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "/students")
public class StudentController {

    final FacultadDao facultadDao;
    final StudentDao studentDao;


    public StudentController(FacultadDao facultadDao, StudentDao studentDao) {
        this.facultadDao = facultadDao;
        this.studentDao = studentDao;
    }

    @GetMapping({"/list", "", "/"})
    public String listarStudents (Model model) {
        //model.addAttribute("listaProductos", productRepository.findAll());
        model.addAttribute("listaStudents", studentDao.listar());
        return "list";
    }

    @GetMapping("/new")
    public String nuevoProductoFrm(@ModelAttribute("student") Student student, Model model) {
        //model.addAttribute("listaCategorias", categoryRepository.findAll());
        model.addAttribute("listaStudent", studentDao.listar());
        //model.addAttribute("listaProveedores", supplierRepository.findAll());
        model.addAttribute("listaFacultad", facultadDao.listar());
        return "form";
    }

    @PostMapping("/save")
    public String guardarProducto(@ModelAttribute("student") @Valid Student student, BindingResult bindingResult,
                                  Model model, RedirectAttributes attr) {

        if (bindingResult.hasErrors()) {
            //model.addAttribute("listaCategorias", categoryRepository.findAll());
            //model.addAttribute("listaProveedores", supplierRepository.findAll());
            model.addAttribute("listaStudent", studentDao.listar());
            model.addAttribute("listaFacultad", facultadDao.listar());
            return "form";
        } else {
            String msg = "Estudiante " + (student.getIdstudents() == 0 ? "creado" : "actualizado") + " exitosamente";
            attr.addFlashAttribute("msg", msg);
      ;
            studentDao.guardar(student); //voy a hacer la validación de guardar o actualizar en el dao.
            return "redirect:/students";
        }
    }

    @GetMapping("/edit")
    public String editarStudent(@ModelAttribute("student") Student student,
                                      Model model, @RequestParam("id") int id) {


        Student student1 = studentDao.buscarPorId(id);


        if(student1 != null) {

            student = student1;
            model.addAttribute("student", student);

            model.addAttribute("listaStudent", studentDao.listar());
            model.addAttribute("listaFacultad", facultadDao.listar());
            return "form";
        } else {
            return "redirect:/students";
        }
    }

    @GetMapping("/delete")
    public String borrarStudent(Model model, @RequestParam("id") int id, RedirectAttributes attr) {

        //Optional<Product> optProduct = productRepository.findById(id);

        //if (optProduct.isPresent()) {
        //productRepository.deleteById(id);
        studentDao.deleteStudentById(id);
        attr.addFlashAttribute("msg", "Producto borrado exitosamente");
        //}
        return "redirect:/students";

    }
}
