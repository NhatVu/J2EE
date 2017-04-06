package spittr.web;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import spittr.bo.SpitterBO;
import spittr.bo.impl.SpitterBOImpl;
import spittr.model.SpitterModel;

@Controller
@RequestMapping("/spitter")
public class SpitterController {

	@Autowired
  private SpitterBO spitterRepository;

	@Inject
  public SpitterController(SpitterBOImpl spitterRepository) {
    this.spitterRepository = spitterRepository;
  }
  
  @RequestMapping(value="/register", method=GET)
  public String showRegistrationForm(Model model) {
    model.addAttribute(new SpitterModel());
    return "registerForm";
  }
  
  @RequestMapping(value="/register", method=POST)
  public String processRegistration(
      @Valid @ModelAttribute("spitter") SpitterModel spitter, 
      Errors errors) {
	
    if (errors.hasErrors()) {
      return "registerForm";
    }
    System.out.println(spitter.toString());
    spitterRepository.save(spitter);
    return "redirect:/spitter/" + spitter.getUsername();
  }
  
  @RequestMapping(value="/me", method=GET)
  public String me() {
    System.out.println("ME ME ME ME ME ME ME ME ME ME ME");
    return "home";
  }

  //@RequestParam(value="count", defaultValue="20") for query, ex: /spittles/1?count=4
  @RequestMapping(value="/{username}", method=GET)
  public String showSpitterProfile(@PathVariable String username, Model model) {
	SpitterModel spitter = spitterRepository.findByUsername(username);
    model.addAttribute("spitter",spitter);
    System.out.println(spitter.toString());
    return "profile";
  }
  
}
