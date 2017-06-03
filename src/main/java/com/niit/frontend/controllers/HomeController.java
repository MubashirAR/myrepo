package com.niit.frontend.controllers;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.backend.dao.CartDAO;
import com.niit.backend.dao.CategoryDAO;
import com.niit.backend.dao.ProductDAO;
import com.niit.backend.dao.ShippingAddressDAO;
import com.niit.backend.dao.SupplierDAO;
import com.niit.backend.dao.UserDAO;
import com.niit.backend.model.Category;
import com.niit.backend.model.MyCart;
import com.niit.backend.model.Product;
import com.niit.backend.model.ShippingAddress;
import com.niit.backend.model.Supplier;
import com.niit.backend.model.User;
import com.niit.frontend.util.FileUploadUtilility;

@Controller
public class HomeController {

	@Autowired
	private HttpSession session;

	@Autowired
	public Category category;

	@Autowired
	public CategoryDAO categoryDAO;
	@Autowired
	public User user;
	@Autowired
	public UserDAO userDAO;

	@Autowired
	public ProductDAO productDAO;

	@Autowired
	public SupplierDAO supplierDAO;

	@Autowired
	public Supplier supplier;

	@Autowired
	public Product product;

	@Autowired
	public CartDAO cartDAO;

	@Autowired
	public MyCart cart;
	
	@Autowired
	public ShippingAddress shippingaddress;
	
	@Autowired
	ShippingAddressDAO shippingaddressDAO;
	
	

	@RequestMapping({ "/", "home" })

	public ModelAndView landingPage() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loggedInUser = auth.getName();

		ModelAndView mv = new ModelAndView("home");
		mv.addObject("Categories", categoryDAO.list());
		mv.addObject("show_categories", true);
		mv.addObject("show_carousel", true);
		mv.addObject("Products", productDAO.list());
		mv.addObject("cartitems", cartDAO.list(loggedInUser));
		mv.addObject("cartList", cartDAO.list(loggedInUser));
		mv.addObject("image",  hashCode());
		mv.addObject("isClickedHome", true);
		mv.addObject("Supplier", supplierDAO.list());
		mv.addObject("navproducts", categoryDAO.list());

		return mv;
	}

	@RequestMapping("/login")
	public ModelAndView loginPage() {

		ModelAndView mv = new ModelAndView("home");

		mv.addObject("isClickedLogin", true);
		mv.addObject("msg", "This user is logged in");
		mv.addObject("navproducts", categoryDAO.list());

		return mv;
	}
	
	@RequestMapping(value="/show_product{id}", method = RequestMethod.GET)
	public ModelAndView showProductPage(@PathVariable("id") String id) {

		ModelAndView mv = new ModelAndView("home");
		mv.addObject("show_product_page", true);
		mv.addObject("product_list", productDAO.list());
		mv.addObject("supplier_list", supplierDAO.list());
		mv.addObject("pid", id);
		mv.addObject("navproducts", categoryDAO.list());


		return mv;
	}

	@RequestMapping("/loginError")
	public ModelAndView loginErrorPage() {

		ModelAndView mv = new ModelAndView("home");

		mv.addObject("isInvalidLogin", true);
		mv.addObject("navproducts", categoryDAO.list());

		return mv;
	}

	@RequestMapping("/about")
	public ModelAndView goToAbout() {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("show_about", true);
		mv.addObject("navproducts", categoryDAO.list());
		
		return mv;
	}

	@RequestMapping("/contact")
	public ModelAndView goToContact() {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("show_contact", "true");
		mv.addObject("navproducts", categoryDAO.list());
		return mv;
	}

	@RequestMapping("/cart")
	public ModelAndView cartPage() {

		ModelAndView mv = new ModelAndView("home");

		mv.addObject("isClickedCart", true);
		mv.addObject("msg", "This user is cart");
		mv.addObject("isUserLoggedIn", true);
		mv.addObject("navproducts", categoryDAO.list());
		return mv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout() {
		// log.debug("running logout method");
		ModelAndView mv = new ModelAndView("forward:/");
		session.invalidate();
		// mv.addObject("isUserClickLogout","true");
		// log.debug("endig logout method");
		mv.addObject("successMessage", "successfully logged-out");
		mv.addObject("thisIsHome", "true");
		mv.addObject("navproducts", categoryDAO.list());

		return mv;

	}

	@RequestMapping("/register_page")
	public ModelAndView registerPage() {

		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isClickedRegister", true);
		mv.addObject("navproducts", categoryDAO.list());

		return mv;
	}

	@RequestMapping("/validation")
	/*
	 * public ModelAndView validate(@RequestParam("username") String
	 * id, @RequestParam("password") String password) { ModelAndView mv = new
	 * ModelAndView("home"); mv.addObject("empty", "loginMessage");
	 * mv.addObject("isUserLoggedIn", "false"); if (userDAO.validate(id,
	 * password) == true) { mv.addObject("isUserLoggedIn", true); user =
	 * userDAO.getUser(id); if (user.getRole().equals("admin")) { mv = new
	 * ModelAndView("/home"); mv.addObject("isAdmin", true); } else {
	 * mv.addObject("isAdmin", "false"); } mv.addObject("msg",
	 * "Valid Credential"); } else { mv.addObject("msg",
	 * "InValid Credential please try again"); } return mv; }
	 */

	public ModelAndView validate() {
		ModelAndView mv = new ModelAndView("redirect:/home");/*
		mv.addObject("isAdmin", true);
		mv.addObject("Products", productDAO.list());*/
		mv.addObject("Categories", categoryDAO.list());
		mv.addObject("show_categories", true);
		mv.addObject("show_carousel", true);
		mv.addObject("Products", productDAO.list());
		mv.addObject("isClickedHome", true);
		mv.addObject("Supplier", productDAO.list());
		mv.addObject("isClickedHome", true);
		mv.addObject("navproducts", categoryDAO.list());
		

		return mv;
	}

	@RequestMapping(value = "/register")
	public String addUser(@ModelAttribute("from-reg") User user, Model model) {
		user.setRole("ROLE_USER");
		if (userDAO.save(user) == true) {
			model.addAttribute("msg", "Successfully Registered");
			model.addAttribute("registered", true);
		} else {
			model.addAttribute("msg", "not able to register");
		}
		model.addAttribute("navproducts", categoryDAO.list());
		return "redirect:/login";
	}

	@RequestMapping(value = "/addcategory")
	public String addCategory(@ModelAttribute("from-reg") Category category, Model model) {
		model.addAttribute("isAdmin", true);

		if (categoryDAO.save(category) == true) {
			model.addAttribute("msg", "Successfully added");
			model.addAttribute("registered", true);
		} else {
			model.addAttribute("msg", "not able to add");
		}
		model.addAttribute("navproducts", categoryDAO.list());
		return "redirect:/home";
	}

	@RequestMapping(value = "/addproduct")
	public String addCategory(@ModelAttribute("from-reg") Product product, Model model, HttpServletRequest request) {
		model.addAttribute("isAdmin", true);

		if (productDAO.save(product) == true) {
			model.addAttribute("msg", "Successfully added");
			model.addAttribute("registered", true);
		} else {
			model.addAttribute("msg", "not able to add");
		}
		
		
		if(!product.getFile().getOriginalFilename().equals(""))
		{
			FileUploadUtilility.uploadFile(request,product.getFile(),product.hashCode(),product.getId());
		}
		model.addAttribute("navproducts", categoryDAO.list());
		
		return "redirect:/home";
	}

	@RequestMapping(value = "/addsupplier")
	public String addCategory(@ModelAttribute("from-reg") Supplier supplier, Model model) {
		model.addAttribute("isAdmin", true);

		if (supplierDAO.save(supplier) == true) {
			model.addAttribute("msg", "Successfully added");
			model.addAttribute("registered", true);
		} else {
			model.addAttribute("msg", "not able to add");
		}
		model.addAttribute("navproducts", categoryDAO.list());
		return "redirect:/home";
	}

	@RequestMapping("/show_add_category")
	public ModelAndView showCategory() {

		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isAdmin", true);
		mv.addObject("isClickedCategory", true);
		mv.addObject("Categories", categoryDAO.list());
		mv.addObject("navproducts", categoryDAO.list());


		return mv;
	}

	@RequestMapping("/show_add_product")
	public ModelAndView showProduct() {

		session.getAttribute("loggedInUser");

		ModelAndView mv = new ModelAndView("/home");

		List<Product> productList = productDAO.list();

		List<Supplier> supplierList = supplierDAO.list();

		List<Category> categoryList = categoryDAO.list();

		mv.addObject("Products", productList);

		mv.addObject("product", productDAO.list());

		mv.addObject("supplierList", supplierList);

		mv.addObject("supplier", supplier);

		mv.addObject("categoryList", categoryList);

		mv.addObject("category", category);

		mv.addObject("isAdminClickedproducts", true);

		mv.addObject("isAdmin", true);

		mv.addObject("isClickedProduct", true);
		
		mv.addObject("product_list", productDAO.list());
		
		mv.addObject("product_id", "");
		
		mv.addObject("product_object", product);
		
		mv.addObject("navproducts", categoryDAO.list());


		return mv;

	}

	@RequestMapping("/show_add_supplier")
	public ModelAndView showSupplier() {

		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isAdmin", true);
		mv.addObject("isClickedSupplier", true);
		mv.addObject("Supplier", supplierDAO.list());
		mv.addObject("navproducts", categoryDAO.list());

		return mv;
	}
	
	
	
	@RequestMapping(value = "myCart/add/{id}", method = RequestMethod.GET)
	public ModelAndView addToCart(@PathVariable("id") String id) {
		
		// get the product based on product id
		Product product = productDAO.getProductByID(id);
		cart.setPrice((int)product.getPrice());
		cart.setName(product.getName());

		String loggedInUser = (String) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {

			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUser = auth.getName();
		}
		// myCart.setId(11l);
		cart.setQuantity(1);
		cart.setUserId(loggedInUser);
		// It is not required if you given default value while creating the
		// table
		cart.setStatus('N'); // Status is New. Once it is dispatched, we can
								// changed to 'D'
		
		cart.setAddedDate(new Date());

		// To get sequence number, you can do programmatically in DAOImpl
		// myCart.setId(ThreadLocalRandom.current().nextLong(100, 1000000 + 1));

		cartDAO.save(cart);
		
		// return "redirect:/views/home.jsp";

		ModelAndView mv = new ModelAndView("redirect:/home");
		mv.addObject("successMessage", " Successfuly add the product to myCart");
		mv.addObject("navproducts", categoryDAO.list());

		return mv;

	}

/*	@RequestMapping(value = "/add_to_cart")
	public ModelAndView addToCart(Principal principal) {
		MyCart cart = new MyCart();
		ModelAndView mv = new ModelAndView("/home");
		cart.setId((long) 2);
		cart.setName("name");
		cart.setPrice(1300);
		cart.setQuantity(12);
		cart.setStatus('A');
		cart.setUserId(principal.getName());
		cart.setAddedDate(new Date());
		if (cartDAO.save(cart) == true) {
			mv.addObject("msg", "Successfully Registered");
			mv.addObject("registered", true);
		} else {
			mv.addObject("msg", "not able to register");
		}
		return mv;
	}*/

	@RequestMapping("/myCart")

	public ModelAndView listCart() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loggedInUser = auth.getName();

		ModelAndView mv = new ModelAndView("/home");

		

		mv.addObject("cartList", cartDAO.list(loggedInUser));
		mv.addObject("show_cart", true);
		mv.addObject("Products", productDAO.list());
		mv.addObject("navproducts", categoryDAO.list());

		return mv;
	}
	
	@RequestMapping(value = "myCart/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteCartItem(@PathVariable("id") String id) {
		ModelAndView mv= new ModelAndView("redirect:/myCart");
		cartDAO.delete(id);
		mv.addObject("navproducts", categoryDAO.list());

		
		return mv;

	}

	
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public ModelAndView display_category(@PathVariable("id") String id)
	{
		
		ModelAndView mv=new ModelAndView("/home");
		mv.addObject("products", productDAO.list());
		mv.addObject("display_category", true);
		mv.addObject("category_id", id);
		mv.addObject("navproducts", categoryDAO.list());

		return mv;
	}
	
	@RequestMapping(value = "deleteproduct/{id}", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable("id") String id) {
		ModelAndView mv= new ModelAndView("redirect:/show_add_product");
		productDAO.delete(id);
		mv.addObject("navproducts", categoryDAO.list());

		
		return mv;

	}	@RequestMapping(value = "deletecategory/{id}", method = RequestMethod.GET)
	public ModelAndView deleteCategory(@PathVariable("id") String id) {
		ModelAndView mv= new ModelAndView("redirect:/show_add_category");
		categoryDAO.delete(id);
		mv.addObject("navproducts", categoryDAO.list());

		
		return mv;

	}	@RequestMapping(value = "deletesupplier/{id}", method = RequestMethod.GET)
	public ModelAndView deleteSupplier(@PathVariable("id") String id) {
		ModelAndView mv= new ModelAndView("redirect:/show_add_supplier");
		supplierDAO.delete(id);
		mv.addObject("navproducts", categoryDAO.list());

		
		return mv;

	}
	
	@RequestMapping(value = "show_add_supplier{id}", method = RequestMethod.GET)
	public ModelAndView editSupplier(@PathVariable("id") String id) {
		ModelAndView mv= new ModelAndView("/home");
		mv.addObject("supplier_id", id);
		mv.addObject("suppliers", supplierDAO.list());
		mv.addObject("isClickedSupplier", true);
		mv.addObject("Supplier", supplierDAO.list());/*
		mv.addObject("isClickedHome", true);*/
		mv.addObject("navproducts", categoryDAO.list());


		return mv;

	}
	
	@RequestMapping(value = "show_add_product{id}", method = RequestMethod.GET)
	public ModelAndView editProduct(@PathVariable("id") String id) {
		ModelAndView mv= new ModelAndView("/home");
		mv.addObject("product_id", id);
		mv.addObject("product", productDAO.list());
		mv.addObject("Products", productDAO.list());
		mv.addObject("isClickedProduct", true);
		mv.addObject("Supplier", supplierDAO.list());
		mv.addObject("categoryList", categoryDAO.list());
		mv.addObject("supplierList", supplierDAO.list());
		mv.addObject("product_object", product);
		mv.addObject("navproducts", productDAO.list());


		return mv;

	}
	
	
	@RequestMapping("/checkout")
	public ModelAndView checkOut()
	{

/*		log.debug("This is ***************lastPage");
*/		
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");
		
/*		log.info("the logged in ********USER ID***********"+ loggedInUserid );
*/		
		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)   auth.getAuthorities();
			authorities.contains("ROLE_USER");
			
		}
		
/*		log.info("the logged in ********USER ID***********"+ loggedInUserid );
*/		
		List<MyCart> cartlist = cartDAO.list(loggedInUserid);
		
		int catsize = cartDAO.list(loggedInUserid).size();
		
/*		log.info("the ****SIZE IS******"+catsize);
*/	
		for(MyCart listall : cartlist)
		{
			
			cart.setId(listall.getId());;
			
			cartDAO.delete(cart);
			
			/*log.info("****THE CATSIZE**** "+catsize);*/
		}
		
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("checkout", true);
		mv.addObject("address_object", shippingaddress);
		mv.addObject("AddressPage", true);
/*		log.debug("This is end ************of lastpage");
*/		return mv;
	}
	@RequestMapping("/checkedout")
	public String checkedOutPage(@ModelAttribute("from-reg") ShippingAddress shippingAddress, Model model)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loggedInUser = auth.getName();
		shippingaddress.setId(loggedInUser);
		shippingaddress.setUser_id(loggedInUser);
		if (shippingaddressDAO.save(shippingaddress) == true) {
			model.addAttribute("msg", "Successfully Registered");
			model.addAttribute("registered", true);
		} else {
			model.addAttribute("msg", "not able to register");
		}
		model.addAttribute("navproducts", categoryDAO.list());
		ModelAndView mv=new ModelAndView("/home");
		mv.addObject("checkedOut", true);
		
		
		
		return "/home";
	}
	


	
}
