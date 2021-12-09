package com.jduncan.pokebook1.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jduncan.pokebook1.models.Expense;
import com.jduncan.pokebook1.services.ExpenseService;

@Controller
public class MainController {
	
	@Autowired
	ExpenseService expenseService;
	
	// ****** DISPLAY ROUTES ******
	
	// Get for combined dashboard (form + table)
	@GetMapping("/")
	public String dashboard(Model model) {
		Expense newExpense = new Expense();
		model.addAttribute("newExpense", newExpense);
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		
		return "dashboard.jsp";
	}
	
	// ****** ACTION ROUTES ******

	// CREATE
	// Post for handling creation of new expense, and validations
	@PostMapping("/")
	public String processCreateExpense(@Valid @ModelAttribute("newExpense") Expense newExpense,
			BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "dashboard.jsp";
		} else {
			expenseService.addExpense(newExpense);
			return "redirect:/";
		}
	}
	
}
