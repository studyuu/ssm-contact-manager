package com.example.contactmanager.dao;

import com.example.contactmanager.entity.Infro;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InfroDao {
    void addContact(Infro infro);
    void deleteContact(String id);
    void editContact(Infro infro);
    Infro searchContact(String id);
    List<Infro> getAllContacts();
}    