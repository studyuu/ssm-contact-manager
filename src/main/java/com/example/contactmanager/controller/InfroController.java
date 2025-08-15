package com.example.contactmanager.controller;

import com.example.contactmanager.entity.Infro;
import com.example.contactmanager.entity.User;
import com.example.contactmanager.service.InfroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/contacts")
public class InfroController {
    @Autowired
    private InfroService infroService;

    private boolean isUserLoggedIn(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user != null;
    }

    @GetMapping("/list")
    public String listContacts(Model model, HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/user/login";
        }
        List<Infro> contacts = infroService.getAllContacts();
        model.addAttribute("contacts", contacts);
        return "contactList";
    }

    @GetMapping("/add")
    public String showAddForm(Model model, HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/user/login";
        }
        model.addAttribute("infro", new Infro());
        return "addContact";
    }

    @PostMapping("/add")
    public String addContact(@ModelAttribute Infro infro, HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/user/login";
        }
        infroService.addContact(infro);
        return "redirect:/contacts/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model, HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/user/login";
        }
        System.out.println("接收到的编辑ID: " + id);
        Infro contact = infroService.searchContact(id);
        if (contact == null) {
            System.out.println("根据ID未查询到联系人信息");
            return "redirect:/contacts/list";
        }
        model.addAttribute("infro", contact);
        return "editContact";
    }

    @PostMapping("/edit")
    public String editContact(@ModelAttribute Infro infro, HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/user/login";
        }
        infroService.editContact(infro);
        return "redirect:/contacts/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteContact(@PathVariable String id, HttpSession session) {
        if (!isUserLoggedIn(session)) {
            return "redirect:/user/login";
        }
        infroService.deleteContact(id);
        return "redirect:/contacts/list";
    }
}