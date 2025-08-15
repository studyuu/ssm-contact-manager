package com.example.contactmanager.service.impl;

import com.example.contactmanager.dao.InfroDao;
import com.example.contactmanager.entity.Infro;
import com.example.contactmanager.service.InfroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class InfroServiceImpl implements InfroService {
    @Autowired
    private InfroDao infroDao;

    @Override
    public void addContact(Infro infro) {
        infroDao.addContact(infro);
    }

    @Override
    public void deleteContact(String id) {
        infroDao.deleteContact(id);
    }

    @Override
    public void editContact(Infro infro) {
        infroDao.editContact(infro);
    }

    @Override
    public Infro searchContact(String name) {
        return infroDao.searchContact(name);
    }

    @Override
    public List<Infro> getAllContacts() {
        return infroDao.getAllContacts();
    }
}    