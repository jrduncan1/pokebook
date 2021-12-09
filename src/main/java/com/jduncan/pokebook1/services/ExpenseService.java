package com.jduncan.pokebook1.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jduncan.pokebook1.models.Expense;
import com.jduncan.pokebook1.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	@Autowired
	ExpenseRepository expenseRepo;
	
	public List<Expense> allExpenses() {
		return expenseRepo.findAll();
	}
	
	public Expense addExpense(Expense expense) {
		return expenseRepo.save(expense);
	}
}
