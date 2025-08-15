package com.example.contactmanager.service;

import com.example.contactmanager.entity.Infro;

import java.util.List;

public interface InfroService {
    void addContact(Infro infro);
    void deleteContact(String id);
    void editContact(Infro infro);
    Infro searchContact(String name);
    List<Infro> getAllContacts();
}    