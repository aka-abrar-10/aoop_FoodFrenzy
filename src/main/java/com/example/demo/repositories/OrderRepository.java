package com.example.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Orders;
import com.example.demo.entities.User;

@Repository
public interface OrderRepository extends JpaRepository<Orders, Integer> {
	List<Orders> findOrdersByUser(User user);
}