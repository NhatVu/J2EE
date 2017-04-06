package spittr.web;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {

  @RequestMapping(method = GET)
  public String home(Model model) {
    return "home";
  }
  
  @RequestMapping(value="login", method= GET)
  public String login(Principal  principal){
//	  if(SecurityContextHolder.getContext().getAuthentication() != null 
//			  && SecurityContextHolder.getContext().getAuthentication().isAuthenticated())
//		  return "redirect:home";
//	  return "login";
	  if(principal == null)
		  return "login";
	  return "redirect:/";
  }
  
  @RequestMapping(value="logout", method = RequestMethod.GET)
  public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      if (auth != null){    
          new SecurityContextLogoutHandler().logout(request, response, auth);
      }
      return "redirect:/login";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
  }

}
