package com.vams.config;

import com.vams.model.Role;
import com.vams.model.User;
import com.vams.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        // Ensure default owner/admin account exists and has the correct Role
        User admin = userRepository.findByUsername("admin").orElse(new User());
        admin.setUsername("admin");
        admin.setPassword(passwordEncoder.encode("321654"));
        admin.setRole(Role.OWNER); // Set as Super Admin (Owner)
        admin.setName("System Owner");
        admin.setEmailVerified(true);
        userRepository.save(admin);
        
        System.out.println("=========================================");
        System.out.println("Default OWNER account updated/created!");
        System.out.println("User ID: admin");
        System.out.println("Role: OWNER");
        System.out.println("=========================================");
    }
}
