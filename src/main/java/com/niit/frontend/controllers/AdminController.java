package com.niit.frontend.controllers;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.backend.dao.CategoryDAO;
import com.niit.backend.dao.ProductDAO;
import com.niit.backend.dao.SupplierDAO;
import com.niit.backend.model.Category;
import com.niit.backend.model.Product;
import com.niit.backend.model.Supplier;



@Controller
public class AdminController {


	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private Product product;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	@Autowired
	private Supplier supplier;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private HttpSession session;
	
	
	
	@RequestMapping(value = "/add_Product_Value" , method = {RequestMethod.POST})
	public String addProduct(@Valid @ModelAttribute("product") Product product,BindingResult result,
			HttpServletRequest request,@RequestParam String action ,Model model)
	{
	
		
		if (result.hasErrors()) {
			model.addAttribute("product", product);
			model.addAttribute("products", productDAO.list());
			System.out.println("Found Errors in inputs");
			return "/admin";
		}
		
		if(action.equals("save")){
			
			productDAO.update(product);
			
			
			MultipartFile file = product.getFile();
			String originalFile = file.getOriginalFilename();

			String filepath = request.getSession().getServletContext().getRealPath("resources/images/");
			System.out.println("File path is " + filepath);
			String filename = filepath + "\\" + product.getId() + ".jpg";
			System.out.println("File path is " + filepath);

			try {
				byte image[] = product.getFile().getBytes();
				BufferedOutputStream bof = new BufferedOutputStream(new FileOutputStream(filename));
				bof.write(image);
				bof.close();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}else {
			productDAO.update(product);
			
			MultipartFile file = product.getFile();
			String originalFile = file.getOriginalFilename();

			String filepath = request.getSession().getServletContext().getRealPath("resources/images/");
			System.out.println("File path is " + filepath);
			String filename = filepath + "\\" + product.getId() + ".jpg";
			System.out.println("File path is " + filepath);

			try {
				byte image[] = product.getFile().getBytes();
				BufferedOutputStream bof = new BufferedOutputStream(new FileOutputStream(filename));
				bof.write(image);
				bof.close();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
		model.addAttribute("product", product);
		model.addAttribute("productList", productDAO.list());
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.list());
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.list());
/*		model.addAttribute("isAdminClickedproducts", true);	
		model.addAttribute("isClickedProduct", true);*/

		
	return "/home";
	}
}
